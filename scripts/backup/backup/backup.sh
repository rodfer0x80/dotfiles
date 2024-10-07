#!/bin/bash

#!/bin/bash

DEVICE="$1"
DELETE_LOCAL_COPIES="n"
DATE="$(date +%d-%m-%Y)"
RUBBISH="$HOME/rubbish"
TARBALL="$HOME/backup_$DATE.tar.gz"
CHECKSUM="$HOME/backup_$DATE.sha1"
BACKUP_DIRS="$HOME/scripts/backup/backup/backup.txt"

confirm() {
    read -p "[+] Delete local copies [Y/n]-(default=n) " CONFIRM
    if [[ "$CONFIRM" == "Y" || "$CONFIRM" == "y" ]]; then
        DELETE_LOCAL_COPIES="y"
    fi
}

backup() {
    mkdir -p "$RUBBISH"
    if ! tar -czf "$TARBALL" -T "$BACKUP_DIRS"; then
        echo "[x] Error: Failed to create tarball"
        return 1
    fi
    
    if ! shasum -a 1 "$TARBALL" > "$CHECKSUM"; then
        echo "[x] Error: Failed to create checksum"
        return 2
    fi
    
    if ! sudo cp "$TARBALL" "$DEVICE"; then
        echo "[x] Error: Failed to copy tarball to device"
        return 3
    fi
    
    if ! sudo cp "$CHECKSUM" "$DEVICE"; then
        echo "[x] Error: Failed to copy checksum to device"
        return 4
    fi
    
    if [[ "$DELETE_LOCAL_COPIES" == "y" ]]; then
        rm "$TARBALL" "$CHECKSUM"
    else
        mv "$TARBALL" "$RUBBISH" 
        mv "$CHECKSUM" "$RUBBISH"
    fi
    
    printf "[*] Done backing up to %s\n" "$DEVICE"
}

if [ "$#" -lt 1 ]; then
    printf "Usage: %s <DEVICE>\n" "$0"
    exit 1
fi

confirm
if ! backup; then
    echo "[x] Backup failed"
    exit 1
fi

sudo sync
exit 0
