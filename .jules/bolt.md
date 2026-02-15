# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Image Upload Optimization
**Learning:** Eagerly converting large images to Base64 strings blocks the main thread and duplicates memory usage (Blob + Base64 string). Passing `File` objects and using `URL.createObjectURL` for previews is significantly more efficient.
**Action:** Defer Base64 conversion until the moment the API call is made. Use `URL.createObjectURL` for immediate UI feedback.
