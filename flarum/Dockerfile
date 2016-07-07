FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ENV GID=991 UID=991

LABEL Description="flarum based on alpine with nginx and php7" \
      tags="beta latest" \
      build_ver="2016070503"

RUN echo "@testing https://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && export BUILD_DEPS="git" \
    && apk --no-cache add nginx \
            curl \
            php7-phar@testing \
            supervisor \
            php7-fpm@testing \
            php7-curl@testing \
            php7-mbstring@testing \
            php7-openssl@testing \
            php7-json@testing \
            php7-pdo_mysql@testing \
            php7-gd@testing \
            php7-dom@testing \
            ${BUILD_DEPS} \
    && cd /tmp \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && curl -s http://getcomposer.org/installer | php \
    && mv /tmp/composer.phar /usr/bin/composer \
    && chmod +x /usr/bin/composer \
    && git clone -b v0.1.0-beta.5 https://github.com/flarum/flarum /flarum \
    && cd /flarum \
    && composer install \
    && composer clear-cache \
    && rm -rf /root/.composer/cache/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

EXPOSE 8080
CMD ["/usr/bin/tini","--","startup"]
