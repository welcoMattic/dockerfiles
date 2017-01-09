![bower](http://bower.io/img/bower-logo.svg)

> This image is build and push with [drone.io](https://github.com/drone/drone), a circle-ci like self-hosted.
> If you don't trust, you can build yourself.

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/bower/Dockerfile)

## Description
What is [bower](http://bower.io/) ?

Bower offers a generic, unopinionated solution to the problem of front-end package management, while exposing the package dependency model via an API that can be consumed by a more opinionated build stack. There are no system wide dependencies, no dependencies are shared between different apps, and the dependency tree is flat.

Bower runs over Git, and is package-agnostic. A packaged component can be made up of any type of asset, and use any type of transport (e.g., AMD, CommonJS, etc.).

**This image not contains root process**

## Build Image

```shell
docker build -t xataz/bower github.com/xataz/dockerfiles.git#master:bower
```

## Configuration
### Environments
* UID : Choose uid for launch bower (default : 991)
* GID : Choose gid for launch bower (default : 991)

## Usage
### Build your project
```shell
docker run -it --rm \
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    -e UID=$(id -u) \
    -e GID=$(id -g) \
    xataz/bower install
```

### Alias for bashrc
```shell
alias bower='docker run -it --rm \
        -v $(pwd):$(pwd) \
        -w $(workdir) \
        -e UID=$(id -u) \
        -e GID=$(pwd) \
        xataz/bower'
```

## Contributing
Any contributions, are very welcome !