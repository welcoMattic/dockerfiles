#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

# Download dependencies
docker pull alpine:3.3
docker build -t xataz/alpine:3.3 alpine/3.3

# Build rutorrent
echo "Build with docker 1.9.1"
docker build --build-arg DOCKER_VER=1.9.1 -t xataz/drone-docker:1.9.1 $FOLDER
docker build --build-arg DOCKER_VER=1.9.1 -t xataz/drone-docker:1.9 $FOLDER
echo "Build with docker 1.10.3"
docker build --build-arg DOCKER_VER=1.10.3 -t xataz/drone-docker:1.10.3 $FOLDER
docker build --build-arg DOCKER_VER=1.10.3 -t xataz/drone-docker:1.10 $FOLDER
echo "Build with docker 1.11.2"
docker build --build-arg DOCKER_VER=1.11.2 -t xataz/drone-docker:1.11.2 $FOLDER
docker build --build-arg DOCKER_VER=1.11.2 -t xataz/drone-docker:1.11 $FOLDER
docker build --build-arg DOCKER_VER=1.11.2 -t xataz/drone-docker:latest $FOLDER
echo "Build with docker 1.12.0-rc4"
docker build --build-arg DOCKER_VER=1.12.0-rc5 -t xataz/drone-docker:1.12.0-rc5 $FOLDER
docker build --build-arg DOCKER_VER=1.12.0-rc5 -t xataz/drone-docker:1.12.0 $FOLDER
docker build --build-arg DOCKER_VER=1.12.0-rc5 -t xataz/drone-docker:1.12 $FOLDER

if [ "$DOCKER_PUSH" == "push" ]; then
  for image in $(docker images --format "{{.Repository}}:{{.Tag}}" drone-docker); do
    docker push $image
  done
fi
