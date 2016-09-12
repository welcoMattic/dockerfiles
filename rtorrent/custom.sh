#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

# Download dependencies
docker pull alpine:3.4
docker build -t xataz/alpine:3.4 alpine/3.4

# Build rutorrent
docker build -t xataz/rtorrent:latest $FOLDER
docker build --build-arg WITH_FILEBOT=YES -t xataz/rtorrent:filebot $FOLDER
docker build --build-arg WITH_FILEBOT=YES -t xataz/rtorrent:latest-filebot $FOLDER

if [ "$DOCKER_PUSH" == "push" ]; then
  for image in $(docker images --format "{{.Repository}}:{{.Tag}}" rutorrent); do
    docker push $image
  done
fi
