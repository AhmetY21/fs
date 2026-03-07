## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.

## 2025-02-15 - [Accessible Transient Error Banners and Text Icons]
**Learning:** Transient UI elements like error banners (which appear dynamically) were not immediately announced by screen readers, and text-based emojis used as icons in buttons were read aloud awkwardly.
**Action:** Always add `role="alert"` and `aria-live="assertive"` to dynamically appearing error containers. Wrap text-based icons (like emojis) in `<span aria-hidden="true">` to prevent screen readers from announcing them when they are purely decorative or redundant to the button's text or `aria-label`.
