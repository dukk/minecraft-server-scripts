#!/usr/bin/bash

INSTANCE_NAME=$(basename "$(dirname "`pwd`")")
INSTANCE_PATH="/opt/minecraft/$INSTANCE_NAME"
SERVER_PATH="$INSTANCE_PATH/server"
BACKUP_PATH="$INSTANCE_PATH/backup"

NOW=`date "+%Y-%m-%d_%Hh%M_%S_%Z"`
BACKUP_FILE="${BACKUP_PATH}/BACKUP_${INSTANCE_NAME}_${NOW}.tgz"

echo -e "Backing up Minecraft instance: $INSTANCE_NAME"
echo -e "\tFROM:\t$SERVER_PATH"
echo -e "\tTO:\t$BACKUP_FILE"

# TODO: Stop and start the server...

tar -C "$INSTANCE_PATH" \
        --exclude="*.jar" \
        --exclude="server/libraries" \
        --exclude="server/plugins/LuckPerms/translations" \
        --exclude="server/logs" \
        -zcf "$BACKUP_FILE" server

## TODO...

#REMOTE_USER="minecraft"
#REMOTE_SERVER="10.0.0.10"
#REMOTE_BACKUP_PATH="/backups/minecraft/"

#rsync -avh "$BACKUP_FILE" ${REMOTE_USER}@${REMOTE_BACKUPSERVER}:$REMOTE_BACKUPPATH/