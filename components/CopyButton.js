'use client';

import { useState, useEffect } from 'react';

export default function CopyButton({ text }) {
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

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(true);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
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
