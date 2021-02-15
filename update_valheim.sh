#!/bin/bash

set -e

docker-compose exec valheim bash -c -l "START_IF_NO_UPDATE=false SKIP_AUTOUPDATES=0 /usr/local/bin/valheim-updater"