FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ARG PHP_VER=7.0.7
ARG CORES_BUILD
ARG PHP_MIRROR=http://fr2.php.net

ENV UID=991 \
    GID=991

LABEL description="php based on alpine" \
      tags="7.0.7 7.0 7 stable latest" \
      build_ver="2016052901"

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
