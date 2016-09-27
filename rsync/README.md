![rsync](https://rsync.samba.org/)

## Description
What is [rsync](https://rsync.samba.org/) ?

rsync is an open source utility that provides fast incremental file transfer. rsync is freely available under the GNU General Public License and is currently being maintained by Wayne Davison.

## Build Image

```shell
docker build -t xataz/rsync github.com/xataz/dockerfiles.git#master:rsync
```

## Configuration
### Environments
* UID : Choose uid for use rsync (default : 991)
* GID : Choose gid for use rsync (default : 991)
* USER : Choose username (default : user)

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
    xataz/rsync
```

