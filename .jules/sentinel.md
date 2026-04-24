## 2026-04-24 - Fix X-Forwarded-For Rate Limit Bypass
**Vulnerability:** Rate limit relies on the first IP in the X-Forwarded-For header, allowing attackers to spoof it and bypass limits.
**Learning:** Proxies append the real IP to the end of the X-Forwarded-For list. Trusting the first element allows trivial client spoofing.
**Prevention:** Always extract the last IP in the X-Forwarded-For list (right-to-left) or use request.ip if provided by the framework.