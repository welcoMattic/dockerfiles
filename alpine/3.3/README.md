# Alpine Image

[![](https://badge.imagelayers.io/xataz/alpine:3.3.svg)](https://imagelayers.io/?images=xataz/alpine:3.3 'Get your own badge on imagelayers.io')

* 3.3 [(dockerfiles/alpine/3.3/Dockerfile](https://github.com/xataz/dockerfiles/tree/master/alpine/3.3/Dockerfile)

## Description
What is Alpine Linux?

Alpine Linux is a Linux distribution built around musl libc and BusyBox. The image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images. This makes Alpine Linux a great image base for utilities and even production applications. Read more about Alpine Linux here and you can see how their mantra fits in right at home with Docker images.


## Usage
### Simple launch
```
docker run -ti xataz/alpine:3.3 sh
```
### For create an image
```
FROM xataz/alpine:3.3

RUN apk -U add nginx

CMD ["nginx", "-g", "daemon off;"]
```

