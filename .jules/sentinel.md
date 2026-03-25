## 2024-05-24 - Rate Limit Bypass via Spoofed x-forwarded-for

**Vulnerability:** The rate limiter in the `app/api/analyze/route.js` API route was vulnerable to bypass. It extracted the client IP address using the first element of the `x-forwarded-for` header (`request.headers.get('x-forwarded-for').split(',')[0]`). This allows an attacker to spoof their IP by prepending a fake IP to the `x-forwarded-for` header, bypassing the rate limits.

**Learning:** In Next.js applications, extracting the first element of `x-forwarded-for` is inherently insecure if a proxy does not overwrite it or explicitly sanitize user-provided headers. An attacker can trivially send a request with an `x-forwarded-for: 1.2.3.4` header; when it passes through a load balancer, the real IP is appended (`x-forwarded-for: 1.2.3.4, <REAL_IP>`). By taking the first element, the application uses the attacker's spoofed IP (`1.2.3.4`).

**Prevention:** To securely extract a client's IP address:
1. Always prioritize `request.ip` (populated by platforms like Vercel/Next.js).
2. Fallback to `x-real-ip` if available and trusted.
3. If using `x-forwarded-for`, extract the LAST element in the comma-separated list (`.split(',').pop().trim()`), as this is the IP appended by the trusted proxy closest to the application, preventing user-prepended spoofed IPs from being used.