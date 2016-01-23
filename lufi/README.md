# Lufi image

## ImageLayer
* [![](https://badge.imagelayers.io/xataz/lufi:latest.svg)](https://imagelayers.io/?images=xataz/lufi:latest 'Get your own badge on imagelayers.io')

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/lufi)

## Description
What is [Lufi](https://git.framasoft.org/luc/lufi) ?

Lufi means Let's Upload that FIle.

It stores files and allows you to download them.

Is that all? No. All the files are encrypted **by the browser**! It means that your files **never** leave your computer unencrypted.
The administrator of the Lufi instance you use will not be able to see what is in your file, neither will your network administrator, or your ISP.

## Build Image

```shell
docker build -t xataz/lufi github.com/xataz/dockerfiles.git#master:lufi
```

## Configuration
### Environments
* UID : Choose uid for launch Lufi (default : 991)
* GID : Choose gid for launch Lufi (default : 991)
* WEBROOT (default : /)
* SECRET (default : Random 16 char)
* CONTACT (default : contact@domain.tld)

### Volumes
* /files : File upload is save here

### Ports
* 8080

## Usage
### Simple launch
```shell
docker run -d -p 8080:8080 xataz/lufi
```
URI access : http://XX.XX.XX.XX:8080

### Advanced launch
```shell
docker run -d -p 8080:8080 \
	-v /docker/lufi/files:/files \
	-e SECRET=afnd67kf04jfrg54 \
	-e WEBROOT=/lufi \
	-e CONTACT=me@domain.me \
	xataz/lufi
```
