![](http://nginx.org/nginx.png)

## ImageLayer
* 1.9.11 [![](https://badge.imagelayers.io/xataz/nginx:latest.svg)](https://imagelayers.io/?images=xataz/nginx:latest 'Get your own badge on imagelayers.io')
* 1.8.1 [![](https://badge.imagelayers.io/xataz/nginx:stable.svg)](https://imagelayers.io/?images=xataz/nginx:stable 'Get your own badge on imagelayers.io')

## Tag available
* latest, mainline, 1.9, 1.9.11 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/nginx/1.9.11/Dockerfile)
* stable, 1.8, 1.8.1  [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/nginx/1.8.1/Dockerfile)

## Description
What is [Nginx](http://nginx.org)?

nginx (engine x) is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP proxy server, originally written by Igor Sysoev. For a long time, it has been running on many heavily loaded Russian sites including Yandex, Mail.Ru, VK, and Rambler. According to Netcraft, nginx served or proxied 24.29% busiest sites in December 2015. Here are some of the success stories: Netflix, Wordpress.com, FastMail.FM.

## Build Image

```shell
docker build -t xataz/nginx github.com/xataz/dockerfiles.git#master:nginx/1.9.10
```

## Configuration
### Environments
* UID : Choose uid for launch nginx (default : 991)
* GID : Choose gid for launch nginx (default : 991)

### Volumes
* /sites-enabled : Place your vhost here

### Ports
* 8080
* 8443

## Usage
### Advanced launch
```shell
docker run -d \
	-p 80:80 \
	-p 443:443 \
	-v /docker/config/nginx/www:/www \
	-v /docker/config/nginx/sites-enabled:/sites-enabled \
	xataz/nginx:1.9.11
```

