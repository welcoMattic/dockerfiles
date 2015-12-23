# Lufi image

## ImageLayer
* [![](https://badge.imagelayers.io/xataz/lufi:latest.svg)](https://imagelayers.io/?images=xataz/lufi:latest

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/lufi)


## Description

### What does Lufi mean?

Lufi means Let's Upload that FIle.

### What does it do?

It stores files and allows you to download them.

Is that all? No. All the files are encrypted **by the browser**! It means that your files **never** leave your computer unencrypted.
The administrator of the Lufi instance you use will not be able to see what is in your file, neither will your network administrator, or your ISP.

### License

Lufi is licensed under the terms of the AGPL.

### Project

[here](https://git.framasoft.org/luc/lufi)


## Usage

### Port
* 8080

### Volume
* /files

### Environment
* UID (default : 991)
* GID (default : 991)
* WEBROOT (default : /)
* SECRET (default : Random 16 char)
* CONTACT (default : contact@domain.tld)

### Run
```
docker run -d -p 8080:8080 xataz/lufi
```

With custom environment and bind volume :
```
docker run -d -p 8080:8080 -v /docker/lufi/files:/files -e SECRET=afnd67kf04jfrg54 -e WEBROOT=/lufi -e CONTACT=me@domain.me xataz/lufi
```
