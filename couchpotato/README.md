# Couchpotato Image

## ImageLayer
[![](https://badge.imagelayers.io/xataz/couchpotato:latest.svg)](https://imagelayers.io/?images=xataz/couchpotato:latest 'Get your own badge on imagelayers.io')

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/couchpotato/Dockerfile)

## Description
What is [CouchPotato](https://github.com/RuudBurger/CouchPotatoServer) ?

CouchPotato (CP) is an automatic NZB and torrent downloader. You can keep a "movies I want"-list and it will search for NZBs/torrents of these movies every X hours. Once a movie is found, it will send it to SABnzbd or download the torrent to a specified directory.

## Configuration
### Environments
* WEBROOT : Choose webroot of couchpotato (default : nothing)
* UID : Choose uid for launch couchpotato (default : 991)
* GID : Choose gid for launch couchpotato (default : 991)

### Volumes
* /config : Path where is configuration of couchpotato

### Ports
* 5050

## Usage
### Speed launch
```
docker run -d -p 5050:5050 xataz/couchpotato
```
URI access : http://XX.XX.XX.XX:5050

### Advanced launch
```
docker run -d -p 8080:5050 \
	-e WEBROOT=/cp \
	-e UID=1001 \
	-e GID=1001 \
	-v /docker/config/CP:/config \
	xataz/couchpotato
```
URI access : http://XX.XX.XX.XX:8080/cp
