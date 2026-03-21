## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.
## 2026-03-21 - Accessible Temporary State Feedback
**Learning:** Components interacting with browser APIs (like `navigator.clipboard`) that provide temporary visual feedback (e.g., '✓ Copied!') need explicit accessibility support so screen readers announce the state change.
**Action:** Use `aria-live="polite"` to notify screen readers of content changes smoothly, and dynamically update the `aria-label` alongside the visual text change to ensure accurate readouts.
