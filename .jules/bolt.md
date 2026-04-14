# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-03-05 - Pre-calculate Dynamic Constants
**Learning:** Extracting complex string generation or data mapping into module-level constants effectively caches the result for the lifetime of the serverless function, preventing redundant computation and object allocations on every API request.
**Action:** Pre-calculate static configurations outside of functions where appropriate to prevent unnecessary work on hot code paths.
