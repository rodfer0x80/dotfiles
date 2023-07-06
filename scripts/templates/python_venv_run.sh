#!/bin/sh

test -e "$PWD/venv" &&\
    source "$PWD/venv/bin/activate" ||\
    python3 -m venv "$PWD/venv" &&\
    source "$PWD/venv/bin/activate" &&\
    pip install --upgrade pip &&\
    pip install -r "$PWD/requirements.txt"
