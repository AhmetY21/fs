'use client';

import { useState, useCallback, useEffect } from 'react';

export default function CopyButton({ text }) {
    const [copied, setCopied] = useState(false);

    useEffect(() => {
        let timeout;
        if (copied) {
            timeout = setTimeout(() => {
                setCopied(false);
            }, 2000);
        }
        return () => {
            if (timeout) clearTimeout(timeout);
        };
    }, [copied]);

    const handleCopy = useCallback(() => {
        navigator.clipboard.writeText(text).then(() => {
            setCopied(true);
        }).catch(err => {
            console.error('Failed to copy!', err);
        });
    }, [text]);

    return (
        <button
            className="btn btn-secondary"
            onClick={handleCopy}
            aria-live="polite"
            aria-label={copied ? "Copied to clipboard" : "Copy Prompt to clipboard"}
        >
            {copied ? '✓ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
