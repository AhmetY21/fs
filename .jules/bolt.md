# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-05-03 - Cache Static Computations in API Routes
**Learning:** Constant recalculation of large static strings from data objects in Next.js API route handlers wastes CPU and delays response.
**Action:** Cache static string generations into module-level variables so they are generated once per server lifespan.
