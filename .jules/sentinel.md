## 2025-02-20 - Fix rate limit bypass via IP spoofing
**Vulnerability:** A rate limit bypass vulnerability where malicious actors can spoof the `x-forwarded-for` header to circumvent the rate limit.
**Learning:** The previous implementation solely relied on `x-forwarded-for`, which can be easily spoofed if the application is not behind a trusted proxy that strips or overwrites the header securely.
**Prevention:** To prevent this, always prioritize securely provided IP addresses such as `request.ip` (populated by the hosting platform, e.g., Vercel) and `x-real-ip` before falling back to the `x-forwarded-for` header.
