'use client';

import { useState, useCallback, useEffect } from 'react';

export default function CopyButton({ textToCopy }) {
  const [copied, setCopied] = useState(false);

  useEffect(() => {
    let timeoutId;
    if (copied) {
      timeoutId = setTimeout(() => {
        setCopied(false);
      }, 2000);
    }
    return () => {
      if (timeoutId) {
        clearTimeout(timeoutId);
      }
    };
  }, [copied]);

  const handleCopy = useCallback(async () => {
    if (!textToCopy) return;
    try {
      await navigator.clipboard.writeText(textToCopy);
      setCopied(true);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  }, [textToCopy]);

  return (
    <button
      className={`btn ${copied ? 'btn-primary' : 'btn-secondary'}`}
      onClick={handleCopy}
      aria-label={copied ? "Copied to clipboard" : "Copy prompt to clipboard"}
    >
      {copied ? '✅ Copied!' : '📋 Copy Prompt'}
    </button>
  );
}
