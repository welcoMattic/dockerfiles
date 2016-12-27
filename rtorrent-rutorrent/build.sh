#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

f_log() {
  echo "=$1= $(date +%d/%m/%Y-%H:%M:%S) $2"
}

# Download dependencies
docker pull xataz/alpine:3.4

# Build rtorrent-rutorrent
f_log INF "Build xataz/rtorrent-rutorrent:latest ..."
docker build -t xataz/rtorrent-rutorrent:latest $FOLDER > /tmp/build.log 2>&1
if [ $? == 0 ]; then
  f_log INF "Build xataz/rtorrent-rutorrent:latest done"
  if [ "$DOCKER_PUSH" == "push" ]; then
    f_log INF "Push xataz/rtorrent-rutorrent:latest ..."
    docker push xataz/rtorrent-rutorrent:latest > /tmp/push.log 2>&1
    if [ $? == 0 ]; then
      f_log INF "Push xataz/rtorrent-rutorrent:latest done"
    else
      f_log ERR "Push xataz/rtorrent-rutorrent:latest failed"
      cat /tmp/push.log
    fi
  fi
else
  f_log ERR "Build xataz/rtorrent-rutorrent:latest failed"
  cat /tmp/build.log
fi
f_log INF "Build xataz/rtorrent-rutorrent:filebot ..."
docker build --build-arg WITH_FILEBOT=YES -t xataz/rtorrent-rutorrent:filebot $FOLDER > /tmp/build.log 2>&1
if [ $? == 0 ]; then
  f_log INF "Build xataz/rtorrent-rutorrent:filebot done"
  docker tag xataz/rtorrent-rutorrent:filebot xataz/rtorrent-rutorrent:latest-filebot
    if [ "$DOCKER_PUSH" == "push" ]; then
    f_log INF "Push xataz/rtorrent-rutorrent:filebot ..."
    docker push xataz/rtorrent-rutorrent:filebot > /tmp/push.log 2>&1
    docker push xataz/rtorrent-rutorrent:latest-filebot >> /tmp/push.log 2>&1
    if [ $? == 0 ]; then
      f_log INF "Push xataz/rtorrent-rutorrent:filebot done"
    else
      f_log ERR "Push xataz/rtorrent-rutorrent:filebot failed"
      cat /tmp/push.log
    fi
  fi
else
  f_log ERR "Build xataz/rtorrent-rutorrent:filebot failed"
  cat /tmp/build.log
fi
