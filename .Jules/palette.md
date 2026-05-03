## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-05-03 - [Interactive Copy Feedback]
**Learning:** Users lack confidence when copying text to the clipboard without visual confirmation, and screen readers are not notified of the state change.
**Action:** Extract copy actions into isolated components with visual "Copied!" feedback and update `aria-label` with `aria-live="polite"` to provide accessible, non-blocking confirmation.
