
## 2024-10-24 - [High] IP Spoofing Prevention in Next.js
**Vulnerability:** Next.js API Routes were vulnerable to IP spoofing because the rate limiter relied exclusively on the easily manipulated `x-forwarded-for` header for client IP extraction.
**Learning:** `request.ip` natively retrieves the true client IP in a secure manner in Next.js App Router API handlers when deployed (falling back appropriately). Exclusively parsing headers without checking `request.ip` allows clients to circumvent IP-based rate limits simply by passing arbitrary `X-Forwarded-For` headers.
**Prevention:** Always use `request.ip` as the primary source of truth for the client IP address in Next.js route handlers, utilizing `x-forwarded-for` headers strictly as a fallback for local development or explicit proxying contexts.
