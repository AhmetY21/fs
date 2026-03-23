## 2025-05-27 - [Add CSRF Protection to Next.js API Route for Non-Browser Compatibility]
**Vulnerability:** The API endpoint `app/api/analyze/route.js` lacked CSRF protection, allowing potential cross-origin requests to consume rate limits and Gemini API quota.
**Learning:** Next.js API routes shared with mobile apps (like Flutter) don't receive `Origin` or `Host` headers by default. Standard CSRF middleware breaks these non-browser clients if it strictly requires the headers.
**Prevention:** Implement custom origin validation that safely parses `Origin` using `new URL()` in a try-catch block, but ONLY enforces the check if *both* `Origin` and `Host` headers are present, allowing safe bypass for mobile clients while protecting web users.
