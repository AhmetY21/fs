## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Interactive Copy Feedback]
**Learning:** The "Copy Prompt" button had no visual feedback or accessible state announcement when clicked, leaving users unsure if the action succeeded.
**Action:** Extract clipboard actions into isolated client components (`CopyButton`) with local state to provide temporary visual feedback ("Copied!") and announce the state change using `aria-live="polite"` and dynamic `aria-label`.
