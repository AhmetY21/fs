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
            if (timeout) clearTimeout(timeout);
        };
    }, [copied]);

    const handleCopy = async () => {
        try {
            await navigator.clipboard.writeText(textToCopy);
            setCopied(true);
        } catch (err) {
            console.error('Failed to copy text: ', err);
        }
    };

    return (
        <button
            className="btn btn-secondary"
            onClick={handleCopy}
            aria-label={copied ? "Copied redesign prompt" : "Copy redesign prompt to clipboard"}
            aria-live="polite"
        >
            {copied ? "✅ Copied!" : "📋 Copy Prompt"}
        </button>
    );
}