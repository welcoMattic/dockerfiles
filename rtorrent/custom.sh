#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

# Download dependencies
docker pull xataz/tini-alpine:3.4

# Build rutorrent
docker build -t xataz/rtorrent:latest $FOLDER
docker build --build-arg WITH_FILEBOT=YES -t xataz/rtorrent:filebot $FOLDER
docker build --build-arg WITH_FILEBOT=YES -t xataz/rtorrent:latest-filebot $FOLDER

if [ "$DOCKER_PUSH" == "push" ]; then
  for tag in latest filebot latest-filebot; do
    docker push xataz/rtorrent:$tag
  done
fi
