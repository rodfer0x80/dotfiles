#!/bin/sh
if [ "$1" == "" ]; then
  exit 1
fi
USERNAME="$1"
useradd $USERNAME
passwd $USERNAME
usermod -aG wheel $USERNAME
usermod --shell /bin/zsh $USERNAME
mkdir /home/$USERNAME
chown -R $USERNAME:$USERNAME /home/$USERNAME
chmod -R  770 /home/$USERNAME 
echo "[*] User information:"
cat /etc/passwd | grep $USERNAME || echo "[x] Error setting user account"
echo "[*] Permissions informations:"
sudo -l -U $USERNAME | grep "ALL" || echo "[x] Error setting user permissions"
