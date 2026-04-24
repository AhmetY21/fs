# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Caching Static API Data Mappings
**Learning:** Extracting static data mappings and string concatenations out of API request handler pathways (and into module-level variables) prevents redundant computation. For components like `lib/fengshui-system-prompt.js`, computing static strings on module load is significantly faster than doing so on every API call.
**Action:** Always identify static data structures that require mapping/joining and extract the final computed results into module-level constants to ensure they only run once on initialization.
