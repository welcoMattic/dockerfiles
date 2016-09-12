# RTorrent


## Tag available
* latest [(rutorrent/latest/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/rtorrent/latest/Dockerfile)
* latest-filebot, filebot [(rutorrent/latest-filebot/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/rtorrent/latest/Dockerfile)

## Description
What is [rtorrent](https://github.com/rakshasa/rtorrent/) ?

rtorrent is the popular Bittorrent client.


## BUILD IMAGE
### simple build
```shell
docker build -t xataz/rutorrent github.com/xataz/dockerfiles.git#master:rutorrent/latest
```

### Build with arguments
```shell
docker build -t xataz/rtorrent:custom --build-arg WITH_FILEBOT=YES --build-arg RTORRENT_VER=0.9.4 github.com/xataz/dockerfiles.git#master:rtorrent/latest
```


## Configuration
### Build arguments
* BUILD_CORES : Number of cpu's core for compile (default : empty for use all cores)
* RTORRENT_VER : rtorrent version (default : 0.9.6)
* LIBTORRENT_VER : libtorrent version (default : 0.13.6)
* WITH_FILEBOT : Choose if install filebot (default : no)
* FILEBOT_VER : filebot version (if WITH_FILEBOT=YES) (default : 4.7)

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
docker run -d xataz/rtorrent
```

### Advanced launch
```shell
docker run -d -p 80:8080 \
	  -v /docker/data:/data \
	  -e UID=1001 \
	  -e GID=1001 \
    -e WEBROOT=/rtorrent \
	xataz/rtorrent:filebot
```

