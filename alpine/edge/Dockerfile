FROM alpine:edge
MAINTAINER xataz <https://github.com/xataz>

ARG GOSU_VER=1.7
ARG TINI_VER=0.9.0

LABEL description="Alpine image with GOSU and TINI" \
      build_ver="2016041901"

RUN export BUILD_DEPS="wget \
                    build-base \
                    ca-certificates \
                    cmake" \
    && apk add -U ${BUILD_DEPS} \
    && wget https://github.com/krallin/tini/archive/v${TINI_VER}.tar.gz -O /tmp/v${TINI_VER}.tar.gz \
    && tar xzvf /tmp/v${TINI_VER}.tar.gz -C /tmp \
    && cd /tmp/tini-${TINI_VER} \
    && cmake . \
    && make \
    && cp tini /usr/bin/tini \
    && cd / \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/*

ADD https://github.com/tianon/gosu/releases/download/${GOSU_VER}/gosu-amd64 /usr/bin/gosu
RUN chmod +x /usr/bin/gosu

CMD ["sh"]
