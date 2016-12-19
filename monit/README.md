![monit](https://mmonit.com/monit/img/logo.png)

## Tag available
* latest, 5.20.0, 5.20, 5 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/monit/Dockerfile)

## Description
What is [monit](https://mmonit.com/monit/) ?

Monit is a small Open Source utility for managing and monitoring Unix systems. Monit conducts automatic maintenance and repair and can execute meaningful causal actions in error situations. 

## Build Image

```shell
docker build -t xataz/monit github.com/xataz/dockerfiles.git#master:monit
```

## Configuration
### Environments
* USER_MONIT : Choose username (default : monit)
* PASSWORD_MONIT : Choose password (default : monit)

### Volumes
* /etc/monit/conf.d : Service configuration files

### Ports
* 2812

## Usage
### Launch
```shell
docker run -d \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -p 2812:2812 \
        xataz/monit
```
