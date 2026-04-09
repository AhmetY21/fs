# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-04-09 - Caching Complex String Generations
**Learning:** In Node.js and Next.js API routes, generating complex strings via multiple array mappings and join operations on every API request can create unnecessary performance overhead.
**Action:** Extract complex string generation (like large AI system prompts) into module-level constants. This effectively caches the result for the lifetime of the serverless function, preventing redundant computation on every request.
