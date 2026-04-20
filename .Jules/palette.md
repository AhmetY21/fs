## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-24 - [Interactive Copied Feedback]
**Learning:** Users need visual confirmation when copying text to the clipboard. The "Copy Prompt" button lacked feedback, leaving users unsure if the action succeeded. Additionally, implementing temporary state (like a "Copied!" timeout) in a large parent component triggers unnecessary full-page re-renders.
**Action:** Always provide explicit, temporary visual feedback (e.g., "Copied!") for clipboard actions and ensure the button has `aria-live="polite"`. Extract this interaction logic into isolated Client Components to prevent widespread re-renders and ensure proper timeout cleanup on unmount.
