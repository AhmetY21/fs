## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2024-03-30 - Extract Temporary Interaction Feedback
**Learning:** Temporary UI state changes (like "Copied!" buttons) in Next.js applications should be isolated into their own Client Components (`'use client'`). Modifying this state in the parent page forces unnecessary full-page re-renders. Furthermore, for accessibility, these interactive feedback elements should use `aria-live="polite"` to proactively announce the state change to screen readers, and any `setTimeout` handlers must be properly cleaned up on component unmount.
**Action:** When adding temporary success/feedback states to buttons, always extract the button into a separate Client Component rather than polluting the parent component's state. Ensure `aria-live` and dynamic `aria-label` attributes are used, and timeouts are safely cleared in `useEffect` cleanup.
