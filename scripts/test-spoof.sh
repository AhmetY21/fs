#!/bin/bash
echo "Testing API without spoofed IP..."
curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze -H "Content-Type: application/json" -d '{"imageBase64": "dummy", "mimeType": "image/jpeg"}'
echo ""
echo "Testing API with spoofed IP..."
curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze -H "Content-Type: application/json" -H "X-Forwarded-For: 10.0.0.1" -d '{"imageBase64": "dummy", "mimeType": "image/jpeg"}'
echo ""
