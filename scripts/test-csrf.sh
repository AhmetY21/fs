#!/bin/bash
echo "Testing valid origin..."
curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze \
  -H "Content-Type: application/json" \
  -H "Origin: http://localhost:3000" \
  -H "Host: localhost:3000" \
  -d '{"imageBase64": "dummy", "mimeType": "image/jpeg"}'
echo ""

echo "Testing invalid origin..."
curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze \
  -H "Content-Type: application/json" \
  -H "Origin: http://evil.com" \
  -H "Host: localhost:3000" \
  -d '{"imageBase64": "dummy", "mimeType": "image/jpeg"}'
echo ""

echo "Testing missing origin (server-to-server)..."
curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze \
  -H "Content-Type: application/json" \
  -H "Host: localhost:3000" \
  -d '{"imageBase64": "dummy", "mimeType": "image/jpeg"}'
echo ""
