# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - System Prompt Caching
**Learning:** In serverless API routes (like Next.js), complex string generation, concatenation, and array mapping for system prompts run on every request if placed inside the function body. This adds significant CPU overhead and garbage collection pressure under load.
**Action:** Always extract static data processing and string generation into module-level constants. They are evaluated once when the module loads and effectively cached for the lifetime of the serverless function.
