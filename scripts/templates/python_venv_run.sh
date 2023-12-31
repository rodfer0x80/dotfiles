#!/bin/sh

test -e "$PWD/venv" &&\
    python3 -m venv "$PWD/.venv" &&\
    "$PWD/.venv/bin/python" -m pip install --upgrade pip &&\
    "$PWD/.venv/bin/python" -m pip install -r "$PWD/requirements.txt"
