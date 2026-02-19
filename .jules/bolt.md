# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2026-02-19 - Binary Image Uploads
**Learning:** Sending images as Base64 JSON strings increases payload size by ~33% and blocks the main thread during encoding/decoding. `FormData` allows streaming binary uploads, significantly reducing memory pressure and network latency for large files.
**Action:** Always prefer `multipart/form-data` for file uploads over JSON-encoded Base64 strings. Use `URL.createObjectURL` for instant client-side previews instead of `FileReader`.
