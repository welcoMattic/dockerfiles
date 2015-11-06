# up1
Simple up1 conteneur pour docker


# Intallation
## Installation via docker hub
``docker pull xataz/up1``

## installation via dockerfile
```git clone https://github.com/xataz/dockerfiles.git && cd dockerfiles/up1 && docker build -t xataz/up1 .```

# Usage
## Volume, port, env
### PORT
+ 80

### ENV
+ WEB_ROOT
+ APIKEY
+ DELETEKEY

### Volume
+ /Up1/i


## Lancement simple
``docker run -d -p 80:80 xataz/up1``

## Lancement avec un volume
``docker run -d -p 80:80 -v /mnt:/Up1/i --name up1 xataz/up1``

## Lancement avec un webroot différent
``docker run -d -p 80:80 -v /mnt:/Up1/i -e WEB_ROOT="/up1" --name up1 xataz/up1``

Up1 est accessible maintenant avec :
http://yourserver/up1
