#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

# Download dependencies
docker pull xataz/alpine:3.4

# Build rutorrent
echo "Build with docker 1.9.1"
docker build --build-arg DOCKER_VER=1.9.1 -t xataz/docker-client:1.9.1 $FOLDER
docker tag xataz/docker-client:1.9.1 xataz/docker-client:1.9
echo "Build with docker 1.10.3"
docker build --build-arg DOCKER_VER=1.10.3 -t xataz/docker-client:1.10.3 $FOLDER
docker tag xataz/docker-client:1.10.3 xataz/docker-client:1.10
echo "Build with docker 1.11.2"
docker build --build-arg DOCKER_VER=1.11.2 -t xataz/docker-client:1.11.2 $FOLDER
docker tag xataz/docker-client:1.11.2 xataz/docker-client:1.11
echo "Build with docker 1.12.5"
docker build --build-arg DOCKER_VER=1.12.5 -t xataz/docker-client:1.12.5 $FOLDER
docker tag xataz/docker-client:1.12.5 xataz/docker-client:1.12
docker tag xataz/docker-client:1.12.5 xataz/docker-client:latest


if [ "$DOCKER_PUSH" == "push" ]; then
  for image in $(docker images --format "{{.Repository}}:{{.Tag}}" docker-client); do
    docker push $image
  done
fi
