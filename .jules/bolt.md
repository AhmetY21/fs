# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Module-level Pre-calculation for System Prompts
**Learning:** The system prompt in `lib/fengshui-system-prompt.js` was recalculating large string representations of rules and elements using `.map` and `.join` on *every single API request* to the `/api/analyze` route. Since the underlying `FENG_SHUI_RULES` and `FIVE_ELEMENTS` are static constants, this created unnecessary and repeated CPU work on the backend. By moving these calculations to the module scope, they are only computed once when the Next.js server first evaluates the file.
**Action:** Pre-calculate expensive or static string generations at the module level when exporting factory or getter functions to avoid redundant runtime overhead across invocations.
