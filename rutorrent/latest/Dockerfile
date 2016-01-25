FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ENV UID=991 GID=991 MEDIAINFO_VER=0.7.81 WEBROOT=/

RUN export BUILD_DEPS="build-base \
                        git \
                        libtool \
                        automake \
                        autoconf \
                        wget \
                        subversion" \
    && apk add -U ${BUILD_DEPS} \
                ffmpeg \
                ca-certificates \
                rtorrent \
                nginx \
                php-fpm \
                php-json \
                curl \
                gzip \
                zip \
                unrar \
                supervisor \
                geoip \
    && cd /tmp \
    && wget http://mediaarea.net/download/binary/mediainfo/${MEDIAINFO_VER}/MediaInfo_CLI_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && wget http://mediaarea.net/download/binary/libmediainfo0/${MEDIAINFO_VER}/MediaInfo_DLL_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && tar xzf MediaInfo_DLL_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && tar xzf MediaInfo_CLI_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && cd  /tmp/MediaInfo_DLL_GNU_FromSource \
    && ./SO_Compile.sh \
    && cd /tmp/MediaInfo_DLL_GNU_FromSource/ZenLib/Project/GNU/Library \
    && make install \
    && cd /tmp/MediaInfo_DLL_GNU_FromSource/MediaInfoLib/Project/GNU/Library \
    && make install \
    && cd /tmp/MediaInfo_CLI_GNU_FromSource \
    && ./CLI_Compile.sh \
    && cd /tmp/MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI \
    && make install \
    && mkdir -p /var/www \
    && cd /var/www \
    && git clone https://github.com/Novik/ruTorrent.git rutorrent \
    && cd /var/www/rutorrent/plugins/ \
    && svn co http://rutorrent-logoff.googlecode.com/svn/trunk logoff \
    && cd /var/www/rutorrent/plugins/ \
    && git clone https://github.com/xombiemp/rutorrentMobile.git mobile \
    && cd /var/www/rutorrent/plugins/ \
    && svn checkout http://rutorrent-pausewebui.googlecode.com/svn/trunk pausewebui \
    && mv /var/www/rutorrent /var/www/torrent \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/* 

ADD rootfs /
VOLUME /data
EXPOSE 80
RUN chmod +x /usr/bin/startup

CMD ["startup"]
