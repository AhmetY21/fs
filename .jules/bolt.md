# Bolt's Journal

## 2025-02-18 - Static Prompt Generation Caching
**Learning:** In Next.js API routes, extracting complex string generation or data mapping (like dynamically building large system prompts from constants) into module-level variables effectively caches the result for the lifetime of the serverless function, preventing redundant computation on every request.
**Action:** Always extract static string generation or expensive mappings of constant data outside of the function scope in serverless environments to minimize execution time.

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.
