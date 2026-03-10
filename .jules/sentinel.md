## 2024-03-10 - [Critical Next.js App Router API IP Spoofing Risk]
**Vulnerability:** IP Spoofing in API rate limiter
**Learning:** In Next.js App Router API handlers, naively trusting the `x-forwarded-for` header for rate limiting without first checking `request.ip` allows clients to easily bypass limits by spoofing their IP.
**Prevention:** Always use `request.ip` (from NextRequest) securely as the primary method to retrieve the client IP, falling back to `x-forwarded-for` headers only if necessary for local development environments.