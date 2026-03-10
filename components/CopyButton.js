'use client';

import { useState } from 'react';

export default function CopyButton({ textToCopy, className = '' }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = async () => {
        try {
            await navigator.clipboard.writeText(textToCopy);
            setCopied(true);
            setTimeout(() => setCopied(false), 2000);
        } catch (err) {
            console.error('Failed to copy text: ', err);
        }
    };

    return (
        <button
            className={`btn btn-secondary ${className}`}
            onClick={handleCopy}
            aria-live="polite"
            aria-label={copied ? "Copied prompt to clipboard" : "Copy Prompt"}
            style={copied ? { borderColor: 'var(--accent-jade)', color: 'var(--accent-jade)' } : {}}
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
