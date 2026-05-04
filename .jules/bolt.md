# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.
## 2025-05-18 - Caching static data generation in Next.js API routes
**Learning:** Extracting static string generation or expensive data mapping out of API request handler functions (or functions that build the prompt) and into module-level constants caches the results, avoiding redundant calculation and memory allocation on every API request or prompt build.
**Action:** Always move static arrays, mappings, or heavy string templates (like system prompts) to module-level scope so they are only initialized once when the module loads, instead of per request.
