#!/bin/bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
[ -d "$CURR_DIR" ] || { echo "FATAL: no current dir (maybe running in zsh?)";  exit 1; }

# shellcheck source=./common.sh
source "$CURR_DIR/common.sh"

configfile=./assets/k3d-config-registry.yaml

section "Create a Cluster with a registry from config file"
printf "${CYA}********************${END}\n$(cat $configfile)\n${CYA}********************${END}\n"
info_pause_exec "Create the cluster & registry" "k3d cluster create --config $configfile"

section "Start Tilt"
info_pause_exec "Starting Tilt (legacy terminal mode)" "tilt up --legacy"