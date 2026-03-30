# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-03-02 - Pre-calculate Static String Generations
**Learning:** Pre-calculating expensive or static string generations at the module level when exporting factory or getter functions avoids redundant runtime overhead across invocations on every API request.
**Action:** When creating text blocks, prompts, or objects that are static across invocations but expensive to calculate due to loops or iterations (like iterating over lists of rules or elements), calculate them at module scope rather than inside the function body so the computation happens only once during module initialization.
