# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Client-Side Image Processing Bottleneck
**Learning:** The `ImageUploader` component was using `FileReader.readAsDataURL` on the client side before sending the image to the API. For a 10MB image limit, this synchronous Base64 conversion blocks the main thread, causing severe UI jank, and significantly inflates the payload size sent over the network (Base64 is ~33% larger than binary).
**Action:** Always use `URL.createObjectURL` for instant local image previews. When sending files to an API, prefer sending raw `File` objects via `FormData` (`multipart/form-data`) and perform any necessary transformations (like Base64 encoding for external APIs) on the server side using `Buffer`.
