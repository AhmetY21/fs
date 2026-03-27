## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-03-27 - [Accessible Temporary State Feedback]
**Learning:** Using `navigator.clipboard.writeText` in simple buttons without temporary state feedback can cause confusion. Further, transient UI states need `aria-live` to be conveyed to screen readers.
**Action:** When implementing temporary interaction feedback (like "✓ Copied!"), use isolated Next.js Client Components with `aria-live="polite"` and dynamically updated `aria-label`s. Ensure that timeouts are cleared on unmount to prevent memory leaks, and that the isolated component avoids full-page re-renders.
