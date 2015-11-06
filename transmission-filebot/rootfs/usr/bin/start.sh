#!/bin/sh

mkdir -p /data/{torrents,Media}
chown -R torrent:torrent /data
chown -R torrent:torrent /home/torrent

su - torrent -c "transmission-daemon --foreground"
