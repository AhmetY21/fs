## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Interactive Copy Feedback]
**Learning:** Interactions like copying to clipboard without immediate feedback leave users unsure if the action succeeded.
**Action:** Extract interaction feedback into isolated Next.js Client Components (e.g., `CopyButton`) to prevent full-page re-renders, provide visible feedback (e.g., "Copied!"), improve accessibility with `aria-live`, and manage timeouts reliably.
