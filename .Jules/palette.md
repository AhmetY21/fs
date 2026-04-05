## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-04-05 - [Isolating Temporary Interaction Feedback]
**Learning:** Adding temporary interaction feedback (like a "Copied!" state that reverts after 2 seconds) directly to a main page component can trigger unnecessary full-page re-renders.
**Action:** Always extract temporary interaction logic into isolated Next.js Client Components (e.g., `CopyButton`). Ensure `aria-label` and `aria-live` are updated alongside visual changes for screen reader accessibility, and clear timeouts on component unmount to prevent memory leaks.
