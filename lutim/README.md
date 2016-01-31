[![](http://framacloud.org/wp-content/uploads/2015/03/lutim.jpg)

## ImageLayer
* latest [![](https://badge.imagelayers.io/xataz/lutim:latest.svg)](https://imagelayers.io/?images=xataz/lutim:latest 'Get your own badge on imagelayers.io')

## Tag available
* latest [(lutim/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/lutim/Dockerfile)

## Description
What is [Lutim](https://git.framasoft.org/luc/lutim) ?

It means Let's Upload That Image.

It stores images and allows you to see them, download them or share them on social networks. From version 0.5, the gif images can be displayed as animated gifs in Twitter, but you need a HTTPS server (Twitter requires that. Lutim detects if you have a HTTPS server and displays an static image twitter card if you don't);

Images are indefinitly stored unless you request that they will be deleted at first view or after 24 hours / one week / one month / one year.

## BUILD IMAGE

```shell
docker build -t xataz/lutim github.com/xataz/dockerfiles.git#master:lutim
```

## Configuration
### Environments
* UID : Choose uid for launch lutim (default : 991)
* GID : Choose gid for launch lutim (default : 991)
* WEBROOT : webroot of lutim (default : /)
* SECRET : random string used to encrypt cookies (default : e7c0b28877f7479fe6711720475dcbbd)
* MAX_FILE_SIZE : maximum file size of an uploaded file in bytes (default : 10000000000)
* CONTACT : lutim contact (default : contact@domain.tld)

Tip : you can use the following command to generate SECRET. `date +%s | md5sum | head -c 32`

### Volumes
* /data : Lutim's database is here
* /lutim/files : Location of uploaded images

#### data Folder tree
* /data/.watch : Rtorrent watch this folder and add automatly torrent file
* /data/.session : Rtorrent save statement here
* /data/torrents : Rtorrent download torrent here
* /data/Media : If filebot version, rtorrent create a symlink 

### Ports
* 80

## Usage
### Simple launch
```shell
docker run -d -p 8181:8181 xataz/lutim
```
URI access : http://XX.XX.XX.XX:8181

### Advanced launch
```shell
docker run -d -p 8080:8181 \
	-v /docker/config/lutim/data:/data \
    -v /docker/data/lutim:/lutim/files 
	-e UID=1001 \
	-e GID=1001 \
    -e WEBROOT=/lutim \
    -e SECRET=$(date +%s | md5sum | head -c 32) \
    -e CONTACT=contact@mydomain.com \
    -e MAX_FILE_SIZE=250000000 \
	xataz/lutim
```
URI access : http://XX.XX.XX.XX:8080/lutim
