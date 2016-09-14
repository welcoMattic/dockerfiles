FROM alpine:edge
MAINTAINER xataz <https://github.com/xataz>

ARG TINI_VER=0.9.0

LABEL description="Alpine image with GOSU and TINI" \
      tags="edge" \
      build_ver="2016072701"

RUN export BUILD_DEPS="wget \
                    build-base \
                    ca-certificates \
                    cmake" \
    && apk upgrade -U --no-cache \
    && apk add -U --no-cache ${BUILD_DEPS} \
                              su-exec \
    && wget https://github.com/krallin/tini/archive/v${TINI_VER}.tar.gz -O /tmp/v${TINI_VER}.tar.gz \
    && tar xzvf /tmp/v${TINI_VER}.tar.gz -C /tmp \
    && cd /tmp/tini-${TINI_VER} \
    && cmake . \
    && make \
    && cp tini /usr/bin/tini \
    && cd / \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/* \
    && ln -s $(which su-exec) /usr/local/bin/gosu

CMD ["sh"]
