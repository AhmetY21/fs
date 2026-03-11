# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-19 - System Prompt Generation Optimization
**Learning:** System prompt generation in `lib/fengshui-system-prompt.js` is optimized by pre-calculating the knowledge base and final prompt string at module load time to avoid redundant runtime overhead. In tests, mapping the arrays and concatenating the string for every call took ~148ms over 10000 runs, dropping to ~0.8ms after lifting the logic to the module scope.
**Action:** Always pre-calculate expensive or static string generations at the module level when exporting factory or getter functions if the content does not change between invocations.
