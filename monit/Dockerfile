FROM alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ARG MONIT_VER=5.19.0
ARG BUILD_CORES

LABEL description="Monit based on alpine" \
      tags="5.19.0 5.19 5 latest" \
      build_ver="$(date +%Y%m%d)"

RUN export BUILD_DEPS="wget \
                    ca-certificates \
                    build-base \
                    linux-pam-dev \
                    openssl-dev \
                    bash" \
    && echo "@comuedge http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories \
    && echo "@mainedge http://dl-4.alpinelinux.org/alpine/edge/main/" >> /etc/apk/repositories \
    && apk add -U ${BUILD_DEPS} \
                    linux-pam \
                    docker@comuedge \
                    bash \
                    libseccomp@mainedge \
    && NB_CORES=${BUILD_CORES-$(grep -c "processor" /proc/cpuinfo)} \
    && cd /tmp \
    && wget https://mmonit.com/monit/dist/monit-${MONIT_VER}.tar.gz \
    && tar xzf monit-${MONIT_VER}.tar.gz \
    && cd /tmp/monit-${MONIT_VER} \
    && ./configure \
    && make -j ${NB_CORES} \
    && make install \
    && apk del ${BUILD_DEPS} \
                libseccomp-dev \
    && rm -rf /tmp/* /var/cache/apk/*
    
COPY monitrc /etc/monit/monitrc
COPY check_container /opt/check_container
RUN chmod 700 /etc/monit/monitrc \
    && chmod +x /opt/check_container

CMD ["tini", "--", "/usr/local/bin/monit", "-I", "-c", "/etc/monit/monitrc"]
