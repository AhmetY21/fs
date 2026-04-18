## 2026-04-18 - [Fix IP spoofing vulnerability in rate-limiter]
**Vulnerability:** Client IP can be spoofed by manipulating the `x-forwarded-for` header, bypassing the rate limiter logic.
**Learning:** Only utilizing `x-forwarded-for` provides unreliable and insecure IP address identification. Platforms often provide verified IPs in `request.ip` or `x-real-ip`.
**Prevention:** Always extract IP securely by prioritizing platform-provided verified properties like `request.ip` and fallback to standard headers securely only when missing.