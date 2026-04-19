# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-04-19 - Caching Complex String Generation in Serverless Functions
**Learning:** Generating large, complex string templates mapping extensive static data structures (like prompt building) within an API route handler causes redundant computation and object allocation on every invocation.
**Action:** Extract static string generation logic into module-level constants. In Node.js/Next.js environments, these are evaluated once during the cold start and cached for the lifetime of the serverless function, dramatically reducing the per-request CPU load and memory footprint.
