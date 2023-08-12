#!/bin/sh

OBSIDIAN_DATA="/var/www/obsidian data"
OBSIDIAN_BACKUP="/tmp/obsidian_backup_$(date +'%Y%m%d_%H%M%S').tar.gz"
BACKUP_DIR="$HOME/documents/obsidian"
test -e $BACKUP_DIR || mkdir -p $BACKUP_DIR
ssh rodfer.cloud "tar czvf $OBSIDIAN_BACKUP -C $OBSIDIAN_DATA"
scp -i ~/.ssh/rodfer.cloud_id_rsa ubuntu@rodfer.cloud:"$OBSIDIAN_BACKUP" "$BACKUP_DIR"
