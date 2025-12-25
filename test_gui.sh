#!/bin/bash

# Start the server in the background and redirect output to a log file
./bin/mcq-server > server_test.log 2>&1 &
SERVER_PID=$!

echo "Server started with PID $SERVER_PID. Waiting for initialization..."

# Wait for the server to start (loop checking the log or just sleep)
# Sleeping is simpler for this context
sleep 15

echo "--- Checking Health Endpoint ---"
curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/api/health
HEALTH_STATUS=$?

if [ $HEALTH_STATUS -eq 0 ]; then
    echo -e "\nHealth check command executed."
else
    echo -e "\nHealth check command failed to execute."
fi

# Capture the actual response body for verification
HEALTH_RESPONSE=$(curl -s http://localhost:8000/api/health)
echo "Health Response: $HEALTH_RESPONSE"

echo "--- Checking Root Endpoint (GUI) ---"
ROOT_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/)
echo "Root Status: $ROOT_STATUS"

if [ "$ROOT_STATUS" == "200" ]; then
    echo "GUI is accessible."
else
    echo "GUI is NOT accessible."
fi

# Clean up
kill $SERVER_PID
echo "Server stopped."

# Show logs if there were errors (optional, but good for debugging)
if [ "$ROOT_STATUS" != "200" ]; then
    echo "--- Server Logs ---"
    cat server_test.log
fi

rm server_test.log
