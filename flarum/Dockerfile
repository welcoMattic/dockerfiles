FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ENV GID=991 UID=991

LABEL Description="flarum based on alpine with nginx and php7" \
      tags="beta latest" \
      build_ver="2016070501"

RUN BUILD_DEPS="curl \
                php7-phar@testing \
                php7@testing" \
    && echo "@testing https://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk -U add ${BUILD_DEPS} \
            nginx \
            supervisor \
            php7-fpm@testing \
            php7-curl@testing \
            php7-mbstring@testing \
            php7-openssl@testing \
            php7-json@testing \
            php7-pdo_mysql@testing \
            php7-gd@testing \
            php7-dom@testing \
    && cd /tmp/ \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && curl -s http://getcomposer.org/installer | php \
    && mv /tmp/composer.phar /usr/bin/composer \
    && chmod +x /usr/bin/composer \
    && mkdir /flarum \
    && composer create-project flarum/flarum /flarum --stability=beta \
    && apk del ${BUILD_DEPS} \
    && rm -rf /tmp/* /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

EXPOSE 8080
CMD ["/usr/bin/tini","--","startup"]
