# Bolt's Journal

## 2025-02-18 - Font Optimization
**Learning:** Next.js `next/font` provides a significant performance boost by self-hosting Google Fonts and handling loading strategies automatically. It replaces the need for manual `<link>` tags and CSS `@import`.
**Action:** Always prefer `next/font` over external font services in Next.js projects. Ensure global CSS variables are updated to use the variables provided by the font loader.

## 2024-05-24 - [Avoid Base64 JSON Payloads for Large Files]
**Learning:** Sending large images as Base64 encoded strings within a JSON payload to the Next.js API route was causing main-thread blocking on the client during the `FileReader` conversion, and increasing the network payload size by ~33%. Next.js App Router API handlers are capable of parsing `multipart/form-data` using `request.formData()` smoothly.
**Action:** When handling file uploads on the client, prefer passing the raw `File` object via `FormData` rather than reading it into a Base64 string on the frontend. Convert the file to Base64 using `Buffer.from(await file.arrayBuffer()).toString('base64')` only on the server if external APIs (like Gemini) require it.
