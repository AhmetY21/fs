## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.
## 2026-03-26 - [Accessible Feedback States]
**Learning:** Re-rendering entire page components or relying solely on unannounced visual changes for temporary feedback (like 'Copied!') results in poor user experience and fails screen reader accessibility.
**Action:** When implementing temporary interaction states, extract the logic into a dedicated Client Component (e.g., `CopyButton`), utilize `aria-live="polite"` with dynamic `aria-label` attributes to announce changes to screen readers, and implement robust component unmount cleanup for any timeouts.
