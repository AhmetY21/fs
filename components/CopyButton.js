'use client';

import { useState, useEffect, useRef } from 'react';

export default function CopyButton({ text, className }) {
    const [copied, setCopied] = useState(false);
    const timeoutRef = useRef(null);

    useEffect(() => {
        return () => {
            if (timeoutRef.current) {
                clearTimeout(timeoutRef.current);
            }
        };
    }, []);

    const handleCopy = () => {
        navigator.clipboard.writeText(text);
        setCopied(true);

        if (timeoutRef.current) {
            clearTimeout(timeoutRef.current);
        }

        timeoutRef.current = setTimeout(() => {
            setCopied(false);
        }, 2000);
    };

    return (
        <button
            className={className || "btn btn-secondary"}
            onClick={handleCopy}
            aria-label={copied ? "Prompt copied to clipboard" : "Copy prompt to clipboard"}
            aria-live="polite"
        >
            {copied ? "✅ Copied!" : "📋 Copy Prompt"}
        </button>
    );
}
