# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Serverless Cold Path Optimization
**Learning:** In Next.js API routes or serverless functions, generating large static template strings using mapping operations on every invocation adds significant overhead.
**Action:** Extract the complex static string generation or data mapping into module-level constants. This effectively caches the result in memory for the lifetime of the serverless instance, skipping the computation on every request.
