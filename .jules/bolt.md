# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - File Upload Performance
**Learning:** Sending raw `File` objects via `FormData` rather than reading and passing Base64 encoded JSON over HTTP significantly improves performance. Base64 encoding using `FileReader.readAsDataURL` on the client blocks the main thread, leading to jittery or frozen UIs during upload of larger files, and results in ~33% larger payloads.
**Action:** Always prefer `FormData` with raw `File` objects for file uploads instead of Base64 JSON conversion on the frontend, handling the data processing or conversions on the server. Use `URL.createObjectURL` for lightweight, immediate local client-side previews.
