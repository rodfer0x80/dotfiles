#!/bin/sh
USERNAME=dbgbox
useradd $USERNAME
passwd $USERNAME
usermod -aG wheel $USERNAME
usermod --shell /bin/bash $USERNAME
su $USERNAME
mkdir $USERNAME
echo "[*] User information:"
cat /etc/passwd | grep $USERNAME || echo "[x] Error setting user account"
echo "[*] Permissions informations:"
sudo -l -U $USERNAME | grep "ALL" || echo "[x] Error setting user permissions"
