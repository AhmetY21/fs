# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Deferring Heavy Data Processing
**Learning:** Storing large data (like Base64 strings of images) in React state can cause performance issues and increased memory usage.
**Action:** Defer heavy data processing (like `FileReader.readAsDataURL`) until the last responsible moment (e.g., just before an API call) instead of doing it eagerly on file selection. Use lightweight object URLs for previews.
