# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.
## 2025-04-12 - System Prompt Caching
**Learning:** Generating large string payloads using `.map` and `.join` on every API request in Next.js/Node.js API routes adds unnecessary CPU overhead and garbage collection. Extracting complex string generation into module-level constants effectively caches the result for the lifetime of the serverless function, preventing redundant computation.
**Action:** Always look for opportunities to pre-compute and cache heavy text or template generation at the module level in API routes, especially for values that depend entirely on static configurations or constants.
