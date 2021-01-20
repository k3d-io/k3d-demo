# k3d-demo

## Requirements

- [`docker`](https://docs.docker.com/get-docker/)
- [`k3d >= v4.0.0`](https://k3d.io/#installation)
- (optional) [`tilt`](https://docs.tilt.dev/install.html)

## Resources

- <https://k3d.io/>
- <https://github.com/rancher/k3d>
- v4 Release Candidate: <https://github.com/rancher/k3d/releases/tag/v4.0.0-rc.2>
  - install e.g. via `wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v4.0.0-rc.2 bash`
  
## Run

- Preparation (attention: clears all docker settings!): `make prep`
- Full k3d lifecycle and usage demo: `make demo`
- Multi-Server Setup demo: `make demo-multiserver`
- Config File Demo: `make demo-configfile`
