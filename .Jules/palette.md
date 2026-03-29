## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-03-29 - [Accessible Copy Feedback]
**Learning:** Using inline text copy buttons without feedback or `aria-live` means screen reader users don't know the action succeeded, and it causes the entire page to re-render in Next.js Server Components if state is added inline.
**Action:** Extract temporary interaction feedback (e.g., active timeouts for 'Copied!' states) into isolated Next.js Client Components with `aria-live="polite"` to provide accessible, non-disruptive feedback without full-page re-renders.
