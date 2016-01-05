#!/bin/bash

mkdir -p /data/{torrents,watch,.session,Media}
chown -R torrent:torrent /data
chown -R torrent:torrent /var/www 
chown -R torrent:torrent /home/torrent
chown -R torrent:torrent /var/lib/nginx

rm -f /data/.session/rtorrent.lock

/usr/bin/supervisord -c /etc/supervisord.conf
