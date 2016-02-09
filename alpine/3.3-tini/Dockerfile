FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

run echo "@edgecommunity http://dl-1.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories \
    && apk add -U tini@edgecommunity \
    && rm -rf /var/cache/apk/*

CMD ["sh"]
