# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - API Route Static Generation Caching
**Learning:** In Next.js/Node API routes, extracting static data mappings or complex string generation out of request handler functions and into module-level constants prevents redundant computation across requests. The module is evaluated once, and the cached result is used.
**Action:** Always extract static string interpolations and heavy array mapping functions (like rule joining) to module scope constants in API route files instead of re-computing them inside request handler functions.
