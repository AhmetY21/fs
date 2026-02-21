## 2026-02-21 - Rate Limiter DoS Vector
**Vulnerability:** The in-memory rate limiter `lib/rate-limit.mjs` performed a full scan of the map (O(N)) on *every request* once the map size exceeded 1000 entries. An attacker could flood the map with unique IPs and then trigger high CPU usage by sending subsequent requests, leading to a Denial of Service.
**Learning:** Performance optimizations in security controls (like cleanup logic) must be carefully designed to avoid becoming DoS vectors themselves. Throttle heavy operations.
**Prevention:** Use throttled cleanup (time-based or counter-based) instead of running on every request. Ensure cleanup logic is O(1) or amortized O(1) where possible, or bounded by a reasonable interval.
