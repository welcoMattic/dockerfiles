#!/bin/sh

mkdir -p /data/torrents
mkdir -p /data/Media
mkdir -p /data/watch
chown -R torrent:torrent /data
chown -R torrent:torrent /home/torrent

su - torrent -c "transmission-daemon --foreground"
