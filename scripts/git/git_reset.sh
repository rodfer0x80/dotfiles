#!/bin/sh
git reset --soft "HEAD~$1" && git commit --amend $2
