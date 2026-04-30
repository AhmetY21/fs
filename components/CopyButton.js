'use client';

import { useState, useCallback, useEffect } from 'react';

export default function CopyButton({ textToCopy, className = "btn btn-secondary" }) {
  const [copied, setCopied] = useState(false);

  const handleCopy = useCallback(() => {
    navigator.clipboard.writeText(textToCopy).then(() => {
      setCopied(true);
    });
  }, [textToCopy]);

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

  return (
    <button
      className={className}
      onClick={handleCopy}
      aria-label={copied ? "Copied to clipboard" : "Copy Prompt"}
      aria-live="polite"
    >
      {copied ? "✅ Copied!" : "📋 Copy Prompt"}
    </button>
  );
}
