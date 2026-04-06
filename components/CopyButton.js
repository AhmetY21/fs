'use client';

import { useState, useEffect, useRef } from 'react';

export default function CopyButton({ textToCopy, className = '' }) {
    const [copied, setCopied] = useState(false);
    const timeoutRef = useRef(null);

    const handleCopy = async () => {
        try {
            await navigator.clipboard.writeText(textToCopy);
            setCopied(true);

            // Clear any existing timeout
            if (timeoutRef.current) {
                clearTimeout(timeoutRef.current);
            }

            // Set a new timeout to clear the copied state after 2 seconds
            timeoutRef.current = setTimeout(() => {
                setCopied(false);
            }, 2000);
        } catch (err) {
            console.error('Failed to copy text: ', err);
        }
    };

    // Cleanup timeout on unmount
    useEffect(() => {
        return () => {
            if (timeoutRef.current) {
                clearTimeout(timeoutRef.current);
            }
        };
    }, []);

    return (
        <button
            className={`btn ${copied ? 'btn-primary' : 'btn-secondary'} ${className}`}
            onClick={handleCopy}
            aria-label={copied ? "Copied to clipboard" : "Copy prompt to clipboard"}
            aria-live="polite"
        >
            {copied ? '✅ Copied!' : '📋 Copy Prompt'}
        </button>
    );
}
