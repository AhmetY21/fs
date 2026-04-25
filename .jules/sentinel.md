## 2024-05-24 - IP Spoofing in Rate Limiting
**Vulnerability:** The rate limiter relied directly on the `x-forwarded-for` header for IP tracking, which allowed clients to easily bypass rate limits by spoofing this header.
**Learning:** Directly trusting easily manipulated client headers like `x-forwarded-for` for security boundaries creates trivially exploitable bypasses.
**Prevention:** Prioritize framework-provided trusted values like Next.js's `request.ip` or secure ingress headers like `x-real-ip` before falling back to `x-forwarded-for`. Ensure proxies correctly sanitize these headers.
