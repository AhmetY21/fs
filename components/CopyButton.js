'use client';

import { useState } from 'react';

export default function CopyButton({ text }) {
  const [copied, setCopied] = useState(false);

  const handleCopy = () => {
    navigator.clipboard.writeText(text);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <button
      className="btn btn-secondary"
      onClick={handleCopy}
      aria-label={copied ? "Prompt copied to clipboard" : "Copy prompt to clipboard"}
      aria-live="polite"
    >
      {copied ? '✅ Copied!' : '📋 Copy Prompt'}
    </button>
  );
}
