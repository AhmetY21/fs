'use client';

import { useState, useEffect } from 'react';

export default function CopyButton({ text, className = "btn btn-secondary" }) {
    const [copied, setCopied] = useState(false);

    useEffect(() => {
        let timeout;
        if (copied) {
            timeout = setTimeout(() => {
                setCopied(false);
            }, 2000);
        }
        return () => clearTimeout(timeout);
    }, [copied]);

    const handleCopy = async () => {
        try {
            await navigator.clipboard.writeText(text);
            setCopied(true);
        } catch (err) {
            console.error('Failed to copy!', err);
        }
    };

    return (
        <button
            className={className}
            onClick={handleCopy}
            aria-label={copied ? "Copied" : "Copy to clipboard"}
            aria-live="polite"
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
