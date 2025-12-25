#!/bin/bash

# Resolve project root regardless of where this script is called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$DIR")"
cd "$PROJECT_ROOT"

echo "=============================================="
echo "      Starting MCQ-Gen AI Server"
echo "=============================================="

# Start the server in the background
./bin/mcq-server &
SERVER_PID=$!

# Wait a moment for Julia to warm up
echo "Initializing..."
sleep 4

# Open the default web browser
if command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:8000
elif command -v gnome-open &> /dev/null; then
    gnome-open http://localhost:8000
else
    echo "Could not detect browser opener. Please visit http://localhost:8000 manually."
fi

echo ""
echo "----------------------------------------------"
echo "  Server is running with PID: $SERVER_PID"
echo "  DO NOT CLOSE THIS WINDOW while using the app."
echo "  Press Ctrl+C to stop the server and exit."
echo "----------------------------------------------"

# Handle shutdown
cleanup() {
    echo ""
    echo "Stopping MCQ-Gen Server..."
    kill $SERVER_PID
    exit
}

trap cleanup SIGINT SIGTERM

# Wait for the server process
wait $SERVER_PID
