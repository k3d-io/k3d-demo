# k3d-demo

## Requirements

- `docker`
- `k3d >= v3.0.0-beta.1`

## Resources

- https://k3d.io/
- https://github.com/rancher/k3d
- v3 Beta Release: https://github.com/rancher/k3d/releases/tag/v3.0.0-beta.1
  - install e.g. via `wget -q -O - https://raw.githubusercontent.com/rancher/k3d/master/install.sh | TAG=v3.0.0-beta.1 bash`
  
- k3d in Rancher Meetup May 2020: https://youtu.be/hMr3prm9gDM?t=2103

## Run

- Preparation (attention: clears all docker settings!): `make prep`
- Full k3d lifecycle and usage demo: `make demo`
- Multi-Master Setup demo: `make demo-multimaster`
