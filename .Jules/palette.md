## 2024-05-14 - Accessible Clipboard Feedback Pattern
**Learning:** When interacting with `navigator.clipboard`, buttons often lack temporary state feedback (like "Copied!"), which is crucial for accessibility. Relying solely on visual changes is insufficient for screen readers.
**Action:** Always wrap clipboard interactions in a dedicated client component (e.g., `CopyButton`). Use `aria-live="polite"` and dynamically update the `aria-label` to ensure screen readers reliably announce the state change from "Copy to clipboard" to "Copied to clipboard".
