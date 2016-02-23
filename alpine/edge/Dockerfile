FROM alpine:edge
MAINTAINER xataz <https://github.com/xataz>

# ARG GOSU_VER=1.7

ENV GOSU_VER=1.7

RUN echo "@community http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories \
    && echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories \
    && apk add -U tini@community

ADD https://github.com/tianon/gosu/releases/download/${GOSU_VER}/gosu-amd64 /usr/bin/gosu
RUN chmod +x /usr/bin/gosu

CMD ["sh"]
