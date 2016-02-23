FROM xataz/nginx:1.9.11
MAINTAINER xataz <https://github.com/xataz>

# ARG BUILD_CORES

ENV PHP_VER=7.0.3 \
    UID=991 \
    GID=991 

VOLUME /www

RUN BUILD_DEPS="wget \
            build-base \
            curl-dev \
            openssl-dev \
            libxml2-dev \
            readline-dev \
            zlib-dev \
            freetype-dev \
            libjpeg-turbo-dev \
            curl-dev \
            bzip2-dev \
            gettext-dev \
            openldap-dev \
            libmcrypt-dev \
            libxslt-dev" \
    && apk add -U libxml2 \
                    curl \
                    ${BUILD_DEPS} \
                    bash \
                    gzip \
    && NB_CORES=${BUILD_CORES-$(grep -c "processor" /proc/cpuinfo)} \
    && mkdir -p /usr/src/ \
    && cd /tmp \
    && wget http://be2.php.net/distributions/php-${PHP_VER}.tar.gz \
    && cd /tmp \
    && tar -xzf php-${PHP_VER}.tar.gz -C /usr/src/ \
    && mv /usr/src/php-${PHP_VER} /usr/src/php \
    && cd /usr/src/php \
    && mkdir -p /usr/local/etc/php/conf.d \
    && ./configure \
            --enable-fpm \
            --enable-pdo \
            --with-pdo-mysql \
            --enable-sockets \
            --enable-exif \
            --enable-soap \
            --enable-ftp \
            --enable-wddx \
            --enable-pcntl \
            --enable-soap \
            --enable-bcmath \
            --enable-mbstring \
            --enable-dba \
            --enable-gd-native-ttf \
            --enable-zip \
            --enable-calendar \
            --with-mysql \
            --with-mysqli \
            --with-pdo-sqlite \
            --with-iconv \
            --with-zlib \
            --with-bz2 \
            --with-gettext \
            --with-xmlrpc \
            --with-openssl \
            --with-mhash \
            --with-mcrypt \
            --with-xsl \
            --with-curl \
            --with-pcre-regex \
            --with-gd \
            --with-freetype-dir=/usr \
            --with-jpeg-dir=/usr \
            --with-png-dir=/usr \
            --with-ldap \
            --with-pear \
            --with-fpm-user=web \
            --with-fpm-group=web \
            --with-config-file-path=/etc/php/ \
            --with-config-file-scan-dir=/etc/php/conf.d/ \ 
    && make -j ${NB_CORES} \
    && make install \
    && apk del ${PKG_BUILD} \
    && rm -rf /var/cache/apk/* /usr/src/php /tmp/*


ADD php-fpm.conf /etc/php-fpm.conf
ADD www.conf /etc/php-fpm.d/www.conf
ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["tini", "--", "startup"]
