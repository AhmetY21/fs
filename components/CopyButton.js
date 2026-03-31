'use client';

import { useState, useEffect } from 'react';

export default function CopyButton({ textToCopy }) {
    const [copied, setCopied] = useState(false);

    useEffect(() => {
        let timeout;
        if (copied) {
            timeout = setTimeout(() => {
                setCopied(false);
            }, 2000);
        }
        return () => {
            if (timeout) {
                clearTimeout(timeout);
            }
        };
    }, [copied]);

    const handleCopy = () => {
        navigator.clipboard.writeText(textToCopy);
        setCopied(true);
    };

    return (
        <button
            className="btn btn-secondary"
            onClick={handleCopy}
            aria-live="polite"
            aria-label={copied ? "Prompt copied to clipboard" : "Copy prompt to clipboard"}
        >
            {copied ? '✓ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}