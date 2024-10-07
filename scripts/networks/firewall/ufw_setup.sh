#!/bin/bash

ufw default allow outgoing
ufw default deny incoming
ufw allow ssh
ufw limit ssh
ufw allow http/tcp
ufw allow https/tcp
ufw logging on
ufw status verbose
echo "Y" | ufw enable
