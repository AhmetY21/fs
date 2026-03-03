## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-03-03 - [Transient Feedback for Invisible Actions]
**Learning:** Copying text to the clipboard is an invisible background action. Without immediate visual and screen-reader feedback, users may repeatedly click or become confused about whether the action succeeded.
**Action:** Always provide transient visual feedback (e.g., changing button text to "Copied!" for a few seconds) and use `aria-live="polite"` to ensure screen readers announce the success state.
