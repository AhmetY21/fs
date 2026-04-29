# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Cache static string generation
**Learning:** Generating long static strings using `.map().join()` on every API request is a performance bottleneck. Extracting these into module-level constants reduces redundant computation and string allocations per request.
**Action:** Always pre-calculate static text/strings outside of request handler functions.
