## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-05-01 - [Accessible Copy Interactions]
**Learning:** Adding temporary interaction feedback (like a "Copied!" state) directly into large Next.js parent components triggers unnecessary full-page re-renders. Also, state changes need `aria-live` to be accessible.
**Action:** Extract temporary UI state interactions into isolated Client Components (e.g., `<CopyButton>`) to prevent performance impacts, and ensure dynamic state changes use `aria-live="polite"` alongside descriptive `aria-label` updates to proactively notify assistive technologies.
