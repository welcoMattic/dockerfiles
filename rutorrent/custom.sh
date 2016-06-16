#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1
CSI="\033["
CEND="${CSI}0m"
CRED="${CSI}1;31m"
CGREEN="${CSI}1;32m"
CYELLOW="${CSI}1;33m"
CBLUE="${CSI}1;34m"

# Download dependencies
docker pull alpine:3.3
docker build -t xataz/alpine:3.3 alpine/3.3

# Build rutorrent
docker build -t xataz/rutorrent:latest $FOLDER
docker build --build-arg WITH_FILEBOT=YES -t xataz/rutorrent:filebot $FOLDER
docker build --build-arg WITH_FILEBOT=YES -t xataz/rutorrent:latest-filebot $FOLDER

if [ "$DOCKER_PUSH"== ""]; then
    docker push xataz/rutorrent:latest
    docker push xataz/rutorrent:filebot
    docker push xataz/rutorrent:latest-filebot
fi
