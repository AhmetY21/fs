# Sentinel's Journal

## 2025-03-01 - [IP Spoofing & CSRF Protection in API Routes]
**Vulnerability:** The `/api/analyze` endpoint was relying solely on `x-forwarded-for` for rate limiting, which is vulnerable to IP spoofing. Additionally, there was no CSRF protection, allowing potential cross-origin attacks.
**Learning:** In Next.js App Router API handlers, blindly trusting `x-forwarded-for` for rate limiting allows attackers to bypass limits. Also, state-changing API endpoints must validate the `Origin` header against the `Host` header to prevent CSRF.
**Prevention:** Always use `request.ip` securely, using `x-forwarded-for` headers only as a fallback for local development. Implement Origin validation using `new URL(origin)` and ensure `originUrl.host === host` to block cross-origin browser requests while allowing server-to-server calls.
