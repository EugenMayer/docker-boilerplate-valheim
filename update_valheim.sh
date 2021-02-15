#!/bin/bash

set -e

docker-compose exec valheim bash -c -l "/usr/local/bin/valheim-manual-updater"