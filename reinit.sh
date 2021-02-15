#!/bin/bash

set -e

docker-compose pull
docker-compose up down
docker-compose up -d
