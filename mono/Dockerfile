FROM alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

LABEL description="mono based on alpine" \
      tags="latest" \
      build_ver="$(date +%Y%m%d)"

RUN export BUILD_DEPS="tar \
                    xz \
                    ca-certificates \
                    wget " \
    && apk add -U --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ ${BUILD_DEPS} \
                    mono \
    && apk del ${BUILD_DEPS} \
    && rm -rf /tmp/* /var/cache/apk/*
