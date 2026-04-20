'use client';

import { useState, useEffect } from 'react';

export default function CopyButton({ prompt }) {
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

  const handleCopy = () => {
    navigator.clipboard.writeText(prompt);
    setCopied(true);
  };

  return (
    <button
      className="btn btn-secondary"
      onClick={handleCopy}
      aria-label="Copy AI redesign prompt"
      aria-live="polite"
    >
      {copied ? '✅ Copied!' : '📋 Copy Prompt'}
    </button>
  );
}
