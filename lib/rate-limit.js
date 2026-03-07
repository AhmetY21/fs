// Simple in-memory rate limiter for Next.js API routes

const rateLimit = new Map();
const MAX_MAP_SIZE = 10000;

/**
 * Rate limit requests based on IP address using LRU logic.
 *
 * @param {string} ip - The IP address to rate limit.
 * @param {number} limit - Maximum number of requests allowed in the window. Default 10.
 * @param {number} windowMs - Time window in milliseconds. Default 60000 (1 minute).
 * @returns {boolean} - True if request is allowed, false if limit exceeded.
 */
export function rateLimiter(ip, limit = 10, windowMs = 60000) {
  const now = Date.now();
  let record = rateLimit.get(ip);

  // If the record exists, remove it first so that setting it later moves it to the end (most recently used)
  if (record) {
    rateLimit.delete(ip);
  } else {
    record = { count: 0, startTime: now };
  }

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

  // O(1) eviction of the oldest (least recently used) entry if size exceeds limit
  if (rateLimit.size > MAX_MAP_SIZE) {
    const oldestKey = rateLimit.keys().next().value;
    rateLimit.delete(oldestKey);
  }

  return record.count <= limit;
}
