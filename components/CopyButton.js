'use client';

import { useState, useCallback, useEffect } from 'react';

export default function CopyButton({ text }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = useCallback(() => {
        navigator.clipboard.writeText(text);
        setCopied(true);
    }, [text]);

    useEffect(() => {
        if (copied) {
            const timer = setTimeout(() => {
                setCopied(false);
            }, 2000);
            return () => clearTimeout(timer);
        }
    }, [copied]);

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
