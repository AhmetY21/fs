# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Cache API Route Constants
**Learning:** System prompts or other static data that require complex generation (e.g. mapping over arrays and joining strings) inside API routes can cause redundant computation on every request. In Node/Next.js, extracting these to module-level constants caches the result for the lifetime of the Lambda/serverless function.
**Action:** When a function returned by an API route always returns the same large generated string or object, compute it once outside the function scope (as a module-level constant) instead of rebuilding it per request.
