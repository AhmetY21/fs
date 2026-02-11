import { GoogleGenAI } from '@google/genai';
import { buildAnalysisSystemPrompt } from '@/lib/fengshui-system-prompt';

export async function POST(request) {
    try {
        const { imageBase64, mimeType } = await request.json();

        if (!imageBase64) {
            return Response.json({ error: 'No image provided' }, { status: 400 });
        }

        const apiKey = process.env.GEMINI_API_KEY;
        if (!apiKey || apiKey === 'your_key_here') {
            return Response.json({ error: 'GEMINI_API_KEY not configured. Add it to .env.local' }, { status: 500 });
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
            return Response.json(
                { error: 'Failed to parse analysis response', raw: text },
                { status: 500 }
            );
        }

        return Response.json({ analysis });

    } catch (error) {
        console.error('Analysis error:', error);
        return Response.json(
            { error: error.message || 'Analysis failed' },
            { status: 500 }
        );
    }
}
