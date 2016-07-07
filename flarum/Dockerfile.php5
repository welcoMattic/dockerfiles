FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ARG GID=991
ARG UID=991

LABEL Description="flarum based on alpine with nginx and php5" \
      tags="beta latest" \
      build_ver="2016070503"

RUN export BUILD_DEPS="git" \
    && apk --no-cache add nginx \
            curl \
            php5-phar \
            supervisor \
            php5-fpm \
            php5-curl \
            php5-openssl \
            php5-json \
            php5-pdo_mysql \
            php5-gd \
            php5-dom \
            ${BUILD_DEPS} \
    && cd /tmp \
    && curl -s http://getcomposer.org/installer | php \
    && mv /tmp/composer.phar /usr/bin/composer \
    && chmod +x /usr/bin/composer \
    && mkdir /flarum \
    && addgroup -g ${GID} flarum && adduser -h /flarum -s /bin/sh -D -G flarum -u ${UID} flarum \
    && chown flarum:flarum /flarum \
    && su-exec flarum:flarum composer create-project flarum/flarum /flarum/app --stability=beta \
    && composer clear-cache \
    && rm -rf /flarum/.composer/cache/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php5/php-fpm.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

EXPOSE 8080
CMD ["/usr/bin/tini","--","startup"]
