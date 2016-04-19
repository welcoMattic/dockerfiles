# Alpine Image

## Tag available
* latest, 3.3 [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/alpine/3.3/Dockerfile)
* edge [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/alpine/edge/Dockerfile)

## Description
What is [Alpine Linux](http://alpinelinux.org/)?

Alpine Linux is an independent, non-commercial, general purpose Linux distribution designed for power users who appreciate security, simplicity and resource efficiency.

This image is based on official alpine, but with tini and gosu installed.

#### Small

Alpine Linux is built around musl libc and busybox. This makes it smaller and more resource efficient than traditional GNU/Linux distributions. A container requires no more than 8 MB and a minimal installation to disk requires around 130 MB of storage. Not only do you get a fully-fledged Linux environment but a large selection of packages from the repository.

Binary packages are thinned out and split, giving you even more control over what you install, which in turn keeps your environment as small and efficient as possible.
#### Simple

Alpine Linux is a very simple distribution that will try to stay out of your way. It uses its own package manager called apk, the OpenRC init system, script driven set-ups and that’s it! This provides you with a simple, crystal-clear Linux environment without all the noise. You can then add on top of that just the packages you need for your project, so whether it’s building a home PVR, or an iSCSI storage controller, a wafer-thin mail server container, or a rock-solid embedded switch, nothing else will get in the way.
#### Secure

Alpine Linux was designed with security in mind. The kernel is patched with grsecurity/PaX out of the box, and all userland binaries are compiled as Position Independent Executables (PIE) with stack smashing protection. These proactive security features prevent exploitation of entire classes of zero-day and other vulnerabilities.

## Build Image

```shell
docker build -t xataz/alpine:3.3 github.com/xataz/dockerfiles.git#master:alpine/3.3
```

## Usage
### Simple launch
```shell
docker run -ti xataz/alpine:3.3 sh
```
### For create an image
```shell
FROM xataz/alpine:3.3

RUN apk -U add nginx

CMD ["nginx", "-g", "daemon off;"]
```

