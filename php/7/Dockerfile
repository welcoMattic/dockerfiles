FROM alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ARG PHP_VER=7.0.11
ARG CORES_BUILD
ARG PHP_MIRROR=http://fr2.php.net
ARG PHP_GPG="1A4E 8B72 77C4 2E53 DBA9  C7B9 BCAA 30EA 9C0D 5763"

ENV UID=991 \
    GID=991

LABEL description="php based on alpine" \
      tags="7.0.11 7.0 7 stable latest" \
      build_ver="$(date +%Y%m%d)"

RUN export BUILD_DEPS="autoconf \
                build-base \
                g++ \
                gcc \
                libc-dev \
                make \
                pkgconf \
                curl-dev \
                libedit-dev \
                libxml2-dev \
                openssl-dev \
                sqlite-dev \
                wget \
                ca-certificates" \
    && apk add -U ${BUILD_DEPS} \
                    curl \
                    libedit \
                    libxml2 \
    && wget ${PHP_MIRROR}/get/php-${PHP_VER}.tar.gz/from/this/mirror -O /tmp/php-${PHP_VER}.tar.gz \
    && mkdir -p /usr/local/etc/php/conf.d \
    && mkdir -p /usr/src \
    && tar xzvf /tmp/php-${PHP_VER}.tar.gz -C /usr/src \
    && mv /usr/src/php-${PHP_VER} /usr/src/php \
    && NB_CORES=${CORES_BUILD-$(grep -c "processor" /proc/cpuinfo)} \
    && cd /usr/src/php \
    && ./configure \
                --enable-fpm \
                --with-fpm-user=php \
                --with-fpm-group=php \
                --with-config-file-path="/usr/local/etc/php" \
                --with-config-file-scan-dir="/usr/local/etc/php/conf.d" \
                --disable-cgi \
                --enable-mysqlnd \
                --enable-mbstring \
                --with-curl \
                --with-libedit \
                --with-openssl \
                --with-zlib \
    && make -j ${NB_CORES} \
    && make install \
    && { find /usr/local/bin /usr/local/sbin -type f -perm +0111 -exec strip --strip-all '{}' + || true; } \
    && make clean \
    && apk del ${BUILD_DEPS} \
    && rm -rf /tmp/* /var/cache/apk/*

COPY docker-php-ext-* /usr/local/bin/
COPY startup /usr/bin/startup
COPY php-fpm.conf /usr/local/etc/php-fpm.conf
RUN chmod +x /usr/bin/startup /usr/local/bin/docker*

WORKDIR /var/www/html

EXPOSE 9000
CMD ["tini", "--", "/usr/bin/startup"]
