'use client';

import { useState, useCallback, useEffect, useRef } from 'react';

export default function CopyPromptButton({ prompt }) {
    const [copied, setCopied] = useState(false);
    const timeoutRef = useRef(null);

    const handleCopy = useCallback(() => {
        navigator.clipboard.writeText(prompt);
        setCopied(true);

        if (timeoutRef.current) clearTimeout(timeoutRef.current);
        timeoutRef.current = setTimeout(() => setCopied(false), 2000);
    }, [prompt]);

    useEffect(() => {
        return () => {
            if (timeoutRef.current) clearTimeout(timeoutRef.current);
        };
    }, []);

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
