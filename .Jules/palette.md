## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Accessible Clipboard Feedback]
**Learning:** Using basic inline `navigator.clipboard` calls in large Next.js page components lacks accessible user feedback (no ARIA live updates, no visual confirmation).
**Action:** Extract clipboard logic into an isolated Client Component. Implement a temporary visual "Copied!" state, and ensure it uses `aria-live="polite"` and dynamically updates `aria-label` to proactively notify screen readers of the state change without triggering full page re-renders.
