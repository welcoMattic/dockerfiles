FROM xataz/alpine:edge
MAINTAINER xataz <https://github.com/xataz>

RUN apk add -U tini@community \
    && rm -rf /var/cache/apk/*

ADD https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 /usr/bin/gosu
RUN chmod +x /usr/bin/gosu

CMD ["sh"]
