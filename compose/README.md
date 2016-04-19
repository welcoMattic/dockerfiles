![docker-compose](https://raw.githubusercontent.com/docker/compose/master/logo.png)

## Tag available
* 1.7.0, latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/compose/Dockerfile)

## Description
What is [docker-compose](https://github.com/docker/compose) ?

Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a Compose file to configure your application's services. Then, using a single command, you create and start all the services from your configuration.

## Build Image

```shell
docker build -t xataz/compose github.com/xataz/dockerfiles.git#master:compose
```
### Build other version
```shell
docker build -t xataz/compose --build-arg COMPOSE_VER=1.6.2 github.com/xataz/dockerfiles.git#master:compose
```

## Configuration
### Environments
* UID : Choose uid for launch compose (default : 991)
* GID : Choose gid for launch compose (default : 991) (use docker group gid)

## Usage
### Build your project
```shell
docker run -it --rm \
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    -e UID=$(id -u) \
    -e GID=$(id -g) \
    xataz/compose:1.7.0 up -d
```

### Alias for bashrc
```shell
alias compose='docker run -it --rm \
        -v $(pwd):$(pwd) \
        -w $(workdir) \
        -e UID=$(id -u) \
        -e GID=991 \
        xataz/compose:1.7.0'
```
