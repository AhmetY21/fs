## 2026-02-24 - IP Spoofing Prevention in Next.js
**Vulnerability:** Next.js API Routes using `x-forwarded-for` directly are vulnerable to IP spoofing if `request.ip` is ignored.
**Learning:** `request.ip` is a trusted property provided by Next.js on supported platforms (like Vercel) that handles IP resolution securely.
**Prevention:** Always use `const ip = request.ip || request.headers.get('x-forwarded-for')` to prioritize the trusted IP.
