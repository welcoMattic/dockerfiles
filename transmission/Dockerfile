FROM alpine:3.2
MAINTAINER xataz <https://github.com/xataz/>

VOLUME ["/data"]
ADD rootfs /

RUN addgroup -g 5000 torrent && adduser -h /home/torrent -D -G torrent -s /bin/sh -u 5000 torrent && chmod +x /usr/bin/start.sh && \
    apk add --update transmission-daemon && \
    rm /var/cache/apk/*

CMD ["/usr/bin/start.sh"]
