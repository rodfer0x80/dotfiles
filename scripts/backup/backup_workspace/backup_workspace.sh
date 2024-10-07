#!/bin/bash

if [ "$#" -lt 1 ]; then
    printf "Usage: $0 <DEVICE>\n"
    exit 1
fi

DEVICE="$1"
DELETE_LOCAL_COPIES="n"
DATE="$(date +%d-%m-%Y)"
WORKSPACE_DIRS="$HOME/scripts/backup/backup_workspace/workspace.txt"
TARBALL="$HOME/workspace_$DATE.tar.gz"
CHECKSUM="$HOME/workspace_$DATE.sha1"
RUBBISH="$HOME/rubbish"

confirm() {
    read -p "[+] Delete local copies  [Y/n]-(default=n) " CONFIRM
    if [[ "$CONFIRM" == "Y" || "$CONFIRM" == "y" ]]; then
        DELETE_LOCAL_COPIES="y"
    fi
}

backup() {
    mkdir -p "$RUBBISH"

    if ! tar -czf "$TARBALL" -T "$WORKSPACE_DIRS"; then
        echo "[x] Error: Failed to create tarball"
        return 1
    fi

    if ! shasum -a 1 "$TARBALL" > "$CHECKSUM"; then
        echo "[x] Error: Failed to create checksum"
        return 2
    fi

    if ! sudo cp -r "$TARBALL" "$DEVICE"; then
        echo "[x] Error: Failed to copy tarball to device"
        return 3
    fi

    if ! sudo cp -r "$CHECKSUM" "$DEVICE"; then
        echo "[x] Error: Failed to copy checksum to device"
        return 4
    fi

    if [[ "$DELETE_LOCAL_COPIES" == "y" ]]; then
        rm "$TARBALL" "$CHECKSUM"
    else
        mv "$TARBALL" "$RUBBISH" 
        mv "$CHECKSUM" "$RUBBISH"
    fi

    printf "[*] Done backing up to $DEVICE\n"
}

confirm
if ! backup; then
    echo "[x] Backup failed"
    exit 1
fi
sudo sync
exit 0
