![sshd](http://www.openssh.com/)

## Description
What is [opensshd](http://www.openssh.com/) ?

OpenSSH is the premier connectivity tool for remote login with the SSH protocol. It encrypts all traffic to eliminate eavesdropping, connection hijacking, and other attacks. In addition, OpenSSH provides a large suite of secure tunneling capabilities, several authentication methods, and sophisticated configuration options.

The OpenSSH suite consists of the following tools:

Remote operations are done using ssh, scp, and sftp.
Key management with ssh-add, ssh-keysign, ssh-keyscan, and ssh-keygen.
The service side consists of sshd, sftp-server, and ssh-agent.
OpenSSH is developed by a few developers of the OpenBSD Project and made available under a BSD-style license.

OpenSSH is incorporated into many commercial products, but very few of those companies assist OpenSSH with funding.

Contributions towards OpenSSH can be sent to the OpenBSD Foundation.

## Build Image

```shell
docker build -t xataz/sshd github.com/xataz/dockerfiles.git#master:sshd
```

## Configuration
### Environments
* UID : Choose uid for use sshd (default : 991)
* GID : Choose gid for use sshd (default : 991)
* USER : Choose username (default : openssh)

### Volumes
* /home/$USER : Mount this on your home directory
* /etc/sshd/keys : For save fingerprint

### Ports
* 2222

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

