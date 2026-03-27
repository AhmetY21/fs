'use client';

import { useState } from 'react';

export default function CopyButton({ text, label = 'Copy', className = 'btn btn-secondary' }) {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  };

  // Construct a sensible aria-label
  const ariaLabel = copied
    ? "Copied to clipboard"
    : label.toLowerCase().startsWith('copy')
      ? label
      : `Copy ${label} to clipboard`;

  return (
    <button
      className={className}
      onClick={handleCopy}
      aria-label={ariaLabel}
    >
      {copied ? '✅ Copied!' : `📋 ${label}`}
    </button>
  );
}
