# DELUGE 

## TAG/DOCKERFILE 

* 1.3-stable latest [(deluge/1.3-stable/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/deluge/1.3-stable/Dockerfile)
* 1.3-stable-filebot filebot [(deluge/1.3-stable-filebot/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/deluge/1.3-stable-filebot/Dockerfile)
* 1.4-master [(deluge/1.4-master/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/deluge/1.4-master/Dockerfile)
* develop [(deluge/develop/Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/deluge/develop/Dockerfile)

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

```shell
docker build -t xataz/deluge:1.3-stable github.com/xataz/dockerfiles.git#master:deluge/1.3-stable
```

## PULL IMAGE

```shell
docker pull xataz/deluge:1.3-stable
```

## RUN CONTAINER

```shell
docker run -d -p 8112:8112 -v /home/user:/data -v /docker/config/deluge:/config xataz/deluge:1.3-stable
```
