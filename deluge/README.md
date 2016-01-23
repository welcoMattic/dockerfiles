# Deluge Image

## ImageLayer
* 1.3-stable, 1.3, latest [![](https://badge.imagelayers.io/xataz/deluge:latest.svg)](https://imagelayers.io/?images=xataz/deluge:latest 'Get your own badge on imagelayers.io')
* 1.3-stable-filebot, 1.3-filebot, latest-filebot, filebot [![](https://badge.imagelayers.io/xataz/deluge:filebot.svg)](https://imagelayers.io/?images=xataz/deluge:filebot 'Get your own badge on imagelayers.io')
* 1.4-master, 1.4 [![](https://badge.imagelayers.io/xataz/deluge:1.4.svg)](https://imagelayers.io/?images=xataz/deluge:1.4 'Get your own badge on imagelayers.io')
* develop [![](https://badge.imagelayers.io/xataz/deluge:develop.svg)](https://imagelayers.io/?images=xataz/deluge:develop 'Get your own badge on imagelayers.io')

## Tag available
* 1.3-stable, 1.3, latest [(deluge/1.3-stable/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/deluge/1.3-stable/Dockerfile)
* 1.3-stable-filebot, 1.3-filebot, latest-filebot, filebot [(deluge/1.3-stable-filebot/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/deluge/1.3-stable-filebot/Dockerfile)
* 1.4-master, 1.4 [(deluge/1.4-master/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/deluge/1.4-master/Dockerfile)
* develop [(deluge/develop/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/deluge/develop/Dockerfile)

## Description
What is [(Deluge)](http://deluge-torrent.org/) ?

Deluge is a full-featured ​BitTorrent client for Linux, OS X, Unix and Windows. It uses ​libtorrent in its backend and features multiple user-interfaces including: GTK+, web and console. It has been designed using the client server model with a daemon process that handles all the bittorrent activity. The Deluge daemon is able to run on headless machines with the user-interfaces being able to connect remotely from any platform.

Deluge features a rich plugin collection; in fact, most of Deluge's functionality is available in the form of plugins.

Deluge was created with the intention of being lightweight and unobtrusive. It is our belief that downloading shouldn't be the primary task on your computer and therefore shouldn't monopolize system resources.

Deluge is not designed for any one desktop environment and will work just fine in GNOME, KDE, XFCE and others. We do our best to adhere to the ​freedesktop standards.

Deluge is ​Free Software and is licensed under the ​GNU General Public License. 

## BUILD IMAGE

```shell
docker build -t xataz/deluge:1.3-stable github.com/xataz/dockerfiles.git#master:deluge/1.3-stable
```

## Configuration
### Environments
* WEB_ROOT
* UID : Choose uid for launch deluge (default : 991)
* GID : Choose gid for launch deluge (default : 991)

### Volumes
* /config : Configuration file is here
* /data : Folder for download torrents

### Ports
* 8112
* 58846

## Usage
### Simple launch
```shell
docker run -d -p 8112:8112 xataz/deluge
```
URI access : http://XX.XX.XX.XX:8112

### Advanced launch
```shell
docker run -d -p 8112:8112 \
	-v /docker/data:/data \ 
	-v /docker/config/deluge:/config \
	-e UID=1001 \
	-e GID=1001 \
	-e WEB_ROOT=/torrent/ \
	xataz/deluge:1.3-stable
```
URI access : http://XX.XX.XX.XX:8112/torrent

For use webroot with a proxy pass, add the header X-Deluge-Base. Exemple with nginx :
```
proxy_set_header X-Deluge-Base "/torrent/";
```
