# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-03-19 - Pre-calculate static string generations
**Learning:** Next.js API routes that export a function, or any function that is called repeatedly, can incur unnecessary performance overhead if they generate static strings using array traversals (`.map`, `.join`) or string interpolations inside the function body.
**Action:** Always pre-calculate expensive or static string generations at the module level when exporting factory or getter functions to avoid redundant runtime overhead across invocations.
