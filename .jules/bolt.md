# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Caching Generated Strings
**Learning:** In serverless functions (like Next.js API routes), performing complex string generations or array mappings inside the request handler means they run on every request. Extracting them to module-level constants causes them to execute only once per function cold start.
**Action:** When a string generated from static data doesn't depend on request inputs, always extract its generation out of the request handler scope into module-level constants.
