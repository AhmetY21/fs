import { GoogleGenAI } from '@google/genai';
import { buildAnalysisSystemPrompt } from '@/lib/fengshui-system-prompt';
import { rateLimiter } from '@/lib/rate-limit';
import { Buffer } from 'node:buffer';

export async function POST(request) {
    try {
        // --- SECURITY: Rate Limiting ---
        const ip = (request.headers.get('x-forwarded-for') ?? '127.0.0.1').split(',')[0].trim();
        if (!rateLimiter(ip)) {
            return Response.json(
                { error: 'Rate limit exceeded. Please try again later.' },
                { status: 429 }
            );
        }
        // --- END SECURITY ---

        let imageBase64;
        let mimeType;

        const contentType = request.headers.get('content-type') || '';

        if (contentType.includes('multipart/form-data')) {
            const formData = await request.formData();
            const file = formData.get('file');

            if (!file) {
                return Response.json({ error: 'No image provided' }, { status: 400 });
            }

            // In FormData, file is a Blob/File object. We need to convert to Base64.
            if (typeof file === 'object' && typeof file.arrayBuffer === 'function') {
                const arrayBuffer = await file.arrayBuffer();
                const buffer = Buffer.from(arrayBuffer);
                imageBase64 = buffer.toString('base64');
                mimeType = file.type || formData.get('mimeType');
            } else {
                 return Response.json({ error: 'Invalid file upload' }, { status: 400 });
            }
        } else {
            const body = await request.json();
            imageBase64 = body.imageBase64;
            mimeType = body.mimeType;
        }

        if (!imageBase64) {
            return Response.json({ error: 'No image provided' }, { status: 400 });
        }

        // --- SECURITY VALIDATION ---
        // 1. Validate MIME Type (Allowlist)
        const ALLOWED_MIME_TYPES = ['image/jpeg', 'image/png', 'image/webp'];
        if (!mimeType || !ALLOWED_MIME_TYPES.includes(mimeType)) {
            return Response.json(
                { error: `Invalid file type: ${mimeType}. Allowed: ${ALLOWED_MIME_TYPES.join(', ')}` },
                { status: 400 }
            );
        }

        // 2. Validate Image Size (Max 10MB)
        // Base64 is ~1.33x binary size. 10MB binary ~= 13.3MB Base64.
        const MAX_IMAGE_SIZE_MB = 10;
        const MAX_BASE64_LENGTH = Math.ceil(MAX_IMAGE_SIZE_MB * 1024 * 1024 * 1.34);

        if (imageBase64.length > MAX_BASE64_LENGTH) {
            return Response.json(
                { error: `Image too large. Max size is ${MAX_IMAGE_SIZE_MB}MB.` },
                { status: 400 }
            );
        }
        // --- END SECURITY VALIDATION ---

        const apiKey = process.env.GEMINI_API_KEY;
        if (!apiKey || apiKey === 'your_key_here') {
            // SECURITY: Generic error message to avoid leaking environment details
            return Response.json({ error: 'Service configuration error' }, { status: 500 });
        }

        const ai = new GoogleGenAI({ apiKey });

        const systemPrompt = buildAnalysisSystemPrompt();

        const response = await ai.models.generateContent({
            model: 'gemini-2.5-flash',
            contents: [
                {
                    role: 'user',
                    parts: [
                        {
                            inlineData: {
                                mimeType: mimeType || 'image/jpeg',
                                data: imageBase64
                            }
                        },
                        {
                            text: 'Analyze this room photograph for Feng Shui. Return ONLY the JSON object as specified in your instructions. No markdown, no explanation — just the raw JSON.'
                        }
                    ]
                }
            ],
            config: {
                systemInstruction: systemPrompt,
                temperature: 0.3,
                maxOutputTokens: 4096,
            }
        });

        const text = response.text.trim();

        // Strip markdown code fences if present
        let jsonText = text;
        if (jsonText.startsWith('```')) {
            jsonText = jsonText.replace(/^```(?:json)?\n?/, '').replace(/\n?```$/, '');
        }

        let analysis;
        try {
            analysis = JSON.parse(jsonText);
        } catch (parseError) {
            console.error('Failed to parse Gemini response:', text);
            // SECURITY: Do not leak raw text in error response
            return Response.json(
                { error: 'Failed to parse analysis response' },
                { status: 500 }
            );
        }

        return Response.json({ analysis });

    } catch (error) {
        console.error('Analysis error:', error);
        // SECURITY: Return generic error message to client, log details on server
        return Response.json(
            { error: 'Analysis failed' },
            { status: 500 }
        );
    }
}
