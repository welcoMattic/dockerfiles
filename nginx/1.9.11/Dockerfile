FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

# ARG NGINX_VER=1.9.11
# ARG BUILD_CORES

ENV UID=991 \
    GID=991 \
    NGINX_VER=1.9.11

RUN export BUILD_DEPS="build-base \
                    openssl-dev \
                    pcre-dev \
                    zlib-dev \
                    wget" \
    && NB_CORES=${BUILD_CORES-$(grep -c "processor" /proc/cpuinfo)} \
    && apk add -U ${BUILD_DEPS} \
    && cd /tmp \
    && wget http://nginx.org/download/nginx-${NGINX_VER}.tar.gz \
    && tar xzf nginx-${NGINX_VER}.tar.gz \
    && cd /tmp/nginx-${NGINX_VER} \
    && ./configure \
            --with-http_ssl_module \
            --with-http_gzip_static_module \
            --with-http_stub_status_module \
            --prefix=/etc/nginx \
            --http-log-path=/var/log/nginx/access.log \
            --error-log-path=/var/log/nginx/error.log \
            --sbin-path=/usr/local/sbin/nginx \
	    --user=www-data --group=www-data \
    && make -j ${NB_CORES} \
    && make install \
    && apk del ${BUILD_DEPS} \
    && apk add openssl pcre zlib \
    && rm -rf /tmp/* /var/cache/apk/*

ADD startup /usr/bin/startup
ADD nginx.conf /etc/nginx/conf/nginx.conf

RUN chmod +x /usr/bin/startup

EXPOSE 8080 8443
VOLUME /sites-enabled /conf.d /ssl

CMD ["tini","--","/usr/bin/startup"]
	
