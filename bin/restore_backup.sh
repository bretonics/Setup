#!/usr/bin/env bash

if [ -z $1 ]; then
    echo "Usage: restore_backup.sh <backup_path>"
    exit 1
fi

PARENT_PATH=$(cd -- "$(dirname $(dirname -- "${BASH_SOURCE[0]}"))" &>/dev/null && pwd)
source ${PARENT_PATH}/lib/functions

DIRECTORIES=('Movies' 'Music' 'Pictures')
BACKUP_PATH=${1}

BIN_PATH="$(dirname ${BASH_SOURCE})"
DIR_PATH="$(dirname $BIN_PATH)"

# Ensure properly formatted path - spaces to '\ ' and no forward slash
BACKUP_PATH=$(echo ${BACKUP_PATH} | sed 's/[[:space:]]/\\ /g')
BACKUP_PATH=$(echo ${BACKUP_PATH} | sed -E 's/\/?$//')

# Start Logs
loggers

# Copy over all content
section "Attempting to sync backups from latest Time Machine: ${BACKUP_DIR}"
for DIR in ${DIRECTORIES[@]}; do
    BACKUP_DIR="${BACKUP_PATH}/${DIR}/"
    subsection "Syncing Backup Directory '${DIR}'"
    echo -e "rsync -avi --progress "${BACKUP_DIR}" ~/${DIR}/ \n\n"
    caffeinate rsync -avi --progress "${BACKUP_DIR}" ~/${DIR}/
done

# Assert Time Machine Backups Use Same Backup Folder
COMPUTER_NAME=$(scutil --get ComputerName)
sudo tmutil inheritbackup /Volumes/Backups/Backups.backupdb/${COMPUTER_NAME}
sudo tmutil associatedisk -a /Volumes/Backups /Volumes/Backups/Backups.backupdb/${COMPUTER_NAME}/Latest/Macintosh\ HD
