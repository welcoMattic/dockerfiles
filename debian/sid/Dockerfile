FROM debian:sid
MAINTAINER xataz <https://github.com/xataz>

ARG TINI_VER=0.9.0
ARG GOSU_VER=1.7

RUN export BUILD_DEPS="wget \
                    ca-certificates" \
    && apt-get update \
    && apt-get install -qq -y --no-install-recommends --no-install-suggests ${BUILD_DEPS} \
    && wget -q https://github.com/krallin/tini/releases/download/v${TINI_VER}/tini_${TINI_VER}.deb -P /tmp \
    && dpkg -i /tmp/tini_${TINI_VER}.deb \
    && apt-get purge -y ${BUILD_DEPS} systemd \
    && apt-get autoremove --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/*

ADD https://github.com/tianon/gosu/releases/download/${GOSU_VER}/gosu-amd64 /usr/bin/gosu
CMD ["tini", "--", "bash"]
