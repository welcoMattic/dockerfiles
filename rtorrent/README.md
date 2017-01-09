# RTorrent

> This image is build and push with [drone.io](https://github.com/drone/drone), a circle-ci like self-hosted.
> If you don't trust, you can build yourself.

## Tag available
* latest [(rutorrent/latest/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/rtorrent/latest/Dockerfile)
* latest-filebot, filebot [(rutorrent/latest-filebot/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/rtorrent/latest/Dockerfile)

## Description
What is [rtorrent](https://github.com/rakshasa/rtorrent/) ?

rtorrent is the popular Bittorrent client.

**This image not contains root process**

## BUILD IMAGE
### Build arguments
* BUILD_CORES : Number of cpu's core for compile (default : empty for use all cores)
* RTORRENT_VER : rtorrent version (default : 0.9.6)
* LIBTORRENT_VER : libtorrent version (default : 0.13.6)
* WITH_FILEBOT : Choose if install filebot (default : no)
* FILEBOT_VER : filebot version (default : 4.7.2)

### simple build
```shell
docker build -t xataz/rutorrent github.com/xataz/dockerfiles.git#master:rtorrent
```

### Build with arguments
```shell
docker build -t xataz/rtorrent:custom --build-arg WITH_FILEBOT=YES --build-arg RTORRENT_VER=0.9.4 github.com/xataz/dockerfiles.git#master:rtorrent
```

## Configuration
### Environments
* UID : Choose uid for launch rtorrent (default : 991)
* GID : Choose gid for launch rtorrent (default : 991)

### Volumes
* /data : Folder for download torrents

#### data Folder tree
* /data/.watch : Rtorrent watch this folder and add automatly torrent file
* /data/.session : Rtorrent save statement here
* /data/torrents : Rtorrent download torrent here
* /data/Media : If filebot version, rtorrent create a symlink

### Ports
* 8080


## Usage
### Simple launch
```shell
docker run -dt xataz/rtorrent
```

### Advanced launch
```shell
docker run -dt -p 80:8080 \
	  -v /docker/data:/data \
	  -e UID=1001 \
	  -e GID=1001 \
    -e WEBROOT=/rtorrent \
	xataz/rtorrent:filebot
```

## Contributing
Any contributions, are very welcome !