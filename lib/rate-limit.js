// Simple in-memory rate limiter for Next.js API routes

const rateLimit = new Map();

/**
 * Securely retrieve client IP address, prioritizing platform-provided
 * trusted IP (e.g., Next.js req.ip on Vercel) over headers.
 *
 * @param {Request} request - The incoming request object.
 * @returns {string} - The client IP address.
 */
export function getClientIp(request) {
  // 1. Prefer platform-provided trusted IP (e.g. Vercel/Next.js)
  // This prevents spoofing via X-Forwarded-For if not behind a proxy that strips it.
  if (request.ip) {
    return request.ip;
  }

  // 2. Fallback to X-Forwarded-For (for local dev or other environments)
  const forwardedFor = request.headers.get('x-forwarded-for');
  if (forwardedFor) {
    return forwardedFor.split(',')[0].trim();
  }

  // 3. Last resort fallback
  return '127.0.0.1';
}

/**
 * Rate limit requests based on IP address.
 *
 * @param {string} ip - The IP address to rate limit.
 * @param {number} limit - Maximum number of requests allowed in the window. Default 10.
 * @param {number} windowMs - Time window in milliseconds. Default 60000 (1 minute).
 * @returns {boolean} - True if request is allowed, false if limit exceeded.
 */
export function rateLimiter(ip, limit = 10, windowMs = 60000) {
  const now = Date.now();
  const record = rateLimit.get(ip) || { count: 0, startTime: now };

  // Check if window has expired
  if (now - record.startTime > windowMs) {
    // Reset window
    record.count = 1;
    record.startTime = now;
  } else {
    // Increment count
    record.count++;
  }

  rateLimit.set(ip, record);

  // Cleanup old entries periodically
  // SECURITY: Prevent Memory Exhaustion DoS
  // If map grows too large (e.g., attackers rotating IPs), clear it.
  if (rateLimit.size > 10000) {
    rateLimit.clear();
  } else if (rateLimit.size > 1000) {
    // Basic cleanup: remove entries older than windowMs
    for (const [key, val] of rateLimit.entries()) {
      if (now - val.startTime > windowMs) {
        rateLimit.delete(key);
      }
    }
  }

  return record.count <= limit;
}
