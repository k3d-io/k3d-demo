#!/bin/bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";
[ -d "$CURR_DIR" ] || { echo "FATAL: no current dir (maybe running in zsh?)";  exit 1; }

# shellcheck source=./common.sh
source "$CURR_DIR/common.sh";

section "Create a Cluster"
# info "Cluster Name: demo"
# info "--api-port 6550: expose the Kubernetes API on localhost:6550 (via loadbalancer)"
# info "--servers 1: create 1 server node"
# info "--agents 3: create 3 agent nodes"
# info "--port 8080:80@loadbalancer: map localhost:8080 to port 80 on the loadbalancer (used for ingress)"
# info "--volume /tmp/src:/src@all: mount the local directory /tmp/src to /src in all nodes (used for code)"
# info "--wait: wait for all server nodes to be up before returning"
info_pause_exec "Create a cluster" "k3d cluster create demo --api-port 6550 --servers 1 --agents 3 --port 8080:80@loadbalancer --volume $(pwd)/sample:/src@all --wait"

section "Access the Cluster"

info_pause_exec "List clusters" "k3d cluster list"

info_pause_exec "Update the default kubeconfig with the new cluster details" "k3d kubeconfig merge demo --merge-default-kubeconfig --switch-context"
# info "Cluster Name: demo"
# info "--merge-default-kubeconfig true: overwrite existing fields with the same name in kubeconfig (true by default)"
# info "--switch-context true: set the kubeconfig's current-context to the new cluster context (false by default)"


info_pause_exec "Use kubectl to checkout the nodes" "kubectl get nodes"

section "Use the Cluster"

info_pause_exec "Build the sample-app" "docker build sample/ -f sample/Dockerfile -t sample-app:local"

info_pause_exec "Load the sample-app image into the cluster" "k3d image import -c demo sample-app:local"

info_pause_exec "Create a new 'demo' namespace" "kubectl create namespace demo"
info_pause_exec "Switch to the new 'demo' namespace" "kubens demo"
info_pause_exec "Deploy the sample app with helm" "helm upgrade --install sample-app sample/conf/charts/sample-app --namespace demo --set app.image=sample-app:local"

info_pause_exec "Access the sample app frontend via ingress" "chromium --new-window http://sample.k3d.localhost:8080 &>/dev/null &"

section "Grow the Cluster"

info_pause_exec "Add 2 agents to the cluster" "k3d node create new-agent --cluster demo --role agent --replicas 2"

info_pause_exec "Use kubectl to see the new nodes" "kubectl get nodes"

section "Start/Stop the Cluster"

info_pause_exec "Stop the cluster" "k3d cluster stop demo"

info_pause_exec "Try to access the stopped cluster" "kubectl get nodes"

info_pause_exec "Start the cluster" "k3d cluster start demo"

info_pause_exec "Access restarted cluster" "kubectl get nodes"

section "The End"

info_pause_exec "Delete the Cluster" "k3d cluster delete demo"
