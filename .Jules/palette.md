## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Interactive Feedback Accessibility]
**Learning:** Native `navigator.clipboard` actions lacking immediate UI feedback cause confusion, and simply changing text isn't announced properly by screen readers without ARIA live regions.
**Action:** Extract clipboard actions into isolated Client Components to prevent full-page re-renders, implement self-clearing active timeouts for visual feedback, and use `aria-live="polite"` with dynamic `aria-label`s to ensure state changes are announced.
