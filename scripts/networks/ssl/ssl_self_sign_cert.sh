#!/bin/sh
KEY="$1"
CERT="$2"
if [ -z "$1" ]; then
    KEY="key.pem"
fi
if [ -z "$2" ]; then
    CERT="cert.pem"
fi
openssl req -x509 -newkey rsa:4096 -keyout /tmp/key.pem -out /tmp/cert.pem -days 365 -nodes
