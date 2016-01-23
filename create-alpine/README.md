# Create Alpine Image

## ImageLayer
* latest [![](https://badge.imagelayers.io/xataz/create-alpine:latest.svg)](https://imagelayers.io/?images=xataz/create-alpine:latest 'Get your own badge on imagelayers.io')

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/create-alpine/Dockerfile)

## Description
A simple image for create rootfs alpine.
This image create a rootfs.tar.gz file, with a single command.

## Build Image

```shell
docker build -t xataz/create-alpine github.com/xataz/dockerfiles.git#master:create-alpine
```

## Usage
### Create a v3.3 image
```shell
docker run -it --rm -v $(pwd):/chroot xataz/create-alpine v3.3
```

### Create a edge image
```shell
docker run -it --rm -v $(pwd):/chroot xataz/create-alpine edge
```

### Create a dockerfile with rootfs.tar.gz file
```shell
FROM scratch

ADD rootfs.tar.gz /
RUN apk update && apk add nginx

CMD ["sh"]
```
