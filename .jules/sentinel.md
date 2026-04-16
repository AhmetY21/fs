## 2025-02-28 - Missing CSRF and Origin Validation on API route

**Vulnerability:** The `/api/analyze` API route was missing Origin and Referer validation, potentially exposing it to Cross-Site Request Forgery (CSRF) attacks when used by a browser client. Additionally, extracting the client IP using only the `x-forwarded-for` header is insecure without checking platform properties like `request.ip` or `request.headers.get('x-real-ip')` first.

**Learning:** Next.js Serverless API routes (not actions) do not inherently protect against CSRF attacks without explicit origin checks. We must validate `Origin` and `Referer` against the `Host` or `X-Forwarded-Host` headers to ensure requests originate from the expected domain while securely extracting the client IP address.

**Prevention:** Always implement explicit CSRF and Origin checks on POST API routes. Prioritize platform-provided IP properties (`request.ip` or `x-real-ip`) over just `x-forwarded-for` to prevent IP spoofing in rate limiters.
