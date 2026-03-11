import { test, describe, it } from 'node:test';
import assert from 'node:assert';
import { getClientIp } from '../lib/ip-utils.mjs';

describe('getClientIp', () => {
  it('should return request.ip if present (Prioritize platform)', () => {
    const req = {
      ip: '10.0.0.1',
      headers: { get: () => '5.6.7.8' }
    };
    assert.strictEqual(getClientIp(req), '10.0.0.1');
  });

  it('should return x-forwarded-for if request.ip is missing (Legacy/Fallback)', () => {
    const req = {
      headers: { get: (name) => name === 'x-forwarded-for' ? '5.6.7.8, 1.2.3.4' : null }
    };
    assert.strictEqual(getClientIp(req), '5.6.7.8');
  });

  it('should trim x-forwarded-for IP', () => {
    const req = {
      headers: { get: (name) => name === 'x-forwarded-for' ? '  5.6.7.8  , 1.2.3.4' : null }
    };
    assert.strictEqual(getClientIp(req), '5.6.7.8');
  });

  it('should return fallback if both missing', () => {
    const req = {
      headers: { get: () => null }
    };
    assert.strictEqual(getClientIp(req), '127.0.0.1');
  });
});
