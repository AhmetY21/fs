# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Optimized Image Uploads
**Learning:** Sending base64-encoded images in JSON payloads adds ~33% overhead and requires expensive client-side processing. Using `multipart/form-data` with `FormData` avoids this overhead and offloads processing to the server.
**Action:** Prefer `FormData` over JSON for file uploads to improve client responsiveness and reduce network usage.
