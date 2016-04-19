# Jackett Image

## Tag available
* latest, 0.7.228 [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/jackett/Dockerfile)

## Description
What is [jackett](https://github.com/Jackett/Jackett) ?

This project is a new fork and is recruiting development help. If you are able to help out please contact us.

Jackett works as a proxy server: it translates queries from apps (Sonarr, SickRage, CouchPotato, Mylar, etc) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.

Developer note: The software implements the Torznab (with nZEDb category numbering) and TorrentPotato APIs.

## Build Image

```shell
docker build -t xataz/jackett github.com/xataz/dockerfiles.git#master:jackett
```
### Build other version
```shell
docker build --build-arg JACKETT_VER=0.7.217 -t xataz/jackett github.com/xataz/dockerfiles.git#master:jackett
```

## Configuration
### Environments
* UID : Choose uid for launch Jackett (default : 991)
* GID : Choose gid for launch Jackett (default : 991)

### Volumes
* /home/jackett/.config/Jackett/ : Configuration files are here

### Ports
* 9117

## Usage
### Simple launch
```shell
docker run -d -p 9117:9117 xataz/jackett
```
URI access : http://XX.XX.XX.XX:9117

### Advanced launch
```shell
docker run -d -p 5000:9117 \
	-e UID=1001 \
	-e GID=1001 \
	-v /docker/config/jackett:/home/jackett/.config/Jackett \
	xataz/jackett
```
URI access : http://XX.XX.XX.XX:5000
