## 2024-05-18 - Non-blocking validation
**Learning:** Error banners/tooltips are helpful for validation but should rarely block user input completely or push content down significantly, as users found layout-shift jarring.
**Action:** Use inline error text that sits below inputs without altering surrounding layout padding.

## 2024-05-20 - Accessible Severity Indicators
**Learning:** Using purely colors (red/orange/green) for Feng Shui rule severities caused issues for color-blind users who couldn't differentiate between a minor and severe violation.
**Action:** Always pair color indicators with an icon or numeric severity level (e.g., "Severity 5/5").

## 2024-05-24 - Canvas Accessibility
**Learning:** Canvas elements used to display data (like the Spatial Map in Feng Shui) are invisible to screen readers without an `aria-label` or `aria-description`, missing crucial contextual information for visually impaired users.
**Action:** Always include a dynamically generated `aria-label` (and `role="img"`) on semantic spatial or charting canvases.
