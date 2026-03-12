# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - FormData for File Uploads
**Learning:** Using `FileReader` to base64-encode large files on the client side blocks the main thread and significantly increases the network payload size (by ~33%).
**Action:** Always use `FormData` and raw `File` objects for client-to-server uploads. Parse the form data on the server using `request.formData()`, where `Buffer` can handle processing more efficiently without freezing the user interface.
