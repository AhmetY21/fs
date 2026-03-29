'use client';

import { useState, useCallback, useEffect } from 'react';

export default function CopyButton({ textToCopy, className = "btn btn-secondary" }) {
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

    const handleCopy = useCallback(async () => {
        if (!textToCopy) return;
        try {
            await navigator.clipboard.writeText(textToCopy);
            setCopied(true);
        } catch (err) {
            console.error('Failed to copy text: ', err);
        }
    }, [textToCopy]);

    return (
        <button
            className={className}
            onClick={handleCopy}
            aria-label={copied ? "Prompt copied to clipboard" : "Copy prompt to clipboard"}
            aria-live="polite"
        >
            {copied ? '✓ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
