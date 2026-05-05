
## 2024-05-05 - Fix Rate Limit IP Spoofing Bypass
**Vulnerability:** The rate limiter was extracting the leftmost IP from the `x-forwarded-for` header, which can be freely manipulated by attackers to spoof their IP address and bypass rate limits.
**Learning:** Attackers can easily bypass rate limiters if the client-provided (leftmost) IP in the `x-forwarded-for` chain is trusted. The rightmost IP is added by the last proxy (closest to the server) and is more reliable.
**Prevention:** Prioritize `request.ip`, `x-real-ip`, or the last IP (rightmost) in the `X-Forwarded-For` chain to prevent IP spoofing bypasses.
