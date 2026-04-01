import { GoogleGenAI } from '@google/genai';
import { buildAnalysisSystemPrompt } from '@/lib/fengshui-system-prompt';
import { rateLimiter } from '@/lib/rate-limit';

export async function POST(request) {
    try {
        // --- SECURITY: CSRF Protection ---
        const originHeader = request.headers.get('origin');
        const hostHeader = request.headers.get('host');
        const xForwardedHost = request.headers.get('x-forwarded-host');
        const targetHost = xForwardedHost ? xForwardedHost.split(',')[0].trim() : hostHeader;

        if (originHeader && targetHost) {
            try {
                const originUrl = new URL(originHeader);
                if (originUrl.host !== targetHost) {
                    return Response.json(
                        { error: 'Invalid origin' },
                        { status: 403 }
                    );
                }
            } catch (error) {
                return Response.json(
                    { error: 'Malformed origin' },
                    { status: 400 }
                );
            }
        }
        // --- END SECURITY: CSRF Protection ---

        // --- SECURITY: Rate Limiting ---
        let ip = request.ip ?? request.headers.get('x-real-ip');
        if (!ip) {
            const forwardedFor = request.headers.get('x-forwarded-for');
            ip = forwardedFor ? forwardedFor.split(',')[0].trim() : '127.0.0.1';
        }

        if (!rateLimiter(ip)) {
            return Response.json(
                { error: 'Rate limit exceeded. Please try again later.' },
                { status: 429 }
            );
        }
        // --- END SECURITY ---

        const { imageBase64, mimeType } = await request.json();

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
