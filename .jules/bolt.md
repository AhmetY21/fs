# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - System Prompt Caching
**Learning:** Generating large strings (like AI system prompts) on every API request by mapping over static arrays is extremely inefficient and adds unnecessary overhead to serverless function execution.
**Action:** Cache static string generation using module-level variables so the expensive map and join operations are only performed once per instance lifecycle instead of on every request.
