# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.
## 2024-05-14 - Expensive String Generation in API Handlers
**Learning:** In Next.js/Node API routes, constructing large system prompts dynamically with array mappings (like formatting rules and element definitions) inside request handler functions causes redundant computation on every request.
**Action:** Extract static data mappings or complex string generation out of request handler functions and into module-level constants to cache results and prevent redundant computation across requests.
