## 2025-02-14 - Fix DoS Vulnerability in Rate Limiter

**Vulnerability:**
The in-memory rate limiter `rateLimit` map was susceptible to memory exhaustion (DoS) via IP spoofing because it had an unbounded map size, and its periodic cleanup was an unoptimized O(N) operation triggered every time `rateLimit.size > 1000`. This resulted in severe performance degradation under an IP spoofing flood.

**Learning:**
Relying on O(N) cleanup iterations on every request for maps bounded only conditionally can rapidly bring down service performance due to JavaScript single-threaded event loop blocking. Always ensure that memory bounds (e.g., maximum map size limits) are strictly enforced and cleanups do not linearly block the event loop for each request.

**Prevention:**
1. Switch to an O(1) time-based periodic cleanup rather than on-request size-based triggers.
2. Implement a strict, hard boundary on the data structure size (`MAX_MAP_SIZE = 10000`) and prune oldest items continuously to prevent unrestricted growth.
