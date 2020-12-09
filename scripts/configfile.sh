#!/bin/bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";
[ -d "$CURR_DIR" ] || { echo "FATAL: no current dir (maybe running in zsh?)";  exit 1; }

configfile=./assets/k3d-config.yaml

# shellcheck source=./common.sh
source "$CURR_DIR/common.sh";

section "Create a Cluster purely from a config file"
printf "${CYA}********************${END}\n$(cat $configfile)\n${CYA}********************${END}\n"
info_pause_exec "Create a cluster" "k3d cluster create --config $configfile"

section "Access the Cluster"

info_pause_exec "List clusters" "k3d cluster list"

info_pause_exec "Use kubectl to checkout the nodes" "kubectl get nodes"

section "Cleanup Clusters"

info_pause_exec "Delete all Clusters" "k3d cluster rm -a"

section "Create new Cluster with same config file but different name"

info_pause_exec "Create a cluster" "k3d cluster create new-name --config $configfile"

section "The End"

info_pause_exec "Delete all Clusters" "k3d cluster rm -a"
