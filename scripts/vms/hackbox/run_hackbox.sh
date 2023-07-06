#!/bin/sh
sudo docker run \
    --rm \
    -it \
    -v $PWD/opt:/host \
    hackbox
