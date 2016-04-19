FROM debian:jessie
MAINTAINER xataz <https://github.com/xataz>

ARG TINI_VER=0.9.0
ARG GOSU_VER=1.7

LABEL description="Debian with TINI and GOSU" \
      build_ver="2016041901"

RUN export BUILD_DEPS="wget \
                    ca-certificates" \
    && apt-get update -qq \
    && apt-get install -qq -y --no-install-recommends --no-install-suggests ${BUILD_DEPS} \
    && wget -q https://github.com/krallin/tini/releases/download/v${TINI_VER}/tini_${TINI_VER}.deb -P /tmp \
    && dpkg -i /tmp/tini_${TINI_VER}.deb \
    && apt-get purge -qq -y ${BUILD_DEPS} \
    && apt-get autoremove --purge -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/*

ADD https://github.com/tianon/gosu/releases/download/${GOSU_VER}/gosu-amd64 /usr/bin/gosu
RUN chmod +x /usr/bin/gosu

CMD ["tini", "--", "bash"]
