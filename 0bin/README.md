# 0bin Image

## ImageLayer
[![](https://badge.imagelayers.io/xataz/0bin:latest.svg)](https://imagelayers.io/?images=xataz/0bin:latest 'Get your own badge on imagelayers.io')

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/0bin/Dockerfile)

## Description
What is [0bin](https://github.com/sametmax/0bin) ?

0bin is a client side encrypted pastebin that can run without a database.
0bin allows anybody to host a pastebin while welcoming any type of content to be pasted in it. The idea is that one can (probably...) not be legally entitled to moderate the pastebin content as they have no way to decrypt it.

It's an Python implementation of the zerobin project under the WTF licence. It's easy to install even if you know nothing about Python.

## Build Image

```shell
docker build -t xataz/0bin github.com/xataz/dockerfiles.git#master:0bin
```

## Configuration
### Environments
* CONTACT_MAIL : Choose mailto for contact button (default : admin@domain.tld)
* UID : Choose uid for launch 0bin (default : 991)
* GID : Choose gid for launch 0bin (default : 991)
* CUSTOM_MENU_LINK : Add a custom link in navbar (default : nothing)
* CUSTOM_MENU_NAME : Add a custom name link in navbar (default : nothing)

### Volumes
* /paste : Path where paste is saved

### Ports
* 8000

## Usage
### Speed launch
```shell
docker run -d -p 8000:8000 xataz/0bin 
```
URI access : http://XX.XX.XX.XX:8000

### Advanced launch
```shell
docker run -d -p 8080:8000 \
	-v /docker/data/0bin:/paste \
	-e CONTACT_MAIL=my@mydomain.lan \
	-e UID=1001 \
	-e GID=1001 \
	-e CUSTOM_MENU_NAME=forum \
	-e CUSTOM_MENU_LINK=https://forum.mydomain.lan \
	xataz/0bin
```
URI access : http://XX.XX.XX.XX:8080
