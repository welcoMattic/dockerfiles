FROM debian:sid
MAINTAINER xataz <https://github.com/xataz>

ARG TINI_VER=0.9.0
ARG SUEXEC_VER=0.2

LABEL description="Debian with TINI and su-exec" \
      tags="unstable sid" \
      build_ver="2016092301"

RUN export BUILD_DEPS="wget \
                    ca-certificates \
                    git \
                    gcc \
                    libc6-dev" \
    && apt-get update -qq \
    && apt-get upgrade -qq -y \
    && apt-get install -qq -y --no-install-recommends --no-install-suggests ${BUILD_DEPS} \
    && wget -q https://github.com/krallin/tini/releases/download/v${TINI_VER}/tini_${TINI_VER}.deb -P /tmp \
    && git clone -b v${SUEXEC_VER} https://github.com/ncopa/su-exec /tmp/su-exec \
    && gcc -Wall -Werror -g -o /usr/local/bin/su-exec /tmp/su-exec/su-exec.c \
    && dpkg -i /tmp/tini_${TINI_VER}.deb \
    && apt-get purge -qq -y ${BUILD_DEPS} \
    && apt-get autoremove --purge -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/*

CMD ["tini", "--", "bash"]
