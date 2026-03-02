'use client';

import { useState } from 'react';

export default function CopyButton({ text }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = async () => {
        try {
            await navigator.clipboard.writeText(text);
            setCopied(true);
            setTimeout(() => setCopied(false), 2000);
        } catch (err) {
            console.error('Failed to copy text: ', err);
        }
    };

    return (
        <button
            className="btn btn-secondary"
            onClick={handleCopy}
            aria-label={copied ? "Copied" : "Copy prompt to clipboard"}
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
