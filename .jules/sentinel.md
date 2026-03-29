
## 2024-05-27 - [Add CSRF Protection and Improve IP Extraction]
**Vulnerability:** Missing CSRF validation on API routes, and insecure extraction of client IP using just `x-forwarded-for` fallback which could be spoofed.
**Learning:** Mobile apps might not send `Origin` by default, so CSRF validations on shared API endpoints must be bypassed when `Origin` is absent to support non-browser clients gracefully. Proper IP extraction needs to prioritize `request.ip` or `x-real-ip` before falling back to `x-forwarded-for`.
**Prevention:** Implement validation that compares `Origin` against `Host` headers. Extract IP by checking `request.ip` or `x-real-ip` as primary sources. Use `new URL(origin)` for secure Origin comparisons and handle proxy modifications correctly.
