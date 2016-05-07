![sshd](https://matt.ucc.asn.au/dropbear/dropbear.html)

## Description
What is [Dropbear](https://matt.ucc.asn.au/dropbear/dropbear.html) ?

Dropbear is a relatively small SSH server and client. It runs on a variety of POSIX-based platforms. Dropbear is open source software, distributed under a MIT-style license. Dropbear is particularly useful for "embedded"-type Linux (or other Unix) systems, such as wireless routers.

## Build Image

```shell
docker build -t xataz/sshd github.com/xataz/dockerfiles.git#master:sshd
```

## Configuration
### Environments
* UID : Choose uid for use sshd (default : 991)
* GID : Choose gid for use sshd (default : 991)
* USER : Choose username (default : user)

### Volumes
* /home/<user> : Mount this on your home directory
* /etc/dropbear : For save fingerprint

### Ports
* 22

## Usage
### Build your project
```shell
docker run -it --rm \
    -e UID=$(id -u) \
    -e GID=$(id -g) \
    -e USER=$USER \
    -v ~/:/home/$USER \
    xataz/sshd
```

