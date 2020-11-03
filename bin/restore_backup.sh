#!/usr/bin/env bash

DIRECTORIES=('Movies' 'Music' 'Pictures')
BACKUP_PATH=${1}

BIN_PATH="$(dirname ${BASH_SOURCE})"
DIR_PATH="$(dirname $BIN_PATH)"

source ${DIR_PATH}/lib/functions

# If called directly, copy to current directory
if [ $# -eq 0 ]; then
    BACKUP_PATH=${PWD}
fi

# Ensure properly formated path - spaces to '\ ' and no forward slash
BACKUP_PATH=$(echo ${BACKUP_PATH} | sed 's/[[:space:]]/\\ /g')
BACKUP_PATH=$(echo ${BACKUP_PATH} | sed -E 's/\/?$//')

# Start Logs
loggers

# Copy over all content
for DIR in ${DIRECTORIES[@]}; do
    BACKUP_DIR="${BACKUP_PATH}/${DIR}/"
    section "Syncing Backup Directory '${DIR}'"
    echo -e "rsync -avi --progress "${BACKUP_DIR}" ~/${DIR}/ \n\n"
    caffeinate rsync -avi --progress "${BACKUP_DIR}" ~/${DIR}/
done