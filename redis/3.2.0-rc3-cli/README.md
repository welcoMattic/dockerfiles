![](https://upload.wikimedia.org/wikipedia/en/thumb/6/6b/Redis_Logo.svg/467px-Redis_Logo.svg.png)

## ImageLayer
* 3.0.7 [![](https://badge.imagelayers.io/xataz/redis:3.0.7.svg)](https://imagelayers.io/?images=xataz/redis:3.0.7 'Get your own badge on imagelayers.io')
* 3.0.7-cli [![](https://badge.imagelayers.io/xataz/redis:3.0.7-cli.svg)](https://imagelayers.io/?images=xataz/redis:3.0.7-cli 'Get your own badge on imagelayers.io')
* 3.2.0-rc3 [![](https://badge.imagelayers.io/xataz/redis:3.2.0-rc3.svg)](https://imagelayers.io/?images=xataz/redis:3.2.0-rc3 'Get your own badge on imagelayers.io')
* 3.2.0-rc3-cli [![](https://badge.imagelayers.io/xataz/redis:3.2.0-rc3-cli.svg)](https://imagelayers.io/?images=xataz/redis:3.2.0-rc3-cli 'Get your own badge on imagelayers.io')
* unstable [![](https://badge.imagelayers.io/xataz/redis:unstable.svg)](https://imagelayers.io/?images=xataz/redis:unstable 'Get your own badge on imagelayers.io')
* unstable-cli [![](https://badge.imagelayers.io/xataz/redis:unstable-cli.svg)](https://imagelayers.io/?images=xataz/redis:unstable-cli 'Get your own badge on imagelayers.io')


## Tag available
* latest, mainline, 1.9, 1.9.11 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/nginx/1.9.11/Dockerfile)
* stable, 1.8, 1.8.1  [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/nginx/1.8.1/Dockerfile)

* latest, stable, 3, 3.0, 3.0.7 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/redis/3.0.7/Dockerfile)
* latest-cli, stable-cli, 3-cli, 3.0-cli, 3.0.7-cli [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/redis/3.0.7-cli/Dockerfile)
* testing, 3.2, 3.2.0, 3.2.0-rc3 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/redis/3.2.0-rc3/Dockerfile)
* testing-cli, 3.2-cli, 3.2.0-cli, 3.2.0-rc3-cli [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/redis/3.2.0-rc3-cli/Dockerfile)
* unstable [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/redis/unstable/Dockerfile)
* unstable-cli [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/redis/unstable-cli/Dockerfile)


## Description
What is [Redis](http://redis.io/)?

edis is an open source (BSD licensed), in-memory data structure store, used as database, cache and message broker. It supports data structures such as strings, hashes, lists, sets, sorted sets with range queries, bitmaps, hyperloglogs and geospatial indexes with radius queries. Redis has built-in replication, Lua scripting, LRU eviction, transactions and different levels of on-disk persistence, and provides high availability via Redis Sentinel and automatic partitioning with Redis Cluster.

## Build Image

```shell
docker build -t xataz/nginx github.com/xataz/dockerfiles.git#master:redis/3.0.7
```

## Configuration
### Environments
* UID : Choose uid for launch nginx (default : 991)
* GID : Choose gid for launch nginx (default : 991)

### Volumes
* /var/lib/redis : Home for redis

### Ports
* 6379 

## Usage
### Server launch
```shell
docker run -d \
        --name redis \
	-p 6379:6379 \
	-v /docker/config/redis:/var/lib/redis \
	xataz/redis:3.0.7
```

### Cli usage
```shell
docker run -ti --rm \
        --link redis:redis \
	xataz/redis-cli:3.0.7 -h redis ping
```
