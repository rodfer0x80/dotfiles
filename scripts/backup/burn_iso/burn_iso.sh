#!/bin/bash

if [ "$#" -lt 2 ];then
    printf "Usage: $0 <ISO> <DEVICE>\n"
    exit 1
fi
ISO="$1"
DEVICE="$2"

if [ "$#" -eq 3 ]; then
    OFFSET="$3"
else
    OFFSET="0"
fi

confirm() {
    read -p "[+] Are you sure? No crying later... [Y/n] " CONFIRM;
    if [[ "$CONFIRM" != "Y" && "$CONFIRM" != "y" ]]; then
        exit 1
    fi
}

burn_iso() {
    sudo mkfs.vfat "$DEVICE"
    sudo fdisk -w "$DEVICE"
    sudo dd bs=1M status=progress if="$ISO" of="$DEVICE" status=progress conv="fsync"
    printf "[*] Done burning $ISO to $DEVICE\n"
}

confirm
burn_iso
sync
exit 0
