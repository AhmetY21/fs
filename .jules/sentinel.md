## 2025-02-18 - Header Validation and IP Extraction Issues
**Vulnerability:** The `/api/analyze` endpoint was missing CSRF protection via Origin header validation and was susceptible to IP spoofing by directly parsing the `x-forwarded-for` header without checking `x-real-ip` or the request IP.
**Learning:** Next.js API routes require manual enforcement of CSRF protection using headers and must correctly handle multi-tier proxy architectures by prioritizing direct IP properties and robustly parsing standard headers.
**Prevention:** Always validate `Origin` against `Host` or `x-forwarded-host` in Next.js API endpoints, and securely extract IP addresses using `request.ip` and `x-real-ip` before falling back to `x-forwarded-for`.
