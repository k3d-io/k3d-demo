# k3d-demo

## Requirements

- [`docker`](https://docs.docker.com/get-docker/)
- [`k3d >= v4.1.0`](https://k3d.io/#installation)
- [`kubens`](https://github.com/ahmetb/kubectx) callable via the `kubens` binary
- [`chromium`](https://www.chromium.org/Home) callable via the `chromium` binary
- (optional) [`tilt`](https://docs.tilt.dev/install.html)
- (optional) [`drone`](https://docs.drone.io/cli/install/)

## Resources

- <https://k3d.io/>
- <https://github.com/rancher/k3d>
- v4 Release Candidate: <https://github.com/rancher/k3d/releases/tag/v4.1.0>
  - install e.g. via `wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v4.1.0 bash`
  
## Run

- Preparation (attention: clears all docker settings!): `make prep`
- Demo: Full k3d lifecycle and usage with a Python App using hot-reloading of code: `make demo`
- Demo: Multi-Server Setup: `make demo-multiserver`
- Demo: Creating a cluster from a config file: `make demo-configfile`
- Demo: Using k3d with a managed registry and Tilt for app-reloading: `make demo-tilt`
- Demo: Useing k3d as a service in a Drone CI pipeline: `make demo-drone`
