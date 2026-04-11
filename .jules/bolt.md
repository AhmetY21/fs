# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - System Prompt Initialization Optimization
**Learning:** In Node.js and Next.js API routes, extracting complex string generation or data mapping into module-level constants effectively caches the result for the lifetime of the serverless function, preventing redundant computation on every request. Building a large prompt repeatedly inside a function is a massive performance bottleneck.
**Action:** When working with large system prompts that depend on static rule bases, always calculate the generated text once at the module level and return the pre-computed constant within the generation function.
