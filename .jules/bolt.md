# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - File Upload Optimization
**Learning:** Reading large files as Base64 on the client (FileReader) blocks the main thread and increases payload size by ~33%. Using FormData with File objects is non-blocking and bandwidth-efficient.
**Action:** always prefer FormData for file uploads in Next.js, handling format conversion (like Base64 for AI APIs) on the server to keep the client responsive.
