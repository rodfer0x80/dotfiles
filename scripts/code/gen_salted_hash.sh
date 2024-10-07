#!/bin/sh
ALGO="sha256:10000"
PASSWD="66c074645545781f1064fb7fd1177453db8f0ca2ce58a9d81c04be2e6d3ba2a0d6c032f0fd4ef83f48d74349ec196f4efe37"
SALT="sO3XIbeW14"
echo $ALGO':'$(echo $SALT | base64 | cut -c1-14)':'$(echo $PASSWD | xxd -r -p | base64)
