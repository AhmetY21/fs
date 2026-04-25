## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-04-25 - [Accessible Dynamic State Feedback]
**Learning:** Temporary interaction states (like a 'Copied!' button) implemented in large parent components cause unnecessary full-page re-renders, and dynamic visual changes without ARIA attributes fail to notify screen reader users.
**Action:** Extract temporary interactive feedback logic into isolated Client Components to prevent widespread re-renders. Always ensure dynamic state changes use descriptive `aria-label` updates alongside `aria-live="polite"` to proactively and accessibly notify users.
