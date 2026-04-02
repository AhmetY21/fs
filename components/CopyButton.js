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
            className={className}
            onClick={handleCopy}
            aria-label="Copy Redesign Prompt"
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
