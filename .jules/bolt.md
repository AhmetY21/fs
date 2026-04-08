# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - System Prompt Caching
**Learning:** Extracting complex string generation (like large template literals mapping arrays and objects) to module-level constants in Node.js/Next.js API routes caches the result for the lifetime of the serverless function. This prevents redundant computation and memory allocations on every API request.
**Action:** Move expensive string concatenation and data mapping that do not depend on request-specific data out of request handlers and into module-level variables.