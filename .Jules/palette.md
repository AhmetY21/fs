## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-05-02 - [Isolated Interaction Feedback for Accessibility]
**Learning:** Adding interaction feedback (like a temporary "Copied!" state) directly within large parent components causes unnecessary re-renders of the entire page and makes it harder to manage accessibility state dynamically.
**Action:** Extract interaction-heavy elements into isolated Client Components (e.g., `CopyButton`). This prevents full-page re-renders and ensures dynamic state changes (like updating `aria-label` alongside `aria-live="polite"`) correctly notify assistive technologies without disrupting the broader user flow.
