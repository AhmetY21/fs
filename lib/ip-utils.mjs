/**
 * Gets the client IP address from the request.
 * Prioritizes request.ip (if available via platform/Next.js),
 * then x-forwarded-for header.
 */
export function getClientIp(request) {
  // Priority 1: Trust the platform (Next.js / Vercel)
  if (request.ip) {
    return request.ip;
  }

  // Priority 2: X-Forwarded-For header
  const forwardedFor = request.headers.get('x-forwarded-for');
  if (forwardedFor) {
    return forwardedFor.split(',')[0].trim();
  }

  // Fallback
  return '127.0.0.1';
}
