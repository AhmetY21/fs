// Simple in-memory rate limiter for Next.js API routes
// Refactored to prevent DoS via map explosion and optimize cleanup

const rateLimit = new Map();
let lastCleanup = Date.now();
const CLEANUP_INTERVAL = 60000; // 1 minute
const MAX_MAP_SIZE = 10000; // Safety threshold to prevent memory exhaustion DoS

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

  // 1. Optimized Cleanup: Only run periodically, not on every request
  if (now - lastCleanup > CLEANUP_INTERVAL) {
    // Remove expired entries
    for (const [key, val] of rateLimit.entries()) {
      if (now - val.startTime > windowMs) {
        rateLimit.delete(key);
      }
    }
    lastCleanup = now;

    // 2. DoS Protection: Hard cap on map size
    // If cleanup didn't help enough and we're under attack, clear everything.
    // This protects server memory and CPU from being exhausted by managing millions of keys.
    if (rateLimit.size > MAX_MAP_SIZE) {
      console.warn(`Rate limit map exceeded ${MAX_MAP_SIZE} entries. Clearing to prevent DoS.`);
      rateLimit.clear();
    }
  }

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

  return record.count <= limit;
}
