## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-04-04 - [Interaction Feedback for Invisible APIs]
**Learning:** Browser API actions like `navigator.clipboard.writeText` are invisible to users, leading to repeated clicks and uncertainty without visual confirmation.
**Action:** Always provide temporary interaction feedback (e.g., active timeouts for "Copied!" states) for invisible background actions. Extract this logic into isolated Client Components to prevent full-page re-renders, ensure timeouts are cleared on unmount, and update `aria-label`s dynamically.
