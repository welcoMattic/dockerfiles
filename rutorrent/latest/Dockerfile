FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ARG BUILD_CORES
ARG MEDIAINFO_VER=0.7.82
ARG RTORRENT_VER=0.9.6
ARG LIBTORRENT_VER=0.13.6

ENV UID=991 \
    GID=991 \
    WEBROOT=/ \
    PORT_RTORRENT=45000 \
    PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

RUN export BUILD_DEPS="build-base \
                        git \
                        libtool \
                        automake \
                        autoconf \
                        wget \
                        subversion \
                        cppunit-dev \
                        openssl-dev \
                        ncurses-dev \
                        curl-dev" \
    && apk add -U ${BUILD_DEPS} \
                ffmpeg \
                ca-certificates \
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
    && git clone https://github.com/esmil/mktorrent \
    && svn checkout http://svn.code.sf.net/p/xmlrpc-c/code/stable xmlrpc-c \
    && git clone https://github.com/rakshasa/libtorrent.git \
    && git clone https://github.com/rakshasa/rtorrent.git \
    && wget http://mediaarea.net/download/binary/mediainfo/${MEDIAINFO_VER}/MediaInfo_CLI_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && wget http://mediaarea.net/download/binary/libmediainfo0/${MEDIAINFO_VER}/MediaInfo_DLL_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && tar xzf MediaInfo_DLL_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && tar xzf MediaInfo_CLI_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && cd /tmp/mktorrent \
    && make -j ${BUILD_CORES-`grep -c "processor" /proc/cpuinfo`} \
    && make install \
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
    && cd /tmp/xmlrpc-c \
    && ./configure \
    && make -j ${NB_CORES} \
    && make install \
    && cd /tmp/libtorrent \
    && git checkout ${LIBTORRENT_VER} \    
    && ./autogen.sh \
    && ./configure \
    && make -j ${BUILD_CORES-`grep -c "processor" /proc/cpuinfo`} \
    && make install \
    && cd /tmp/rtorrent \
    && git checkout ${RTORRENT_VER} \
    && ./autogen.sh \
    && ./configure --with-xmlrpc-c \
    && make -j ${BUILD_CORES-`grep -c "processor" /proc/cpuinfo`} \
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
    && cd /var/www/rutorrent/plugins/theme/themes \
    && wget https://raw.githubusercontent.com/Swizards/QuickBox/master/plugins/rutorrent-quickbox-dark.zip \
    && unzip rutorrent-quickbox-dark.zip \
    && rm -rf rutorrent-quickbox-dark.zip \
    && mv /var/www/rutorrent /var/www/torrent \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/* \
    && deluser svn \
    && delgroup svnusers

ADD rootfs /
VOLUME /data /var/www/torrent/share/
EXPOSE 8080
RUN chmod +x /usr/bin/startup

CMD ["tini","--","/usr/bin/startup"]

