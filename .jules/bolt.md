# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2026-04-27 - Cache Static System Prompt
**Learning:** In Next.js/Node API routes, extracting static data mappings and string generation out of request handler functions caches the result and prevents redundant computation across requests.
**Action:** Always cache statically generated system prompts or complex derived data at the module level rather than re-computing them on every request.
