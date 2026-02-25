## 2025-02-17 - Next.js App Router IP Spoofing
**Vulnerability:** The rate limiter relied solely on `x-forwarded-for` headers, allowing attackers to spoof IPs and bypass limits.
**Learning:** Next.js App Router exposes the trusted client IP via `request.ip` (on platforms like Vercel). Relying on headers manually is insecure unless behind a trusted proxy that strips them.
**Prevention:** Always use `request.ip` for security-sensitive logic (like rate limiting) in Next.js App Router, falling back to headers only for local development.

## 2025-02-17 - In-Memory Rate Limiter DoS
**Vulnerability:** The in-memory rate limiter Map grew indefinitely with unique IPs, exposing the server to Memory Exhaustion Denial of Service.
**Learning:** Simple Map-based caches must have a hard size limit or eviction policy to prevent resource exhaustion attacks.
**Prevention:** Implement a hard cap (e.g., `map.size > 10000 -> map.clear()`) on all in-memory storage used for security tracking.
