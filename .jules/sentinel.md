## 2025-02-18 - [Manual IP Parsing & DoS Risks]
**Vulnerability:** Found manual `x-forwarded-for` parsing allowing IP spoofing, and an O(N) cleanup loop in the rate limiter triggered on every request under load.
**Learning:** Manual header parsing bypasses framework protections. Naive cache cleanup logic can become a DoS vector.
**Prevention:** Use `request.ip` in Next.js Route Handlers. Throttle cleanup operations with timestamps (`lastCleanup`) to ensure O(1) amortized performance.
