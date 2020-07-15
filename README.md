# k3d-demo

## Requirements

- `docker`
- `k3d >= v3.0.0-rc.7`

## Resources

- https://k3d.io/
- https://github.com/rancher/k3d
- v3 Release Candidate: https://github.com/rancher/k3d/releases/tag/v3.0.0-rc.7
  - install e.g. via `wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v3.0.0-rc.7 bash`
  
- k3d in Rancher Meetup May 2020: https://youtu.be/hMr3prm9gDM?t=2103 (with old version, using the old syntax!)

## Run

- Preparation (attention: clears all docker settings!): `make prep`
- Full k3d lifecycle and usage demo: `make demo`
- Multi-Server Setup demo: `make demo-multiserver`
