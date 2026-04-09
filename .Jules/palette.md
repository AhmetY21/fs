## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Interaction Feedback and Component Isolation]
**Learning:** Adding temporary interaction feedback (like a 'Copied!' state) directly to a main page component triggers full-page re-renders.
**Action:** Always extract interaction feedback logic into isolated Client Components (e.g., `CopyButton`) to prevent full-page re-renders and ensure timeouts are properly cleared on unmount to prevent memory leaks.
