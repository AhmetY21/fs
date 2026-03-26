'use client';

import { useState, useCallback, useEffect, useRef } from 'react';

export default function CopyButton({ text, className = "btn btn-secondary" }) {
    const [copied, setCopied] = useState(false);
    const timeoutRef = useRef(null);

    // Cleanup timeout on unmount
    useEffect(() => {
        return () => {
            if (timeoutRef.current) {
                clearTimeout(timeoutRef.current);
            }
        };
    }, []);

    const handleCopy = useCallback(async () => {
        if (!text) return;

        try {
            await navigator.clipboard.writeText(text);
            setCopied(true);

            if (timeoutRef.current) {
                clearTimeout(timeoutRef.current);
            }
            timeoutRef.current = setTimeout(() => setCopied(false), 2000);
        } catch (err) {
            console.error('Failed to copy:', err);
        }
    }, [text]);

    return (
        <button
            className={className}
            onClick={handleCopy}
            aria-live="polite"
            aria-label={copied ? "Prompt copied to clipboard" : "Copy prompt to clipboard"}
        >
            {copied ? '✓ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
