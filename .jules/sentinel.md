## 2024-05-14 - Fix CPU DoS in Rate Limiter and API CSRF Protection
**Vulnerability:** The rate limiter implemented an O(N) cleanup logic, and the `analyze` API lacked CSRF protection as well as safe retrieval of the IP address (relying strictly on `x-forwarded-for`).
**Learning:** `x-forwarded-for` is easily spoofed; `request.ip` should be the primary method for resolving IPs securely. `Map` objects without a strict cap and quick eviction can be overloaded.
**Prevention:** In Next.js App Router API handlers, always use `request.ip` to retrieve the client IP address securely, using `x-forwarded-for` headers only as a fallback. For rate limiters, employ O(1) LRU eviction strategies with a hard cap to avoid CPU DOS. Always validate `Origin` vs `Host` on sensitive APIs to stop CSRF.
