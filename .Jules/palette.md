## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Interactive Feedback Components]
**Learning:** Adding temporary interaction feedback (like a "Copied!" state) directly into large parent components can cause unnecessary full-page re-renders. Additionally, such dynamic state changes need explicit ARIA announcements to be accessible.
**Action:** Extract interaction feedback logic into isolated Client Components to prevent full-page re-renders. Use `aria-live="polite"` and descriptive `aria-label` updates to proactively notify assistive technologies of dynamic state changes.
