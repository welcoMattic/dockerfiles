FROM xataz/node:4.5
MAINTAINER xataz <https://github.com/xataz>

ENV UID=991 \
    GID=991 \
    RTORRENT_HOST=torrent \
    RTORRENT_PORT=5000 \
    RTORRENT_SOCKET=false \
    RTORRENT_SOCKET_PATH=/tmp/rtorrent.sock \
    FLOOD_SECRET=flood \
    FLOOD_START=production

LABEL description="flood nodejs alternative to rutorrent" \
      tags="latest" \
      build_ver="2016111501"

RUN BUILD_DEPS="git make gcc g++ python linux-headers" \
    && apk add -U ${BUILD_DEPS} su-exec s6 \
    && git clone https://github.com/jfurrow/flood /usr/flood \
    && cd /usr/flood \
    && npm run preinstall \
    && npm install \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/*

COPY rootfs /
RUN chmod +x /usr/local/bin/startup /etc/s6.d/*/*

VOLUME /usr/flood/server/db
WORKDIR /usr/flood

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["s6-svscan", "/etc/s6.d"]
