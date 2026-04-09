'use client';

import { useState, useCallback, useEffect, useRef } from 'react';

export default function CopyButton({ text }) {
  const [copied, setCopied] = useState(false);
  const timeoutRef = useRef(null);

  useEffect(() => {
    return () => {
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current);
      }
    };
  }, []);

  const handleCopy = useCallback(() => {
    navigator.clipboard.writeText(text).then(() => {
      setCopied(true);
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current);
      }
      timeoutRef.current = setTimeout(() => {
        setCopied(false);
      }, 2000);
    }).catch(err => {
      console.error('Failed to copy text:', err);
    });
  }, [text]);

  return (
    <button
      className="btn btn-secondary"
      onClick={handleCopy}
      aria-label={copied ? "Prompt copied to clipboard" : "Copy redesign prompt"}
    >
      {copied ? '✅ Copied!' : '📋 Copy Prompt'}
    </button>
  );
}
