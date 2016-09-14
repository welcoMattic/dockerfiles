FROM xataz/s6-alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ARG BUILD_CORES
ARG MEDIAINFO_VER=0.7.88
ARG RTORRENT_VER=0.9.6
ARG LIBTORRENT_VER=0.13.6

ENV UID=991 \
    GID=991 \
    WEBROOT=/ \
    PORT_RTORRENT=45000 \
    PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

LABEL Description="rutorrent based on alpine" \
      tags="latest" \
      build_ver="2016091402"

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
                php5-fpm \
                php5-json \
                curl \
                gzip \
                zip \
                unrar \
                s6 \
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
    && make -j ${BUILD_CORES-$(grep -c "processor" /proc/cpuinfo)} \
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
    && make -j ${BUILD_CORES-$(grep -c "processor" /proc/cpuinfo)} \
    && make install \
    && cd /tmp/rtorrent \
    && git checkout ${RTORRENT_VER} \
    && ./autogen.sh \
    && ./configure --with-xmlrpc-c \
    && make -j ${BUILD_CORES-$(grep -c "processor" /proc/cpuinfo)} \
    && make install \
    && mkdir -p /var/www \
    && git clone https://github.com/Novik/ruTorrent.git /var/www/rutorrent \
    && git clone https://github.com/xombiemp/rutorrentMobile.git /var/www/rutorrent/plugins/mobile \
    && git clone https://github.com/Phlooo/ruTorrent-MaterialDesign.git /var/www/rutorrent/plugins/theme/themes/materialdesign \
    && mv /var/www/rutorrent /var/www/torrent \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/* \
    && deluser svn \
    && delgroup svnusers

COPY rootfs /
ARG WITH_FILEBOT=NO
ARG FILEBOT_VER=4.7.2

RUN if [ "${WITH_FILEBOT}" == "YES" ]; then \
        apk add -U openjdk8-jre \
        && mkdir /filebot \
        && cd /filebot \
        && wget http://downloads.sourceforge.net/project/filebot/filebot/FileBot_${FILEBOT_VER}/FileBot_${FILEBOT_VER}-portable.zip \
        && unzip FileBot_${FILEBOT_VER}-portable.zip \
        && echo 'system.method.set_key=event.download.finished,filebot,"execute={/usr/bin/postdl,$d.get_base_path=,$d.get_name=,$d.get_custom1=}"' >> /home/torrent/.rtorrent.rc \
        && echo 'system.method.set_key=event.download.erased,filebot_cleaner,"execute={/usr/bin/postrm}"' >> /home/torrent/.rtorrent.rc \
        && rm -rf /var/cache/apk/* /tmp/* /FileBot_${FILEBOT_VER}-portable.zip \
        && chmod +x /usr/bin/post* \
    ;fi

VOLUME /data /var/www/torrent/share/
EXPOSE 8080
RUN chmod +x /usr/local/bin/startup \
    && chmod +x /etc/s6.d/*/run

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["/bin/s6-svscan", "/etc/s6.d"]
