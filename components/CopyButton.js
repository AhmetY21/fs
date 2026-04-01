'use client';

import { useState, useEffect } from 'react';

export default function CopyButton({ textToCopy, className = '' }) {
  const [copied, setCopied] = useState(false);

  useEffect(() => {
    let timeout;
    if (copied) {
      timeout = setTimeout(() => {
        setCopied(false);
      }, 2000);
    }
    return () => {
      if (timeout) clearTimeout(timeout);
    };
  }, [copied]);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(textToCopy);
      setCopied(true);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  };

  return (
    <button
      className={`btn btn-secondary ${className}`}
      onClick={handleCopy}
      aria-label={copied ? "Prompt copied to clipboard" : "Copy Prompt"}
    >
      {copied ? "✅ Copied!" : "📋 Copy Prompt"}
    </button>
  );
}
