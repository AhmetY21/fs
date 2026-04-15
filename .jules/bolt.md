# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - System Prompt Caching
**Learning:** In Next.js serverless API routes, extracting heavy string generation and template literal evaluations (like mapping over 50+ objects and joining them) into module-level constants caches the result for the lifetime of the serverless function, preventing redundant computation and object allocation on every request.
**Action:** Always extract static configurations or string generation logic that does not depend on request-specific data out of the request handler or function body and into module-level constants.
