#!/bin/bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
[ -d "$CURR_DIR" ] || { echo "FATAL: no current dir (maybe running in zsh?)";  exit 1; }

# shellcheck source=./common.sh
source "$CURR_DIR/common.sh"

section "Cleaning up docker environment..."
docker rm -f $(docker ps -qa)
docker network prune -f
docker volume prune -f
docker system prune -a -f

section "Pulling images..."
docker pull rancher/k3s:v1.18.4-k3s1
docker pull rancher/k3d-proxy:v3.0.0-rc.7
docker pull rancher/k3d-tools:v3.0.0-rc.7
docker pull python:3.7-slim

section "Preparing Filesystem..."
mkdir /tmp/src