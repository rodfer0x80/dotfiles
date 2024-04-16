#!/bin/bash
VBOXNET=$(./get-server-ipv4.sh)
echo "$VBOXNET"
ssh git@$VBOXNET -i ~/.ssh/id_rsa -p 2222
