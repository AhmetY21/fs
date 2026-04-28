'use client';
import { useState, useCallback } from 'react';

export default function CopyButton({ text }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = useCallback(() => {
        navigator.clipboard.writeText(text).then(() => {
            setCopied(true);
            setTimeout(() => setCopied(false), 2000);
        });
    }, [text]);

    return (
        <button
            className="btn btn-secondary"
            onClick={handleCopy}
            aria-label={copied ? "Copied to clipboard" : "Copy prompt to clipboard"}
            aria-live="polite"
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}