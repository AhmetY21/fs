## 2025-04-02 - Next.js API CSRF Protection for Shared Endpoints

**Vulnerability:** Next.js API endpoints lacked CSRF (Cross-Site Request Forgery) protection via Origin/Host header validation. This allowed potentially malicious websites to trigger actions on behalf of users if they were authenticated.

**Learning:** Shared API routes (consumed by both web browsers and mobile apps like Flutter) complicate CSRF protection because mobile app clients (like Dio) often do not send `Origin` or `Host` headers by default. Enforcing strict header presence breaks mobile functionality.

**Prevention:** Implement CSRF validation by comparing the `Origin` header to the target host (using `Host` or `x-forwarded-host`). Crucially, conditionally apply this validation: only perform the check if the `Origin` header AND either the `Host` or `x-forwarded-host` headers are present, allowing safe bypass for mobile clients. Also safely parse the origin URL and properly handle proxy configurations like extracting the first element of a comma-separated `x-forwarded-host`.
