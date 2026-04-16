'use client';

import { useState, useCallback, useEffect } from 'react';

export default function CopyButton({ textToCopy }) {
  const [copied, setCopied] = useState(false);

  const handleCopy = useCallback(() => {
    navigator.clipboard.writeText(textToCopy).then(() => {
      setCopied(true);
    });
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
      aria-label="Copy AI Redesign Prompt"
    >
      {copied ? '✅ Copied!' : '📋 Copy Prompt'}
    </button>
  );
}
