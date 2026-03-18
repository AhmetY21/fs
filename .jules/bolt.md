# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-24 - Pre-calculating Static Strings
**Learning:** Generating large string templates (like system prompts with extensive rules) inside a function that runs on every API request causes redundant CPU overhead and memory allocation, blocking the main thread during request handling.
**Action:** Always pre-calculate expensive or static string generations at the module level when exporting factory or getter functions to avoid redundant runtime overhead across invocations.
