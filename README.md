# k3d-demo

## Requirements

- `docker`
- `k3d >= v4.0.0-alpha.1`

## Resources

- <https://k3d.io/>
- <https://github.com/rancher/k3d>
- v3 Release Candidate: <https://github.com/rancher/k3d/releases/tag/v4.0.0-alpha.1>
  - install e.g. via `wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v4.0.0-alpha.1 bash`
  
## Run

- Preparation (attention: clears all docker settings!): `make prep`
- Full k3d lifecycle and usage demo: `make demo`
- Multi-Server Setup demo: `make demo-multiserver`
- Config File Demo: `make demo-configfile`
