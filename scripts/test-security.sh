#!/bin/bash

echo "Running test-security.sh..."

# Check if Next.js is already running on port 3000
if curl -s http://localhost:3000 > /dev/null; then
    echo "Something is already running on port 3000. Assuming it is the server."
    ALREADY_RUNNING=true
else
    echo "Starting Next.js server..."
    # Start in background
    npm run dev > server.log 2>&1 &
    SERVER_PID=$!
    ALREADY_RUNNING=false

    # Wait for server to start listening
    echo "Waiting for server to start..."
    TIMEOUT=60
    START_TIME=$(date +%s)

    while true; do
        CURRENT_TIME=$(date +%s)
        ELAPSED=$((CURRENT_TIME - START_TIME))

        if [ $ELAPSED -gt $TIMEOUT ]; then
            echo "Timeout waiting for server to start."
            cat server.log
            # Only kill if we started it
            kill $SERVER_PID
            exit 1
        fi

        # Try to connect
        if curl -s http://localhost:3000 > /dev/null; then
            echo "Server is responding!"
            # Give it a tiny bit more time to fully initialize routes
            sleep 2
            break
        fi

        # Check if process died
        if ! kill -0 $SERVER_PID 2>/dev/null; then
             echo "Server process died unexpectedly."
             cat server.log
             exit 1
        fi

        sleep 1
    done
fi

# Test 1: Invalid imageBase64 type (object instead of string)
echo "Test 1: Sending invalid imageBase64 (object)..."
STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze \
    -H "Content-Type: application/json" \
    -d '{"imageBase64": {"malicious": "payload"}, "mimeType": "image/jpeg"}')

echo "Response Status: $STATUS"

if [ "$STATUS" == "400" ]; then
    echo "✅ PASS: Server rejected invalid imageBase64 type."
else
    echo "❌ FAIL: Server accepted or crashed (expected 400, got $STATUS)."
fi

# Test 2: Missing imageBase64
echo "Test 2: Sending missing imageBase64..."
STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze \
    -H "Content-Type: application/json" \
    -d '{"mimeType": "image/jpeg"}')

echo "Response Status: $STATUS"

if [ "$STATUS" == "400" ]; then
    echo "✅ PASS: Server rejected missing imageBase64."
else
    echo "❌ FAIL: Server failed to handle missing imageBase64 (expected 400, got $STATUS)."
fi

# Cleanup
if [ "$ALREADY_RUNNING" = false ]; then
    echo "Stopping server (PID $SERVER_PID)..."
    kill $SERVER_PID
    # Optional: remove log if successful
    rm server.log
fi

echo "Security Test complete."
