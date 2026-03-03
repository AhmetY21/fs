# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-03-03 - Avoid Redundant Prompt Generation in API Routes
**Learning:** In Next.js App Router API handlers, exporting getter or factory functions (like `buildAnalysisSystemPrompt`) that dynamically generate large strings using `Array.map` and `join` on every request introduces unnecessary runtime overhead.
**Action:** Pre-calculate expensive or static string generations at the module level when exporting factory or getter functions to avoid redundant runtime overhead across invocations.
