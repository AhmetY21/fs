'use client';

import { useState } from 'react';

export default function CopyButton({ text }) {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000); // Reset after 2 seconds
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  };

  return (
    <button
      className="btn btn-secondary"
      onClick={handleCopy}
      aria-label={copied ? "Copied to clipboard" : "Copy redesign prompt"}
      aria-live="polite"
    >
      {copied ? '✅ Copied!' : '📋 Copy Prompt'}
    </button>
  );
}
