# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2026-02-20 - Rate Limiter Cleanup Performance
**Learning:** A naive rate limiter implementation that iterates the entire Map for cleanup on *every request* once a size threshold is reached creates a quadratic performance degradation (O(N) per request) under load.
**Action:** Implement time-throttled cleanup (e.g., only clean up if `now - lastCleanup > interval`) to ensure cleanup cost is amortized and scalable, regardless of map size.
