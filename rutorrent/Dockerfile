FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

RUN apk add -U subversion wget ffmpeg ca-certificates rtorrent nginx php-fpm php-json curl gzip zip unrar supervisor git geoip && \
    	mkdir -p /var/www && cd /var/www && git clone https://github.com/Novik/ruTorrent.git rutorrent && \
        cd /var/www/rutorrent/plugins/ && svn co http://rutorrent-logoff.googlecode.com/svn/trunk logoff && \
        cd /var/www/rutorrent/plugins/ && git clone https://github.com/xombiemp/rutorrentMobile.git mobile && \
        cd /var/www/rutorrent/plugins/ && svn checkout http://rutorrent-pausewebui.googlecode.com/svn/trunk pausewebui && \
        mv /var/www/rutorrent /var/www/torrent && \
	apk del wget ca-certificates git subversion && \
    	rm /var/cache/apk/* && rm -rf /var/www/torrent/plugins/mediainfo

ADD rootfs /
VOLUME /data
EXPOSE 80
RUN chmod +x /usr/bin/startup

CMD ["startup"]
