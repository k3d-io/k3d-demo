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
docker pull rancher/k3s:v1.17.5-k3s1
docker pull iwilltry42/k3d-proxy:v0.0.2
docker pull iwilltry42/k3d-tools:v0.0.2
docker pul python:3.7-slim

section "Preparing Filesystem..."
mkdir /tmp/src