# Sentinel's Journal

## 2025-02-18 - [CSRF Bypass for Mixed-Client API Routes]
**Vulnerability:** Missing CSRF protection on API routes.
**Learning:** Next.js backend API routes (e.g., `app/api/analyze/route.js`) are shared with the Flutter mobile app (`feng_shui_app`), which uses a `Dio` client. Security headers like `Origin` or `Host` are not sent by default from the mobile app, requiring endpoint validations to support non-browser clients gracefully by bypassing checks if the headers are absent.
**Prevention:** When validating headers for CSRF protection, safely parse the `Origin` header using `new URL(origin)` within a try-catch block. Enforce the validation only if both `Origin` and `Host` headers are present to gracefully avoid breaking non-browser clients.
