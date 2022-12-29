# docker-velero-kubectl

[![ci](https://github.com/quangthe/docker-velero-kubectl/actions/workflows/docker.yaml/badge.svg)](https://github.com/quangthe/docker-velero-kubectl/actions/workflows/docker.yaml)
[![Docker Stars](https://img.shields.io/docker/stars/pcloud/velero-kubectl.svg?style=flat)](https://hub.docker.com/r/pcloud/velero-kubectl/)
[![Docker Pulls](https://img.shields.io/docker/pulls/pcloud/velero-kubectl.svg?style=flat)](https://hub.docker.com/r/pcloud/velero-kubectl/)

Convenient Docker image to operate Velero disater recovery on K8S

## Supported tags

- [1.9.5](https://github.com/quangthe/docker-velero-kubectl/releases/tag/1.9.5) - velero 1.9.5, kubectl v1.25.3
- [1.9.4](https://github.com/quangthe/docker-velero-kubectl/releases/tag/1.9.4) - velero 1.9.4, kubectl v1.25.3
## Build

Build local image: `make docker-build`

## How to run

By default kubectl will try to use `/root/.kube/config` file for connection to the kubernetes cluster, but does not exist by default in the image.

Mount host `~/.kube/config` to container:

```bash
docker run --rm -it -v ~/.kube:/root/.kube pcloud/velero-kubectl
```
