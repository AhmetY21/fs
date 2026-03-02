## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Transient Feedback & Accessible Error Banners]
**Learning:** Clipboard actions that lack transient visual feedback lead to a poor user experience, and visual error banners without `role="alert"` and `aria-live` are inaccessible to screen reader users. Furthermore, icon-only dismiss buttons in alerts need explicit `aria-label`s.
**Action:** Always provide brief visual confirmation (like a "Copied!" state) for clipboard operations. Always wrap error messages in `role="alert" aria-live="assertive"` to ensure screen readers announce them, and label interactive icons (e.g. `aria-label="Dismiss error"` for '✕').
