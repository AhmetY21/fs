'use client';

import { useState, useEffect } from 'react';

export default function CopyButton({ text }) {
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

    const handleCopy = () => {
        navigator.clipboard.writeText(text);
        setCopied(true);
    };

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
