# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Module-level Precalculation
**Learning:** Functions that generate static strings from imported arrays/objects (like `buildAnalysisSystemPrompt`) can become silent performance sinks if they re-execute O(N) array mappings on every API request.
**Action:** When a factory or getter function depends entirely on static imports, hoist the calculation to the module level and cache the result. This transforms a repetitive O(N) operation into an O(1) return.
