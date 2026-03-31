## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-03-31 - [Accessible Temporary State Feedback]
**Learning:** Raw `<button>` elements that trigger clipboard copying lack accessible feedback for screen readers and can cause unnecessary re-renders when state is managed at the page level.
**Action:** Always extract temporary interaction feedback (e.g., "Copied!" states) into isolated Client Components to prevent full-page re-renders. Use `aria-live="polite"` and dynamically update `aria-label` to ensure screen readers reliably announce the state change, and clear timeouts on unmount to prevent memory leaks.
