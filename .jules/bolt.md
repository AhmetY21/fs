# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Extracting Invariants from Loops
**Learning:** Extracting string transformations (like `.toLowerCase()`) outside of array traversal callbacks (`.find()`, `.filter()`, `.forEach()`, etc.) prevents redundant computations and yields measurable performance gains, particularly in high-iteration processes like UI or canvas rendering loops.
**Action:** Identify and pull out any invariant transformations or object instantiations outside of loops and iterative callbacks.
