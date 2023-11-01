#!/bin/sh
sudo docker run \
    -d \
    -v ./opt:/root/run \
    -p 1337:1337 \
    rodfer0x80/python37.lab.ai:latest
