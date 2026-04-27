## 2026-04-27 - Rate Limiter DoS vulnerability
**Vulnerability:** The in-memory rate limiter performed an O(N) cleanup iteration on every request once the map exceeded 1000 items, causing CPU exhaustion when flooded with unique IPs.
**Learning:** Unthrottled Map iterations on the request path cause DoS.
**Prevention:** Only run O(N) cleanup periodically using a last-cleanup timestamp and implement a strict maximum size cap for in-memory structures.
