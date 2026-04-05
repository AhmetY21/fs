## 2024-05-15 - Implement CSRF Protection and IP Extraction Improvements

**Vulnerability:** The `/api/analyze` API route lacked Cross-Site Request Forgery (CSRF) protection. Malicious websites could forge requests to this endpoint on behalf of users. In addition, the IP address extraction for rate limiting solely relied on `x-forwarded-for`, which can be spoofed by attackers to bypass rate limits or cause denial of service (DoS) for legitimate users.

**Learning:** Next.js API routes do not have built-in CSRF protection like some full-stack frameworks. You have to manually implement header validation or use anti-CSRF tokens. Furthermore, when hosted on platforms like Vercel, `request.ip` and `x-real-ip` should be prioritized over `x-forwarded-for` to obtain the actual client IP reliably, but a fallback is still needed for local environments.

**Prevention:** To prevent CSRF attacks on API endpoints, parse and validate the `Origin` or `Referer` headers against the expected `Host` or `x-forwarded-host`. For reliable rate limiting, extract the client IP securely by checking `request.ip`, `x-real-ip`, and keeping `x-forwarded-for` as a fallback.
