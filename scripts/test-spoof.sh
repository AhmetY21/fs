#!/bin/bash
if curl -s http://localhost:3000 > /dev/null; then
    echo "Server running."
else
    npm run dev > server.log 2>&1 &
    sleep 5
fi

for i in {1..15}; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze \
        -H "Content-Type: application/json" \
        -H "X-Forwarded-For: 10.0.0.$i" \
        -d '{"imageBase64": "dummy", "mimeType": "image/jpeg"}')
    echo "Request $i: $STATUS"
done
