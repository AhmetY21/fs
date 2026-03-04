## 2025-03-04 - Rate Limit Bypass via IP Spoofing
**Vulnerability:** The rate limiter was solely relying on the `x-forwarded-for` header to identify the client IP. This header can be easily spoofed by malicious actors to bypass rate limits.
**Learning:** In Next.js App Router API handlers, always use `request.ip` to retrieve the client IP address securely. `x-forwarded-for` should only be used as a fallback for local development or when explicitly behind a trusted proxy that strips user-provided headers.
**Prevention:** Use `request.ip` as the primary source of truth for the client IP address in Next.js applications, falling back to `x-forwarded-for` only when `request.ip` is undefined (e.g., in local development).
