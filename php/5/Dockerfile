FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ARG PHP_VER=5.6.21
ARG CORES_BUILD
ARG PHP_MIRROR=http://fr2.php.net

ENV UID=991 \
    GID=991 \
    PHP_INI_DIR=/usr/local/etc/php

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
                ca-certificates \
                curl" \
    && apk add -U ${BUILD_DEPS} \
    && wget ${PHP_MIRROR}/get/php-${PHP_VER}.tar.gz/from/this/mirror -O /tmp/php-${PHP_VER}.tar.gz \
    && mkdir -p ${PHP_INI_DIR}/conf.d \
    && mkdir -p /usr/src \
    && tar xzvf /tmp/php-${PHP_VER}.tar.gz -C /usr/src \
    && mv /usr/src/php-${PHP_VER} /usr/src/php \
    && NB_CORES=${CORES_BUILD-$(grep -c "processor" /proc/cpuinfo)} \
    && cd /usr/src/php \
    && ./configure \
                --enable-fpm \
                --with-fpm-user=www-data \
                --with-fpm-group=www-data \
                --with-config-file-path="$PHP_INI_DIR" \
                --with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
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

WORKDIR /var/www/html

EXPOSE 9000
CMD ["php-fpm"]
