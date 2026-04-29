## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-03-02 - [Dynamic Accessible Interaction Feedback]
**Learning:** Using `aria-live="polite"` combined with dynamic `aria-label` updates on buttons provides critical confirmation for assistive technology users without interrupting their flow.
**Action:** Always provide both visual and programmatic accessibility feedback for interactive states (like "Copied" success state) and extract this logic into isolated Client Components to prevent full-page re-renders.
