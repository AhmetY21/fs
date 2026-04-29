// Simple in-memory rate limiter for Next.js API routes

const rateLimit = new Map();

/**
 * Rate limit requests based on IP address.
 *
 * @param {string} ip - The IP address to rate limit.
 * @param {number} limit - Maximum number of requests allowed in the window. Default 10.
 * @param {number} windowMs - Time window in milliseconds. Default 60000 (1 minute).
 * @returns {boolean} - True if request is allowed, false if limit exceeded.
 */
let lastCleanup = Date.now();

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

  // SECURITY: O(1) periodic cleanup instead of O(N) on every request
  if (now - lastCleanup > windowMs) {
    for (const [key, val] of rateLimit.entries()) {
      if (now - val.startTime > windowMs) {
        rateLimit.delete(key);
      }
    }
    lastCleanup = now;
  }

  // SECURITY: Prevent memory exhaustion (DoS) from IP spoofing attacks
  const MAX_MAP_SIZE = 10000;
  if (rateLimit.size > MAX_MAP_SIZE) {
    const iterator = rateLimit.keys();
    while (rateLimit.size > MAX_MAP_SIZE) {
      rateLimit.delete(iterator.next().value);
    }
  }

  return record.count <= limit;
}
