# Bolt's Journal

## 2025-03-01 - Module-Level Constant Caching in API Routes
**Learning:** In Next.js/Node API routes, extracting complex string generation or data mapping into module-level constants effectively caches the result for the lifetime of the serverless function. This prevents redundant O(n) computation (like mapping over static arrays) on every single request.
**Action:** When building static system prompts or configurations that depend only on static constants, extract the mapping and joining logic outside the request handler function to the module scope.

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.
