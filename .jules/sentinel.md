## 2024-05-18 - Prevent IP Spoofing in Rate Limiter
**Vulnerability:** The rate limiter extracted the leftmost IP from the `x-forwarded-for` header, which is user-controllable and allows attackers to bypass rate limits by spoofing IPs.
**Learning:** The rightmost IP in the `x-forwarded-for` header (or `request.ip`) is the most reliable source for identifying the client's actual IP address, as it is appended by the nearest trusted proxy.
**Prevention:** Always extract the rightmost IP from the `x-forwarded-for` chain or use `request.ip` when implementing security mechanisms like rate limiting.
