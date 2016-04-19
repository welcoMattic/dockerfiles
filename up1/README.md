# up1
Simple up1 conteneur pour docker

## Tag available
* latest [(Dockerfile)]()

## Intallation
### Installation via docker hub
``docker pull xataz/up1``

### installation via dockerfile
```git clone https://github.com/xataz/dockerfiles.git && cd dockerfiles/up1 && docker build -t xataz/up1 .```

# Usage
## Volume, port, env
### PORT
+ 5000

### ENV
+ WEB_ROOT
+ APIKEY
+ DELETEKEY
+ GID
+ UID

### Volume
+ /Up1/i


## Lancement simple
``docker run -d -p 5000:5000 xataz/up1``

## Lancement avec un volume
``docker run -d -p 5000:5000 -v /mnt:/Up1/i --name up1 xataz/up1``

## Lancement avec un webroot différent
``docker run -d -p 5000:5000 -v /mnt:/Up1/i -e WEB_ROOT="/up1" --name up1 xataz/up1``

Up1 est accessible maintenant avec :
http://yourserver:5000/up1

