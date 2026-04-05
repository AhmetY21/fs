# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-04-05 - Optimize static string generation
**Learning:** The system prompt logic in `lib/fengshui-system-prompt.js` is optimized to cache generated strings in module-level constants, preventing redundant computation and object allocations during runtime.
**Action:** For string concatenations built from static data structures (like maps/rules) that do not change at runtime, cache the result in a module-level variable to improve performance and reduce garbage collection overhead on every request.
