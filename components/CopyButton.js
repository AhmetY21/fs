'use client';

import { useState } from 'react';

export default function CopyButton({ text, label = 'Copy', className = '' }) {
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
            onClick={handleCopy}
            className={`btn btn-secondary ${className}`}
            aria-label={copied ? "Copied to clipboard" : `Copy ${label}`}
            disabled={copied}
        >
            {copied ? (
                <>
                    <span aria-hidden="true">✅</span> Copied!
                </>
            ) : (
                <>
                    <span aria-hidden="true">📋</span> {label}
                </>
            )}
        </button>
    );
}
