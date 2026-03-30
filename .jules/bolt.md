# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - String Transformation Extraction
**Learning:** Extracting string transformations (e.g., `.toLowerCase()`) outside of array traversal callbacks (like `.find()`, `.filter()`, or `.forEach()`) prevents redundant computations and can yield significant performance gains, especially in high-iteration UI components like canvas rendering loops.
**Action:** Always inspect array traversals in React/Next.js components and extract invariant string manipulations or heavy computations before the loop starts.