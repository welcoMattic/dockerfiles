FROM alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

LABEL description="Letsencrypt based on alpine" \
      tags="latest" \
      build_ver="2016100301"

RUN echo "@commuedge https://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk add -U \
    certbot@commuedge \
    tini \
 && rm -rf /var/cache/apk/*

EXPOSE 80 443
VOLUME /etc/letsencrypt/

ENTRYPOINT ["/sbin/tini","--","certbot"]
CMD ["--help"]
