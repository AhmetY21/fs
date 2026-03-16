# Sentinel Security Learnings

## 2024-03-24 - API CSRF Protection for Mixed Clients
**Vulnerability:** The main API endpoint (`/api/analyze`) was missing CSRF protection, potentially allowing malicious sites to forge requests.
**Learning:** Next.js API routes that are consumed by both a web application and a native mobile application (like Flutter) cannot blindly enforce strict CSRF header presence (like `Origin` or `Referer`). Native apps do not send these headers by default.
**Prevention:** Implement a conditional CSRF check. Validate the `Origin` header against the `Host` header ONLY when both are present. If either is missing, allow the request to proceed. This provides CSRF defense-in-depth for browser-based attacks while gracefully supporting non-browser clients. Always wrap URL parsing in a `try...catch` block to avoid crashes from malformed `Origin` headers.
