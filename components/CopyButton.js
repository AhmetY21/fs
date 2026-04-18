'use client';

import { useState, useCallback } from 'react';

export default function CopyButton({ textToCopy }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = useCallback(() => {
        navigator.clipboard.writeText(textToCopy);
        setCopied(true);
        setTimeout(() => setCopied(false), 2000);
    }, [textToCopy]);

    return (
        <button
            className="btn btn-secondary"
            onClick={handleCopy}
            aria-live="polite"
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
