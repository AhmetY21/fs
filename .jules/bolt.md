# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - System Prompt Caching
**Learning:** In LLM integrations, building massive system prompts by dynamically stringifying and concatenating large arrays or static configurations per-request adds significant CPU overhead and memory churn (e.g. going from ~1000ms to ~2ms for 100,000 iterations when caching). Next.js API routes benefit greatly from module-level caching for such static objects since the module scope persists across requests in the serverless environment.
**Action:** For static configurations or large prompt definitions that do not depend on request-specific context, always compute them once and store them in a module-level variable to reuse across subsequent requests.
