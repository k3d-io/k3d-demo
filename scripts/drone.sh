#!/bin/bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
[ -d "$CURR_DIR" ] || { echo "FATAL: no current dir (maybe running in zsh?)";  exit 1; }

# shellcheck source=./common.sh
source "$CURR_DIR/common.sh"

configfile=./ci/k3d-drone.yaml

section "Running Drone pipeline (./.drone.yml, which uses a k3d config)"
log "INFO: This will create a kubeconfig file in your workspace, which will be owned by root (as the Drone CI containers run as root)!\n"
printf "${CYA}********************${END}\n# k3d config file used by Drone CI\n$(cat $configfile)\n${CYA}********************${END}\n"
info_pause_exec "Running drone locally (using docker)" "drone exec --pipeline=main --trusted"