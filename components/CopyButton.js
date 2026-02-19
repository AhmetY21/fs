'use client';

import { useState } from 'react';

export default function CopyButton({ text, className = "btn btn-secondary" }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = async () => {
        try {
            await navigator.clipboard.writeText(text);
            setCopied(true);
            setTimeout(() => setCopied(false), 2000);
        } catch (err) {
            console.error('Failed to copy:', err);
        }
    };

    return (
        <button
            className={className}
            onClick={handleCopy}
            aria-label={copied ? "Copied to clipboard" : "Copy prompt to clipboard"}
            style={copied ? { borderColor: 'var(--accent-jade)', color: 'var(--accent-jade)' } : undefined}
        >
            {copied ? "✅ Copied!" : "📋 Copy Prompt"}
        </button>
    );
}
