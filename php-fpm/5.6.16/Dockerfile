FROM alpine:3.2
MAINTAINER xataz <https://github.com/xataz>

ENV PHP_VER=5.6.16 UID=991 GID=991

VOLUME /www

RUN PKG_BUILD="wget build-base curl-dev openssl-dev libxml2-dev readline-dev zlib-dev" && \
        apk add --update libxml2 curl ${PKG_BUILD} bash && \
        mkdir -p /usr/src/ && cd /tmp && \
        wget http://fr2.php.net/distributions/php-${PHP_VER}.tar.gz && \
        cd /tmp && tar -xzf php-${PHP_VER}.tar.gz -C /usr/src/ && mv /usr/src/php-${PHP_VER} /usr/src/php && \
        cd /usr/src/php && mkdir -p /usr/local/etc/php/conf.d && \
        ./configure \
                --with-config-file-path="/usr/local/etc/php" \
                --with-config-file-scan-dir="/usr/local/etc/php/conf.d" \
                --enable-fpm \
                --with-fpm-user=www-data \
                --with-fpm-group=www-data \
                --disable-cgi \
                --enable-mysqlnd \
                --with-curl \
                --with-openssl \
                --with-readline \
                --with-zlib && \
        make && make install && \
        apk del ${PKG_BUILD} && rm -rf /var/cache/apk/* /usr/src/php && \
        adduser -H -s /bin/bash -D -u 82 -G www-data www-data


ADD docker-php-ext-* /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-php-ext-*

ADD php-fpm.conf /usr/local/etc/php-fpm.conf
ADD www.conf /usr/local/etc/php-fpm.d/www.conf
ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["startup"]
