## 2024-04-17 - Prevent IP Spoofing for Rate Limit Bypass
**Vulnerability:** The rate limiter in `app/api/analyze/route.js` solely relied on the `x-forwarded-for` header for IP extraction, allowing attackers to bypass rate limiting entirely by spoofing this header with random IPs.
**Learning:** Naively trusting client-provided headers like `x-forwarded-for` for security controls like rate limiting is dangerous in a Next.js environment where `request.ip` and `x-real-ip` (populated by the platform) are more reliable sources of truth.
**Prevention:** Always prioritize trusted IP sources (`request.ip` or `x-real-ip`) over user-controllable headers. Keep `x-forwarded-for` only as a fallback for specific environments, ensuring robust defense-in-depth for IP-based security mechanisms.
