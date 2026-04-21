'use client';

import { useState } from 'react';

export default function CopyButton({ text }) {
  const [copied, setCopied] = useState(false);

  const handleCopy = () => {
    navigator.clipboard.writeText(text).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    });
  };

  return (
    <button
      className="btn btn-secondary"
      onClick={handleCopy}
      aria-label={copied ? 'Prompt copied' : 'Copy prompt'}
    >
      {copied ? '✅ Copied!' : '📋 Copy Prompt'}
    </button>
  );
}
