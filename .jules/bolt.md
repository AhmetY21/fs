# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.
## 2024-05-24 - [Pre-calculating static string operations in module scope]
**Learning:** The prompt generation logic in `lib/fengshui-system-prompt.js` unnecessarily regenerated large strings from arrays mapping and joining `FENG_SHUI_RULES` and `FIVE_ELEMENTS` constants. These redundant array operations ran on every API request.
**Action:** Pre-calculate expensive string logic at the module level whenever it depends purely on constant data that does not change between invocations. Exporting just a getter or pre-calculated static constant avoids the overhead across many requests.
