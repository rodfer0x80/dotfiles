#!/bin/sh
if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: ./git_init.sh <proggie_name> <remote_url>"
    exit
fi
echo "# $1" >> README.md
git init
git add README.md
git commit -m "Pushed by git_init.sh"
git branch -M master
git remote add origin $2
git push -u origin master
