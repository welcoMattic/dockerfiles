#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

# Download dependencies
docker pull xataz/tini-alpine:3.4

# Build rutorrent
echo "Build with docker 1.9.1"
docker build --build-arg DOCKER_VER=1.9.1 -t xataz/drone-docker:1.9.1 $FOLDER
docker tag xataz/drone-docker:1.9.1 xataz/drone-docker:1.9
echo "Build with docker 1.10.3"
docker build --build-arg DOCKER_VER=1.10.3 -t xataz/drone-docker:1.10.3 $FOLDER
docker tag xataz/drone-docker:1.10.3 xataz/drone-docker:1.10
echo "Build with docker 1.11.2"
docker build --build-arg DOCKER_VER=1.11.2 -t xataz/drone-docker:1.11.2 $FOLDER
docker tag xataz/drone-docker:1.11.2 xataz/drone-docker:1.11
echo "Build with docker 1.12.1"
docker build --build-arg DOCKER_VER=1.12.1 -t xataz/drone-docker:1.12.1 $FOLDER
docker tag xataz/drone-docker:1.12.1 xataz/drone-docker:1.12
docker tag xataz/drone-docker:1.12.1 xataz/drone-docker:latest


if [ "$DOCKER_PUSH" == "push" ]; then
  for image in $(docker images --format "{{.Repository}}:{{.Tag}}" drone-docker); do
    docker push $image
  done
fi
