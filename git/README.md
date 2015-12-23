# Git image

## ImageLayer
* [![](https://badge.imagelayers.io/xataz/git:latest.svg)](https://imagelayers.io/?images=xataz/git:latest 'Get your own badge on imagelayers.io')

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/git/Dockerfile)

## USAGE
```
docker run -ti --rm -e GID=$(id -g) -e UID=$(id -u) -w "$(pwd)" -v "$(pwd)":"$(pwd)" xataz/git clone https://github.com/xataz/dockerfiles.git
```

Not execute on /

## CREATE A ALIAS
```
echo /home/user/.profile
```

add :
```
alias git='docker run -ti --rm -e GID=$(id -g) -e UID=$(id -u) -w "$(pwd)" -v "$(pwd)":"$(pwd)" xataz/git'
```

and use :
```
git clone https://github.com/xataz/dockerfiles.git
```
