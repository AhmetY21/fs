# Bolt's Journal

## 2025-02-18 - System Prompt Caching
**Learning:** Extracting complex string generation and data mapping into module-level constants in Next.js API routes effectively caches the result for the lifetime of the serverless function, preventing redundant computation and memory allocations on every request.
**Action:** Always extract static configuration and large string templates into module-level constants outside the main function scope.

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.
