FROM xataz/php:7.0.0RC7-fpm

RUN apk add --update freetype-dev libjpeg-turbo-dev curl-dev && \
	docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include && \
	docker-php-ext-install gd mysqli mbstring pdo_mysql && \
	apk del freetype-dev libjpeg-turbo-dev curl-dev && rm -rf /var/cache/apk/*
