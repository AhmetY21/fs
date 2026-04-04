# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-04-04 - Cache System Prompt Generation
**Learning:** The system prompt logic in `lib/fengshui-system-prompt.js` used to dynamically rebuild string arrays (`rulesText` and `elementsText`) and interpolate them into a large template literal string on every `/api/analyze` request. Because the rules and elements are completely static data, this resulted in unnecessary and redundant string computation, array mapping, and object allocations.
**Action:** Cache generated static strings in module-level constants (e.g., `SYSTEM_PROMPT`) to prevent redundant string computation and object allocations during runtime.
