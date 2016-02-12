FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

RUN echo "@edgecommunity http://dl-1.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories \
    && apk add -U tini@edgecommunity \
    && rm -rf /var/cache/apk/*

ADD https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 /usr/bin/gosu
RUN chmod +x /usr/bin/gosu

CMD ["sh"]
