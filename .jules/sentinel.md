## 2024-05-24 - CSRF Protection for Shared API Endpoints
**Vulnerability:** Missing CSRF (Cross-Site Request Forgery) protection on Next.js API routes (`app/api/analyze/route.js`).
**Learning:** Adding standard CSRF protection (comparing `Origin` to `Host`) can break non-browser clients (like the Flutter mobile app in this project) that do not send these headers by default.
**Prevention:** To safely protect shared endpoints, parse and validate the `Origin` header using `new URL()` against the `Host` header ONLY when both headers are present. This prevents browser-based CSRF attacks while gracefully allowing legitimate mobile client traffic.
