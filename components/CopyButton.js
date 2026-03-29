'use client';

import { useState } from 'react';

export default function CopyButton({ textToCopy, className = "btn btn-secondary" }) {
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
            className={className}
            onClick={handleCopy}
            aria-live="polite"
        >
            {copied ? (
                <>
                    <span aria-hidden="true">✓</span> Copied!
                </>
            ) : (
                <>
                    <span aria-hidden="true">📋</span> Copy Prompt
                </>
            )}
        </button>
    );
}
