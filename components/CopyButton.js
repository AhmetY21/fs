'use client';

import { useState, useCallback, useEffect } from 'react';

export default function CopyButton({ text }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = useCallback(() => {
        navigator.clipboard.writeText(text).then(() => {
            setCopied(true);
        });
    }, [text]);

    useEffect(() => {
        if (!copied) return;
        const timer = setTimeout(() => {
            setCopied(false);
        }, 2000);
        return () => clearTimeout(timer);
    }, [copied]);

    return (
        <button
            className="btn btn-secondary"
            onClick={handleCopy}
            aria-label={copied ? "Prompt copied to clipboard" : "Copy prompt to clipboard"}
            aria-live="polite"
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
