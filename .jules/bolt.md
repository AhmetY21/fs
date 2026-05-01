# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - API Route Static Constants
**Learning:** In Next.js/Node API routes, performing static data mappings or complex string generation inside request handler functions causes redundant O(N) computation on every incoming request.
**Action:** Extract static data mappings and complex string generation out of request handler functions and into module-level constants to cache results and improve response times.
