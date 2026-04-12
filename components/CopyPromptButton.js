'use client';

import { useState, useEffect } from 'react';

export default function CopyPromptButton({ promptText }) {
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
            await navigator.clipboard.writeText(promptText);
            setCopied(true);
        } catch (err) {
            console.error('Failed to copy text: ', err);
        }
    };

    return (
        <button
            className={`btn ${copied ? 'btn-primary' : 'btn-secondary'}`}
            onClick={handleCopy}
            aria-live="polite"
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
