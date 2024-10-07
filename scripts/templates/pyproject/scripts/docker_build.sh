#!/bin/sh

SRC="src"

docker build -t $SRC -f ci/$SRC.Dockerfile .
