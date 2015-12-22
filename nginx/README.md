# Nginx Image

[![](https://badge.imagelayers.io/xataz/nginx:latest.svg)](https://imagelayers.io/?images=xataz/nginx:latest 'Get your own badge on imagelayers.io')
* latest, 1.9, 1.9.9 [Dockerfile](https://github.com/xataz/dockerfiles/blob/master/nginx/1.9.9/Dockerfile)
* 1.9.8 [Dockerfile](https://github.com/xataz/dockerfiles/blob/master/nginx/1.9.8/Dockerfile)
* 1.9.7 [Dockerfile](https://github.com/xataz/dockerfiles/blob/master/nginx/1.9.7/Dockerfile)
* 1.9.6 [Dockerfile](https://github.com/xataz/dockerfiles/blob/master/nginx/1.9.6/Dockerfile)
* 1.9.7 [Dockerfile](https://github.com/xataz/dockerfiles/blob/master/nginx/1.9.5/Dockerfile)

## Description
What is Nginx?

Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other *nix flavors.


## Usage
### Ports
* 80
* 443

### Environment
* UID : 991
* GID : 991

### Volume
* /www : Place your site's files here
* /sites-enabled : Place your vhost here
* /conf.d : If necessary, place configuration file here


## Run
```
docker run -d -p 80:80 -p 443:443 -v /docker/nginx/www:/www -v /docker/nginx/sites:/sites-enabled xataz/nginx:1.9.9
```


