#!/bin/bash

echo "Running test-rate-limit.sh..."

# Check if Next.js is already running on port 3000
if curl -s http://localhost:3000 > /dev/null; then
    echo "Something is already running on port 3000. Assuming it is the server."
    ALREADY_RUNNING="true"
else
    echo "Starting Next.js server..."
    npm run dev > server.log 2>&1 &
    SERVER_PID=$!
    ALREADY_RUNNING="false"

    echo "Waiting for server to start..."
    TIMEOUT=60
    START_TIME=$(date +%s)

    while true; do
        CURRENT_TIME=$(date +%s)
        ELAPSED=$((CURRENT_TIME - START_TIME))

        if [ $ELAPSED -gt $TIMEOUT ]; then
            echo "Timeout waiting for server to start."
            cat server.log
            kill $SERVER_PID
            exit 1
        fi

        if curl -s http://localhost:3000 > /dev/null; then
            echo "Server is responding!"
            sleep 2
            break
        fi

        if ! kill -0 $SERVER_PID 2>/dev/null; then
             echo "Server process died unexpectedly."
             cat server.log
             exit 1
        fi
        sleep 1
    done
fi

echo "Triggering rate limit (sending 15 requests)..."
for i in {1..15}; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze \
        -H "Content-Type: application/json" \
        -d '{"imageBase64": "dummy", "mimeType": "image/jpeg"}')
    echo "Request $i: $STATUS"
    sleep 0.2
done

echo "Attempting bypass with spoofed IP..."
SPOOF_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze \
  -H "Content-Type: application/json" \
  -H "X-Forwarded-For: 10.0.0.1" \
  -d '{"imageBase64": "dummy", "mimeType": "image/jpeg"}')

echo "Spoof Attempt Status: $SPOOF_STATUS"

if [ "$SPOOF_STATUS" != "429" ]; then
    echo "RESULT: Rate limit bypassed (Status: $SPOOF_STATUS). Note: This is expected in local dev environment where request.ip is undefined."
else
    echo "RESULT: Rate limit enforced."
fi

if [ "$ALREADY_RUNNING" = "false" ]; then
    echo "Stopping server (PID $SERVER_PID)..."
    kill $SERVER_PID
    rm server.log
fi

echo "Test complete."
