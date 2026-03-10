# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-24 - FormData for File Uploads
**Learning:** Converting raw images to Base64 using `FileReader` on the client blocks the main thread and significantly increases the network payload (~33%). Using `FormData` with raw `File` objects avoids the synchronous conversion and uploads binary directly, dramatically improving upload performance.
**Action:** Always utilize `FormData` with binary `File` objects for image uploads instead of base64-encoded strings inside JSON payloads, unless constrained by API requirements that exclusively demand base64 upfront. Server-side conversion to base64 takes the computational load off the client.
