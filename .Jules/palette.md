## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Interactive Copy Feedback]
**Learning:** Relying on default browser clipboard behavior for copying text provides no visual or accessibility feedback, leaving users uncertain if the action succeeded.
**Action:** Always provide explicit, accessible feedback for clipboard actions by isolating the logic in a Client Component that toggles a temporary success state (e.g., "✅ Copied!") and updates `aria-label` while using `aria-live="polite"`.
