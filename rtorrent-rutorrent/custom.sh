#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

# Download dependencies
docker pull xataz/s6-alpine:3.4

# Build rtorrent-rutorrent
docker build -t xataz/rtorrent-rutorrent:latest $FOLDER
docker build --build-arg WITH_FILEBOT=YES -t xataz/rtorrent-rutorrent:filebot $FOLDER
docker build --build-arg WITH_FILEBOT=YES -t xataz/rtorrent-rutorrent:latest-filebot $FOLDER

if [ "$DOCKER_PUSH" == "push" ]; then
  for tag in latest filebot latest-filebot; do
    docker push xataz/rtorrent-rutorrent:$tag
  done
fi
