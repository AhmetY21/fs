## 2025-02-12 - [Accessible Severity Indicators]
**Learning:** Visual-only severity indicators (dots) in Feng Shui report were completely invisible to screen readers, hiding critical information.
**Action:** Always wrap visual rating/status indicators with `role="img"` and provide descriptive `aria-label` translating the visual count to meaningful text (e.g., "Critical (5/5)").

## 2025-02-13 - [Non-Blocking Validation]
**Learning:** Using `window.alert` for file validation disrupts the user flow and is inaccessible to some screen readers.
**Action:** Use inline, conditional rendering for error messages with `role="alert"` to provide immediate, accessible feedback without blocking the UI.
## 2025-03-04 - [Accessible Spatial Maps]\n**Learning:** Canvas elements displaying semantic spatial data are completely inaccessible to screen readers without an aria-label.\n**Action:** Always provide a dynamically generated `aria-label` and `role="img"` to `<canvas>` elements that visually display map data, translating the visual contents into a descriptive string (e.g., listing detected elements and key statuses).
