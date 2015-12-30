# Letsencrypt lite

## ImageLayer
* latest [![](https://badge.imagelayers.io/xataz/letsencrypt:latest.svg)](https://imagelayers.io/?images=xataz/letsencrypt:latest 'Get your own badge on imagelayers.io')

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/letsencrypt/Dockerfile)

## Description
The Let's Encrypt Client is BETA SOFTWARE. It contains plenty of bugs and rough edges, and should be tested thoroughly in staging environments before use on production systems.

For more information regarding the status of the project, please see [Website](https://letsencrypt.org) or [Github](https://github.com/letsencrypt/letsencrypt).

## Usage
### Create a project folder
```shell
$ mkdir /etc/letsencrypt
```

### Generate a certificate with letsencrypt's webserver
```shell
$ docker run -it --rm -v /etc/letsencrypt:/etc/letsencrypt -p 80:80 -p 443:443 xataz/letsencrypt \
certonly --standalone --agree-tos -m me@myorg.org -d www.myorg.org -d blog.myorg.org
```

### Generate a certificate with webroot
```shell
$ docker run -it --rm -v /etc/letsencrypt:/etc/letsencrypt -v /var/www/:/var/www xataz/letsencrypt \
certonly --webroot --agree-tos -m me@myorg.org -w /var/www -d www.myorg.org -d blog.myorg.org \
-w /var/www/webmail -d webmail.myorg.org -d mail.myorg.org
```
