# manage-this-node

> This image is build and push with [drone.io](https://github.com/drone/drone), a circle-ci like self-hosted.
> Automated build is disable in this repo.
> If you don't trust, you can build yourself.

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/manage-this-node/Dockerfile)

## Description
What is [manage-this-node](https://github.com/onedr0p/manage-this-node) ?

This is a lightweight portal to view & manage your HTPC apps in nodejs.

**This image not contains root process**

## Build Image

```shell
docker build -t xataz/manage-this-node github.com/xataz/dockerfiles.git#master:manage-this-node
```

## Configuration
### Environments
* UID : Choose uid for launch manage-this-node (default : 991)
* GID : Choose gid for launch manage-this-node (default : 991)

### Volumes
* /config : config.json emplacement

### Ports
* 3000

## Usage
### Launch
```shell
docker run -d \
        -v /docker/manage-this-node/config:/config \
        -p 3000:3000 \
        xataz/manage-this-node
```

## Contributing
Any contributions, are very welcome !