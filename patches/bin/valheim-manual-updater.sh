#!/bin/bash
set -e 

echo "Running Valheim Server updater as user $USER uid $UID"
CONFIG_DIRECTORY_PERMISSIONS=${CONFIG_DIRECTORY_PERMISSIONS:-755}
WORLDS_DIRECTORY_PERMISSIONS=${WORLDS_DIRECTORY_PERMISSIONS:-755}
WORLDS_FILE_PERMISSIONS=${WORLDS_FILE_PERMISSIONS:-644}

chmod $CONFIG_DIRECTORY_PERMISSIONS /config
if [ -d /config/worlds ]; then
    chmod $WORLDS_DIRECTORY_PERMISSIONS /config/worlds
    chmod $WORLDS_FILE_PERMISSIONS /config/worlds/*
fi

cd /opt/steamcmd
./steamcmd.sh +login anonymous +force_install_dir /opt/valheim_dl +app_update 896660 validate +quit
rsync -a --itemize-changes --delete --exclude server_exit.drp --exclude steamapps /opt/valheim_dl/ /opt/valheim
# TODO: there are always changes, even if nothing has been pulled. Try to have a better "changed" detection then
# rsync hash over all files
if [ $? -eq 0 ]; then
    echo "Valheim Server was updated - restarting"
    supervisorctl restart valheim-server
else
    echo "Valheim Server is already the latest version - doing nothing"
fi
