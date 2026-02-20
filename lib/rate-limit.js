// Simple in-memory rate limiter for Next.js API routes

const rateLimit = new Map();
let lastCleanup = 0;
const MAX_SIZE = 5000;
const CLEANUP_INTERVAL = 60000; // 1 minute

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

  // Cleanup old entries periodically (every 1 minute) to free memory
  if (now - lastCleanup > CLEANUP_INTERVAL) {
    lastCleanup = now;
    // Iterate and remove expired entries
    for (const [key, val] of rateLimit.entries()) {
      if (now - val.startTime > windowMs) {
        rateLimit.delete(key);
      }
    }
  }

  let record = rateLimit.get(ip);

  if (record) {
    // Remove from map so we can re-add at the end (LRU behavior: mark as recently used)
    rateLimit.delete(ip);

    // Check if window has expired
    if (now - record.startTime > windowMs) {
      // Reset window
      record.count = 1;
      record.startTime = now;
    } else {
      // Increment count
      record.count++;
    }
  } else {
    // New entry
    // Strict LRU Eviction: Prevent memory leak by capping size
    if (rateLimit.size >= MAX_SIZE) {
      // Remove the oldest entry (first inserted/accessed)
      const oldestKey = rateLimit.keys().next().value;
      rateLimit.delete(oldestKey);
    }

    record = { count: 1, startTime: now };
  }

  // Add to end (Most Recently Used)
  rateLimit.set(ip, record);

  return record.count <= limit;
}
