#!/bin/sh

SRC="src"

# Remove existing containers if they exist
docker rm -f $SRC || true

docker run --gpus=all --network host --name $SRC $SRC

