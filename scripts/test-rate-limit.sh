#!/bin/bash

echo "Running test-rate-limit.sh..."

# Check if Next.js is already running on port 3000
# We use curl because lsof might not be available or permissions restricted
if curl -s http://localhost:3000 > /dev/null; then
    echo "Something is already running on port 3000. Assuming it is the server."
    ALREADY_RUNNING=true
else
    echo "Starting Next.js server..."
    # Start in background
    pnpm run dev > server.log 2>&1 &
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

# Send 15 requests
echo "Sending 15 requests to http://localhost:3000/api/analyze..."
for i in {1..15}; do
    # Send request with minimal valid JSON structure to pass early checks if rate limit allows
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost:3000/api/analyze \
        -H "Content-Type: application/json" \
        -d '{"imageBase64": "dummy", "mimeType": "image/jpeg"}')

    echo "Request $i: $STATUS"

    # Check if we got 429
    if [ "$STATUS" == "429" ]; then
        echo "  -> Rate limit triggered!"
    fi

    # Small delay
    sleep 0.2
done

# Cleanup
if [ "$ALREADY_RUNNING" = false ]; then
    echo "Stopping server (PID $SERVER_PID)..."
    kill $SERVER_PID
    # Optional: remove log if successful
    rm server.log
fi

echo "Test complete."
