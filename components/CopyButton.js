'use client';

import { useState, useCallback } from 'react';

export default function CopyButton({ text, className = "btn btn-secondary" }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = useCallback(() => {
        navigator.clipboard.writeText(text);
        setCopied(true);
        const timeoutId = setTimeout(() => setCopied(false), 2000);
        return () => clearTimeout(timeoutId);
    }, [text]);

    return (
        <button
            className={className}
            onClick={handleCopy}
            aria-live="polite"
            aria-label={copied ? "Prompt copied to clipboard" : "Copy prompt to clipboard"}
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
