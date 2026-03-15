# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.
## 2023-10-24 - Module-Level Caching for Static Generative Prompts
**Learning:** Functions generating static string prompts with expensive operations (like mapping and joining large arrays) should pre-calculate those strings at the module level instead of within the function body. The `buildAnalysisSystemPrompt` function was recalculating the rules and elements text on every API request, causing unnecessary CPU overhead.
**Action:** Always pre-calculate expensive or static string generations at the module level when exporting factory or getter functions to avoid redundant runtime overhead across invocations.
