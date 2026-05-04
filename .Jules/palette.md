## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-05-04 - [Accessible Interaction Feedback]
**Learning:** Adding temporary state changes (like "Copied!") in large parent components causes unnecessary full-page re-renders. More importantly, visual-only feedback is missed by screen readers.
**Action:** Extract interaction feedback buttons into isolated Client Components with their own state. Ensure dynamic text changes are paired with descriptive `aria-label` updates and `aria-live="polite"` to proactively notify assistive technologies without interrupting the user.
