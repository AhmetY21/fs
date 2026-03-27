## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-24 - [Transient Feedback States]
**Learning:** Actions like "Copy to Clipboard" that lack visual confirmation leave users uncertain and prone to repeated clicking.
**Action:** Implement transient "success" states (e.g., button text change to "Copied!") for immediate, reassuring feedback on invisible actions, using `aria-label` to announce the status change.
