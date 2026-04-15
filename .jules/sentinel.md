## 2024-05-24 - Rate Limiting Bypass via IP Spoofing
**Vulnerability:** The rate limit in Next.js API relies on the `x-forwarded-for` header without any validation, which can be easily spoofed by malicious clients to bypass rate limits entirely.
**Learning:** Naively trusting client-provided IP headers like `x-forwarded-for` without falling back securely or prioritizing the actual network IP allows for simple rate limiting bypass.
**Prevention:** Use a prioritized fallback logic, checking platform-provided IP (`request.ip`), then `x-real-ip`, before finally relying on `x-forwarded-for` (with potential extra validation if needed) or `127.0.0.1`.
