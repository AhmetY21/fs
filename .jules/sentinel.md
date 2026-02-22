## 2026-02-22 - [Algorithmic Complexity DoS in Rate Limiter]
**Vulnerability:** A simple `Map`-based rate limiter implemented an O(N) cleanup loop that triggered on *every request* once the map size exceeded a threshold (1000). Attackers could spoof IPs to fill the map, causing legitimate requests to block the event loop for significant durations (ReDoS/DoS).
**Learning:** Naive data structure maintenance on the hot path (every request) creates vulnerability vectors. Security utilities must be performant even under attack conditions.
**Prevention:**
1. Throttle maintenance tasks (e.g., run cleanup once per minute, not on every request).
2. Set hard limits on data structure size (memory cap).
3. Always test rate limiters with worst-case inputs (large map size).
