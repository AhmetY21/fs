'use client';

import { useState, useCallback, useEffect } from 'react';

export default function CopyButton({ textToCopy }) {
  const [copied, setCopied] = useState(false);

  const handleCopy = useCallback(async () => {
    try {
      await navigator.clipboard.writeText(textToCopy);
      setCopied(true);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  }, [textToCopy]);

  useEffect(() => {
    if (copied) {
      const timeout = setTimeout(() => {
        setCopied(false);
      }, 2000);
      return () => clearTimeout(timeout);
    }
  }, [copied]);

  return (
    <button
      className="btn btn-secondary"
      onClick={handleCopy}
      aria-label={copied ? "Prompt copied to clipboard" : "Copy AI Redesign Prompt"}
    >
      {copied ? "✅ Copied!" : "📋 Copy Prompt"}
    </button>
  );
}
