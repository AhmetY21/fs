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
export function rateLimiter(ip, limit = 10, windowMs = 60000) {
  const now = Date.now();

  // LRU: If it exists, delete and re-insert to update position (most recently used)
  // This is a standard way to implement LRU with JS Map
  const existing = rateLimit.get(ip);
  if (existing) {
    rateLimit.delete(ip);
  }

  const record = existing || { count: 0, startTime: now };

  // Check if window has expired
  if (now - record.startTime > windowMs) {
    // Reset window
    record.count = 1;
    record.startTime = now;
  } else {
    // Increment count
    record.count++;
  }

  // Hard limit on map size to prevent memory DoS
  if (rateLimit.size >= 10000) {
    // Delete the oldest entry (first key in the map iterator)
    const oldestKey = rateLimit.keys().next().value;
    rateLimit.delete(oldestKey);
  }

  rateLimit.set(ip, record);

  return record.count <= limit;
}
