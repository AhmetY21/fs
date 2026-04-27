// Simple in-memory rate limiter for Next.js API routes

const rateLimit = new Map();
let lastCleanup = Date.now();

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
  if (now - lastCleanup > windowMs) {
    lastCleanup = now;
    for (const [key, val] of rateLimit.entries()) {
      if (now - val.startTime > windowMs) {
        rateLimit.delete(key);
      }
    }
  }

  // Prevent unbounded Map growth leading to DoS
  if (rateLimit.size > 10000) {
    const oldestKey = rateLimit.keys().next().value;
    rateLimit.delete(oldestKey);
  }

  return record.count <= limit;
}
