'use client';

import { useState, useEffect } from 'react';

export default function CopyButton({ textToCopy, className = "btn btn-secondary" }) {
    const [copied, setCopied] = useState(false);

    useEffect(() => {
        let timeoutId;
        if (copied) {
            timeoutId = setTimeout(() => {
                setCopied(false);
            }, 2000);
        }
        return () => {
            if (timeoutId) {
                clearTimeout(timeoutId);
            }
        };
    }, [copied]);

    const handleCopy = () => {
        navigator.clipboard.writeText(textToCopy);
        setCopied(true);
    };

    return (
        <button
            className={className}
            onClick={handleCopy}
            aria-live="polite"
            aria-label={copied ? "Prompt copied to clipboard" : "Copy redesign prompt to clipboard"}
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
