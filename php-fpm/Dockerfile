FROM alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ARG PHP_VER=7.0.13
ARG PHP_MIRROR=http://fr2.php.net
ARG PHP_GPG="1A4E8B7277C42E53DBA9C7B9BCAA30EA9C0D5763"
ARG PHP_CONF="--enable-fpm \
                --with-fpm-user=web \
                --with-fpm-group=web \
                --with-config-file-path="/php" \
                --with-config-file-scan-dir="/php/conf.d" \
                --disable-cgi \
                --enable-mysqlnd \
                --enable-mbstring \
                --with-curl \
                --with-libedit \
                --with-openssl \
                --with-zlib"
ARG PHP_EXT_LIST
ARG CUSTOM_BUILD_PKGS
ARG CUSTOM_PKGS
ARG CORES_BUILD

ENV UID=991 \
    GID=991

LABEL description="php based on alpine" \
      tags="7.0.13 7.0 7 stable latest" \
      build_ver="2016111601"

COPY docker-php-ext-* /usr/local/bin/

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
                ${CUSTOM_BUILD_PKGS}" \
    && apk add -U ${BUILD_DEPS} \
                    curl \
                    libedit \
                    libxml2 \
                    ${CUSTOM_PKGS} \
    && wget ${PHP_MIRROR}/get/php-${PHP_VER}.tar.gz/from/this/mirror -O /tmp/php-${PHP_VER}.tar.gz \
    && mkdir -p /php/php-fpm.d /php/conf.d/ \
    && mkdir -p /usr/src \
    && tar xzvf /tmp/php-${PHP_VER}.tar.gz -C /usr/src \
    && mv /usr/src/php-${PHP_VER} /usr/src/php \
    && NB_CORES=${CORES_BUILD-$(grep -c "processor" /proc/cpuinfo)} \
    && cd /usr/src/php \
    && ./configure ${PHP_CONF} \
    && make -j ${NB_CORES} \
    && make install \
    && { find /usr/local/bin /usr/local/sbin -type f -perm +0111 -exec strip --strip-all '{}' + || true; } \
    && chmod +x /usr/local/bin/docker-php-ext-* \
    && make clean \
    && if [ "${PHP_EXT_LIST}" != "" ]; then docker-php-ext-install ${PHP_EXT_LIST}; fi \
    && apk del ${BUILD_DEPS} ${CUSTOM_BUILD_PKGS} \
    && rm -rf /tmp/* /var/cache/apk/* /usr/src

COPY startup /usr/local/bin/startup
COPY php-fpm.conf /usr/local/etc/php-fpm.conf
RUN chmod +x /usr/local/bin/startup /usr/local/bin/docker*

WORKDIR /var/www/html

EXPOSE 9000
ENTRYPOINT ["/usr/local/bin/startup"]
