'use client';

import { useState } from 'react';

export default function CopyButton({ textToCopy, label = "Copy Prompt" }) {
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
            className="btn btn-secondary"
            onClick={handleCopy}
            aria-label={copied ? "Prompt copied to clipboard" : "Copy AI Redesign Prompt"}
            aria-live="polite"
        >
            {copied ? '✅ Copied!' : `📋 ${label}`}
        </button>
    );
}
