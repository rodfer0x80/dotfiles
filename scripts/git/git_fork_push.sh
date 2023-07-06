#!/bin/sh

# gitfork <branch

git add . &&\
    git commit -m "$2" &&\
    git push --set-upstream origin "$1"

