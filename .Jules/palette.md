## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-14 - [Accessible Temporary State Feedback]
**Learning:** Transient UI state changes like "Copied!" button text or temporary error banners are easily missed by screen readers.
**Action:** Always provide accessible temporary state feedback on interactive elements (e.g., changing a button's text to 'Copied!') using `aria-live="polite"` and dynamically update the `aria-label` to ensure screen readers reliably announce the state change. Ensure transient UI elements like error banners include `role="alert"` and `aria-live="assertive"` so they are immediately announced.
