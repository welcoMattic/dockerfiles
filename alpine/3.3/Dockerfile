FROM alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

# ARG GOSU_VER=1.7

ENV GOSU_VER=1.7

RUN echo "@community http://dl-4.alpinelinux.org/alpine/v3.3/community/" >> /etc/apk/repositories \
    && apk add -U \
        --repository http://dl-1.alpinelinux.org/alpine/edge/community/ tini \
    && rm -rf /var/cache/apk/*

ADD https://github.com/tianon/gosu/releases/download/${GOSU_VER}/gosu-amd64 /usr/bin/gosu
RUN chmod +x /usr/bin/gosu

CMD ["sh"]
