'use client';

import { useState, useCallback, useEffect } from 'react';

export default function CopyButton({ textToCopy, className = "btn btn-secondary", defaultLabel = "📋 Copy Prompt", copiedLabel = "✅ Copied!" }) {
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
    return () => clearTimeout(timeout);
  }, [copied]);

  return (
    <button
      className={className}
      onClick={handleCopy}
      aria-label={copied ? copiedLabel : defaultLabel}
      aria-live="polite"
    >
      {copied ? copiedLabel : defaultLabel}
    </button>
  );
}
