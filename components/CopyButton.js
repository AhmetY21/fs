'use client';

import { useState, useCallback, useEffect } from 'react';

export default function CopyButton({ textToCopy, className = "btn btn-secondary" }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = useCallback(() => {
        if (!textToCopy) return;

        navigator.clipboard.writeText(textToCopy).then(() => {
            setCopied(true);
        }).catch(err => {
            console.error('Failed to copy text: ', err);
        });
    }, [textToCopy]);

    useEffect(() => {
        if (copied) {
            const timeoutId = setTimeout(() => setCopied(false), 2000);
            return () => clearTimeout(timeoutId);
        }
    }, [copied]);

    return (
        <button
            className={className}
            onClick={handleCopy}
            aria-label={copied ? "Copied to clipboard" : "Copy Prompt to clipboard"}
            aria-live="polite"
        >
            {copied ? "✓ Copied!" : "📋 Copy Prompt"}
        </button>
    );
}
