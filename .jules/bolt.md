# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - File Upload Optimization
**Learning:** Using `FileReader` to convert images to Base64 strings on the client-side blocks the main thread and increases memory usage significantly (Base64 is ~33% larger than binary). Sending this Base64 string in a JSON payload to the server is inefficient compared to `multipart/form-data`.
**Action:** For file uploads, always use `FormData` with the native `File` object. Handle the `FormData` on the server (using `request.formData()` in Next.js App Router) and perform any necessary conversions (e.g., to Base64 for external APIs) on the server-side, where `Buffer` handling is more efficient.
