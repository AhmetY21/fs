## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-03-24 - [Accessible Temporary State Feedback]
**Learning:** For interactive elements like "Copy" buttons, simply changing the text visually is insufficient. Screen readers may not announce the state change if the element doesn't have `aria-live`.
**Action:** When creating temporary state feedback (like "Copied!" for 2 seconds), always use `aria-live="polite"` and update the `aria-label` dynamically to ensure screen readers announce the state change.
