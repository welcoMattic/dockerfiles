FROM xataz/alpine:3.

MAINTAINER xataz <https://github.com/xataz/>

VOLUME ["/data"]
ADD rootfs /

ENV UID=991 GID=991

RUN chmod +x /usr/bin/startup && \
    apk add --update transmission-daemon && \
    rm /var/cache/apk/*

CMD ["startup"]
