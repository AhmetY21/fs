'use client';

import { useState, useCallback } from 'react';

/**
 * A button that copies text to the clipboard and provides visual feedback.
 *
 * @param {string} text - The text to copy to clipboard
 * @param {string} label - The default button label
 * @param {string} className - Optional CSS classes
 */
export default function CopyButton({ text, label = 'Copy', className = 'btn' }) {
    const [copied, setCopied] = useState(false);

    const handleCopy = useCallback(async () => {
        if (!text) return;

        try {
            await navigator.clipboard.writeText(text);
            setCopied(true);
            setTimeout(() => setCopied(false), 2000);
        } catch (err) {
            console.error('Failed to copy text: ', err);
        }
    }, [text]);

    return (
        <button
            type="button"
            className={`${className} ${copied ? 'btn-success' : ''}`}
            onClick={handleCopy}
            aria-label={copied ? "Copied to clipboard" : `Copy ${label}`}
            disabled={copied}
        >
            {copied ? (
                <>
                    <span aria-hidden="true">✓</span> Copied!
                </>
            ) : (
                label
            )}
        </button>
    );
}
