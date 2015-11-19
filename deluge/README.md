# DELUGE

## TAG/DOCKERFILE
* 1.3-stable latest
* 1.3-stable-filebot filebot 
* 1.4-master
* develop

## IMAGE USAGE
### Environment
* WEB_ROOT

### Volumes
* /config
* /data

### Ports
* 8112
* 58846

## BUILD IMAGE
```
docker build -t xataz/deluge:1.3-stable github.com/xataz/dockerfiles.git#master:deluge/1.3-stable
```

## PULL IMAGE
```
docker pull xataz/deluge:1.3-stable
```

## RUN CONTAINER 
```
docker run -d -p 8112:8112 -v /home/user:/data -v /docker/config/deluge:/config xataz/deluge:1.3-stable
```
