FROM alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ARG GOSU_VER=1.8
ARG TINI_VER=0.9.0

LABEL description="Alpine image with GOSU and TINI" \
      build_ver="2016052901"

RUN export BUILD_DEPS="wget \
                    build-base \
                    ca-certificates \
                    cmake" \
    && apk upgrade -U \
    && apk add ${BUILD_DEPS} \
    && wget https://github.com/krallin/tini/archive/v${TINI_VER}.tar.gz -O /tmp/v${TINI_VER}.tar.gz \
    && tar xzvf /tmp/v${TINI_VER}.tar.gz -C /tmp \
    && wget https://github.com/tianon/gosu/releases/download/${GOSU_VER}/gosu-amd64 -O /usr/bin/gosu \
    && chmod +x /usr/bin/gosu \
    && cd /tmp/tini-${TINI_VER} \
    && cmake . \
    && make \
    && cp tini /usr/bin/tini \
    && cd / \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/*

CMD ["sh"]
