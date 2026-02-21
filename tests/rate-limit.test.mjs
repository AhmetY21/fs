import { rateLimiter } from '../lib/rate-limit.mjs';
import assert from 'node:assert';
import { test } from 'node:test';

test('rateLimiter basic functionality', () => {
  const ip = '1.1.1.1';
  // Reset effectively by using a new IP

  // Test basic allowance
  // First request
  assert.strictEqual(rateLimiter(ip, 10, 60000), true);

  // Next 9 requests (total 10)
  for (let i = 0; i < 9; i++) {
    assert.strictEqual(rateLimiter(ip, 10, 60000), true);
  }

  // 11th request should fail
  assert.strictEqual(rateLimiter(ip, 10, 60000), false);
});

test('rateLimiter cleanup behavior', () => {
  // Fill the map to trigger cleanup logic
  // The current logic triggers cleanup if size > 1000

  const startTime = Date.now();
  // Add 1001 entries
  for (let i = 0; i < 1005; i++) {
    rateLimiter(`192.168.1.${i}`, 10, 60000);
  }

  // Now size is > 1000.
  // Next request should trigger cleanup loop.
  // We verify it works and doesn't crash.

  const allowed = rateLimiter('10.0.0.1', 10, 60000);
  assert.strictEqual(allowed, true);

  console.log('Cleanup verification passed (no crash).');
});
