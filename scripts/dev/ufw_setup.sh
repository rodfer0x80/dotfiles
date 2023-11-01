#!/bin/bash

ufw default allow outgoing
ufw default allow incoming
ufw allow ssh
ufw allow http/tcp
echo "Y" | ufw enable
