# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2025-02-18 - Deferred Base64 Conversion
**Learning:** Reading large files as Data URLs (`readAsDataURL`) immediately upon selection blocks the main thread and spikes memory usage, especially if the base64 string is stored in React state.
**Action:** Store the raw `File` object in state and defer base64 conversion until the exact moment it is needed (e.g., just before an API call). Use `URL.createObjectURL` for immediate, lightweight previews.
