# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Extracting String Transformations from Render Loops
**Learning:** Executing string operations like `.toLowerCase()` inside array traversal callbacks (e.g., `elements.find()`) within high-iteration UI render cycles (such as the HTML Canvas render loop in `SpatialOverlay`) results in redundant, repetitive allocations that can cause noticeable lag or framerate drops during layout calculations.
**Action:** Always extract invariant string transformations and evaluations outside of loop closures or callbacks before iterating to minimize processing overhead and garbage collection pauses.