## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-03-05 - [Accessible Transient Feedback]
**Learning:** Implementing temporary feedback (like a "Copied!" state) in large parent components causes unnecessary full-page re-renders. Additionally, visual-only feedback lacks accessibility for screen readers.
**Action:** Extract temporary interaction feedback into isolated Client Components and use dynamic `aria-label` updates alongside `aria-live="polite"` to proactively notify assistive technologies without disrupting the user flow.
