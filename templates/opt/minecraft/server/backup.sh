#!/usr/bin/bash

REMOTE_USER="minecraft"         # Change this to your remote backup user
REMOTE_SERVER="10.0.0.10"       # Change this to your remote backup server
REMOTE_BACKUP_PATH="/Backups/minecraft"        # Change this to your remote backup path

BACKUP_STARTING_MESSAGE="STARTING SERVER BACKUP..."
BACKUP_COMPLETE_MESSAGE="SERVER BACKUP IS COMPLETE..."

# You shouldn't need to change anything below this line
################################################################################

INSTANCE_NAME=$(basename "$(dirname "`pwd`")")
INSTANCE_PATH="/opt/minecraft/$INSTANCE_NAME"
SERVER_PATH="$INSTANCE_PATH/server"
BACKUP_PATH="$INSTANCE_PATH/backup"

NOW=`date "+%Y-%m-%d_%Hh%M_%S_%Z"`
BACKUP_FILE="${BACKUP_PATH}/BACKUP_${INSTANCE_NAME}_${NOW}.tgz"

echo -e "Backing up Minecraft instance: $INSTANCE_NAME"
echo -e "\tFROM:\t$SERVER_PATH"
echo -e "\tTO:\t$BACKUP_FILE"

sudo -i -u minecraft screen -p 0 -S minecraft-%i -X eval 'stuff "say ${BACKUP_STARTING_MESSAGE}"\\015'

systemctl stop minecraft@${INSTANCE_NAME}       ## This will save the map for us before stopping

# --exclude="*.jar" \

tar -C "$INSTANCE_PATH" \
        --exclude="server/libraries" \
        --exclude="server/plugins/LuckPerms/translations" \
        --exclude="server/logs/*.gz" \
        --exclude="server/bluemap/web" \
        --exclude="server/plugins/dynmap/web" \
        -zcf "$BACKUP_FILE" server

systemctl start minecraft@${INSTANCE_NAME}

#rsync -avh "$BACKUP_FILE" ${REMOTE_USER}@${REMOTE_BACKUPSERVER}:$REMOTE_BACKUPPATH

#scp $BACKUP_FILE ${REMOTE_USER}@${REMOTE_BACKUPSERVER}:$REMOTE_BACKUPPATH

# This assumes you've already setup authorized_keys with SSH
sftp ${REMOTE_USER}@${REMOTE_BACKUPSERVER} << THE_END
cd $REMOTE_BACKUPPATH
put $BACKUP_FILE
THE_END

sudo -i -u minecraft screen -p 0 -S minecraft-%i -X eval 'stuff "say ${BACKUP_COMPLETE_MESSAGE}"\\015'
