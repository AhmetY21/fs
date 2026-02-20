
import { rateLimiter } from '../lib/rate-limit.js';

// Mock Date.now
let now = 1000000;
const originalDateNow = Date.now;
Date.now = () => now;

// We need a way to check if rateLimiter evicted the entry.
// The strategy is:
// 1. Add entry 'test-0' with limit=1, window=large. Count becomes 1. Allowed=true.
// 2. Add 5000 other entries ('test-1' to 'test-5000').
// 3. If LRU works (max 5000), 'test-0' should be evicted when 'test-5000' is added.
// 4. Call 'test-0' again with limit=1.
//    - If evicted: Count becomes 1. Allowed=true.
//    - If NOT evicted: Count becomes 2. Allowed=false.

console.log('--- Starting LRU Eviction Test ---');

// Phase 1: Fill up
// Use a unique prefix to avoid interference
const PREFIX = 'lru-test-';
const LIMIT = 1;
const WINDOW = 600000; // 10 minutes

// Add first entry
rateLimiter(`${PREFIX}0`, LIMIT, WINDOW);

// Add 5000 more entries to force eviction of the first one (if limit works)
// Total entries added = 5001
for (let i = 1; i <= 5000; i++) {
    rateLimiter(`${PREFIX}${i}`, LIMIT, WINDOW);
}

// Check first entry
const isAllowed = rateLimiter(`${PREFIX}0`, LIMIT, WINDOW);

if (isAllowed) {
    console.log('✅ PASS: Oldest entry was evicted (treated as new). Memory usage is bounded.');
} else {
    console.error('❌ FAIL: Oldest entry was NOT evicted (limit exceeded). Memory usage is unbounded.');
    process.exit(1);
}

console.log('--- End Test ---');
