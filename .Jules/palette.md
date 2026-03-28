## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Accessible Temporary Interaction States]
**Learning:** Adding temporary visual feedback (like "Copied!") directly in complex parent components via state causes unnecessary full-page re-renders. Furthermore, text changes alone aren't reliably announced by screen readers if not properly configured.
**Action:** Extract temporary interactive states into isolated Client Components. Use `aria-live="polite"` and dynamically update `aria-label` to ensure screen readers announce the state change (e.g., from "Copy" to "Copied!"), and clear the timeout on unmount to prevent memory leaks.
