## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-04-07 - [Isolating Temporary Interaction Feedback]
**Learning:** Temporary interaction feedback (like 'Copied!' states and timers) mixed in complex page components can cause unnecessary full-page re-renders and potential memory leaks if timeouts are not cleared.
**Action:** Extract temporary interaction feedback into isolated Next.js Client Components (e.g., `CopyButton`) to contain state changes, prevent full-page re-renders, and ensure reliable cleanup of timers on unmount. Add `aria-live="polite"` for accessible announcements.
