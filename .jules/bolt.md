# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Caching API Route Prompt Generation
**Learning:** In serverless environments like Next.js API routes, extracting complex template literal generations (e.g., dynamically mapping large constant arrays into system prompts) into module-level constants prevents redundant object allocation and CPU cycles on every invocation. The module scope is cached across the lifespan of the serverless function.
**Action:** When a serverless function generates a large static string based on static constants, extract the string generation to the module scope so it is computed only once during initialization, rather than inside the route handler.
