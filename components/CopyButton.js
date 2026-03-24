'use client';

import { useState, useCallback } from 'react';

export default function CopyButton({ text, className = "btn btn-secondary" }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = useCallback(async () => {
        if (!text) return;

        try {
            await navigator.clipboard.writeText(text);
            setCopied(true);
            setTimeout(() => setCopied(false), 2000);
        } catch (err) {
            console.error('Failed to copy text: ', err);
        }
    }, [text]);

    return (
        <button
            className={className}
            onClick={handleCopy}
            aria-live="polite"
            aria-label={copied ? "Copied to clipboard" : "Copy prompt to clipboard"}
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
