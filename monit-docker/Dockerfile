FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ARG MONIT_VER=5.17.1
ARG BUILD_CORES

RUN export BUILD_DEPS="wget \
                    ca-certificates \
                    build-base \
                    linux-pam-dev \
                    openssl-dev" \
    && apk add -U ${BUILD_DEPS} \
                    linux-pam \
    && NB_CORES=${BUILD_CORES-$(grep -c "processor" /proc/cpuinfo)} \
    && cd /tmp \
    && wget --no-check-certificate https://mmonit.com/monit/dist/monit-${MONIT_VER}.tar.gz \
    && tar xzf monit-${MONIT_VER}.tar.gz \
    && cd /tmp/monit-${MONIT_VER} \
    && ./configure \
    && make -j ${NB_CORES}\
    && make install \
    && apk del ${BUILD_DEPS} \
    && rm -rf /tmp/* /var/cache/apk/*
    
COPY rootfs /

CMD ["tini", "--", "/usr/local/bin/monit", "-I", "-c", "/etc/monit/monitrc"]
