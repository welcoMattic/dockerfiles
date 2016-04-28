![](http://nginx.org/nginx.png)

## Tag available
* latest, mainline, 1.9, 1.9.15 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/nginx/1.9.14/Dockerfile)
* stable, 1.10, 1.10.0  [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/nginx/1.8.1/Dockerfile)

## Description
What is [Nginx](http://nginx.org)?

nginx (engine x) is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP proxy server, originally written by Igor Sysoev. For a long time, it has been running on many heavily loaded Russian sites including Yandex, Mail.Ru, VK, and Rambler. According to Netcraft, nginx served or proxied 24.29% busiest sites in December 2015. Here are some of the success stories: Netflix, Wordpress.com, FastMail.FM.

## Build Image

```shell
docker build -t xataz/nginx github.com/xataz/dockerfiles.git#master:nginx/mainline
```
### Build other version
```shell
docker build -t xataz/nginx --build-arg NGINX_VER=1.9.5 github.com/xataz/dockerfiles.git#master:nginx/mainline
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
	-p 80:8080 \
	-p 443:8443 \
	-v /docker/config/nginx/www:/www \
	-v /docker/config/nginx/sites-enabled:/sites-enabled \
	xataz/nginx:1.9.15
```

