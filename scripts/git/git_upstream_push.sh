#!/bin/sh

git add . && git commit -m "$1" &&\
    BRANCH_NAME=$(git branch | grep '*' | cut -d ' ' -f2) &&\
    git push --set-upstream origin $BRANCH_NAME -f
