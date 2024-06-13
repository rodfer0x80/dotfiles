#!/bin/bash

# Check if a port number is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <port_number>"
    exit 1
fi

PORT=$1

# Find the PID of the process using the specified port
PID=$(lsof -t -i :$PORT)

# Check if the PID was found
if [ -z "$PID" ]; then
    echo "No process found on port $PORT"
    exit 1
fi

# Kill the process
kill -9 $PID

# Confirm the process was killed
if [ $? -eq 0 ]; then
    echo "Process on port $PORT (PID: $PID) was killed successfully."
else
    echo "Failed to kill process on port $PORT (PID: $PID)."
    exit 1
fi

