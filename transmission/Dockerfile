FROM xataz/alpine:3.5
MAINTAINER xataz <https://github.com/xataz/>

LABEL description="transmission based on alpine" \
      tags="latest" \
      build_ver="2016123001"

ENV UID=991 \
    GID=991 \
    WEBROOT=""

RUN BUILD_DEPS="git \
                ca-certificates" \
    && apk add -U transmission-daemon \
                su-exec \
                tini \
                ${BUILD_DEPS} \
    && git clone https://github.com/ronggang/transmission-web-control /tmp/webui \
    && mkdir -p /home/transmission/.local/share/transmission/web/ \
    && cp -R /tmp/webui/src/* /home/transmission/.local/share/transmission/web/ \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/*

VOLUME ["/data","/home/transmission/.config/transmission-daemon/"]
COPY rootfs /
RUN chmod +x /usr/local/bin/startup

ARG WITH_FILEBOT=NO
ARG FILEBOT_VER=4.7.5

RUN if [ "${WITH_FILEBOT}" == "YES" ]; then \
        apk add -U openjdk8-jre ca-certificates libressl \
        && mkdir /filebot \
        && cd /filebot \
        && wget http://downloads.sourceforge.net/project/filebot/filebot/FileBot_${FILEBOT_VER}/FileBot_${FILEBOT_VER}-portable.tar.xz -O /filebot/filebot.tar.xz \
        && tar xJf filebot.tar.xz \
        && sed -i -e 's|"script-torrent-done-enabled": false,|"script-torrent-done-enabled": true,|' \
                -e 's|"script-torrent-done-filename": "",|"script-torrent-done-filename": "",|' /tmp/settings.json \
        && apk del ca-certificates libressl \
        && rm -rf /var/cache/apk/* /tmp/* /filebot/FileBot_${FILEBOT_VER}-portable.tar.xz \
        && chmod +x /usr/local/bin/post* \
    ;fi

EXPOSE 9091

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["transmission-daemon", "--foreground"]
