## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-04-15 - [Interactive Feedback Isolation]
**Learning:** Implementing temporary feedback states (like a 'Copied!' timeout) directly within a large parent component causes unnecessary full-page re-renders and risks unmount timeout leaks.
**Action:** Always extract temporary interaction feedback logic into isolated Client Components to ensure proper timeout cleanup on unmount and prevent parent component re-renders.
