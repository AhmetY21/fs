## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Isolating Temporary Interactive States]
**Learning:** Adding temporary interaction feedback (like a "Copied!" timeout) directly into a large component causes the entire page to re-render, potentially causing jank or losing state.
**Action:** Extract temporary interactive states (like timeouts and copied statuses) into isolated Next.js Client Components. This ensures that state changes only re-render the specific component and allows proper cleanup of timeouts on unmount without affecting the rest of the application.
