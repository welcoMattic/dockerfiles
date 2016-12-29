FROM xataz/alpine:3.5
MAINTAINER xataz <https://github.com/xataz>

ARG BUILD_CORES
ARG RTORRENT_VER=0.9.6
ARG LIBTORRENT_VER=0.13.6

ENV UID=991 \
    GID=991 \
    PORT_RTORRENT=45000 \
    PKG_CONFIG_PATH=/usr/local/lib/pkgconfig \
    TERM=xterm
    
LABEL Description="rtorrent based on alpine" \
      tags="latest" \
      build_ver="2016111501"

RUN export BUILD_DEPS="build-base \
                        git \
                        libtool \
                        automake \
                        autoconf \
                        wget \
                        subversion \
                        cppunit-dev \
                        libressl-dev \
                        ncurses-dev \
                        curl-dev" \
    && apk add -U ${BUILD_DEPS} \
                ca-certificates \
                curl \
                ncurses \
                libstdc++ \
                libgcc \
                tar \
                xz \
                tini \
                su-exec \
                libressl \
    && cd /tmp \
    && svn checkout http://svn.code.sf.net/p/xmlrpc-c/code/stable xmlrpc-c \
    && git clone https://github.com/rakshasa/libtorrent.git \
    && git clone https://github.com/rakshasa/rtorrent.git \
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
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/* \
    && deluser svn \
    && delgroup svnusers

COPY rootfs /
ARG WITH_FILEBOT=NO
ARG FILEBOT_VER=4.7.5

RUN if [ "${WITH_FILEBOT}" == "YES" ]; then \
        apk add -U openjdk8-jre \
        && mkdir /filebot \
        && cd /filebot \
        && wget http://downloads.sourceforge.net/project/filebot/filebot/FileBot_${FILEBOT_VER}/FileBot_${FILEBOT_VER}-portable.tar.xz -O /filebot/filebot.tar.xz \
        && tar xJf filebot.tar.xz \
        && echo 'system.method.set_key=event.download.finished,filebot,"execute={/usr/local/bin/postdl,$d.get_base_path=,$d.get_name=,$d.get_custom1=}"' >> /home/torrent/.rtorrent.rc \
        && echo 'system.method.set_key=event.download.erased,filebot_cleaner,"execute=/usr/local/bin/postrm"' >> /home/torrent/.rtorrent.rc \
        && rm -rf /var/cache/apk/* /tmp/* /FileBot_${FILEBOT_VER}-portable.zip \
        && chmod +x /usr/local/bin/post* \
    ;fi

VOLUME /data /var/www/torrent/share/
EXPOSE 8080
RUN chmod +x /usr/local/bin/startup

ENTRYPOINT ["/usr/bin/startup"]
CMD ["rtorrent"]
