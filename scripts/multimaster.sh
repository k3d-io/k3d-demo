#!/bin/bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
[ -d "$CURR_DIR" ] || { echo "FATAL: no current dir (maybe running in zsh?)";  exit 1; }

# shellcheck source=./common.sh
source "$CURR_DIR/common.sh"

highlight "***** Creating a Cluster *****"
pause
info "Cluster Name: demo"
info "--api-port 6550: expose the Kubernetes API on localhost:6550 (via loadbalancer)"
info "--masters 3: create 3 master nodes (where the first one runs cluster-init)"
info "--workers 3: create 3 worker nodes"
info "--port 8080:80@loadbalancer: map localhost:8080 to port 80 on the loadbalancer (used for ingress)"
info "--wait: wait for all master nodes to be up before returning"
exe k3d create cluster demo --api-port 6550 --masters 3 --workers 3 --port 8080:80@loadbalancer --wait
sleep 5


highlight "***** Accessing the Cluster *****"
pause
info "Cluster Name: demo"
info "--update true: overwrite existing fields with the same name in kubeconfig (true by default)"
info "--switch true: set the kubeconfig's current-context to the new cluster context (false by default)"
exe k3d get kubeconfig demo --update --switch

info "Using kubectl (with the default kubeconfig)..."
pause
exe kubectl get nodes -o wide


highlight "Deleting the Cluster"
pause
exe k3d delete cluster demo
