#!/bin/bash
VBOXNET=$(./get-server-ipv4.sh)
REPO=$1
git clone ssh://git@$VBOXNET:2222/git-server/repos/$REPO.git
