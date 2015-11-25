# git docker

## USAGE
```
docker run -ti --rm -e GID=$(id -g) -e UID=$(id -u) -w "$(pwd)" -v "$(pwd)":"$(pwd)" xataz/git clone https://github.com/xataz/dockerfiles.git
```

Not execute on /

## CREATE A ALIAS
```
echo /home/user/.profile
```
and add :
```
alias git='docker run -ti --rm -e GID=$(id -g) -e UID=$(id -u) -w "$(pwd)" -v "$(pwd)":"$(pwd)" xataz/git'
```
