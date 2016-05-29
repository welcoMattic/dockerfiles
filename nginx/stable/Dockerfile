FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ARG NGINX_VER=1.10.0
ARG LIBRESSL_VER=2.3.3
ARG BUILD_CORES

ENV UID=991 \
    GID=991

LABEL description="nginx based on alpine" \
      build_ver="2016052901"

RUN export BUILD_DEPS="build-base \
                    openssl-dev \
                    pcre-dev \
                    zlib-dev \
                    wget \
                    tar \
                    ca-certificates \
                    automake \
                    autoconf \
                    linux-headers \
                    binutils" \
    && NB_CORES=${BUILD_CORES-$(grep -c "processor" /proc/cpuinfo)} \
    && apk add -U ${BUILD_DEPS} \
                openssl \
                pcre \
                zlib \
    && cd /tmp \
    && wget http://nginx.org/download/nginx-${NGINX_VER}.tar.gz \
    && wget http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${LIBRESSL_VER}.tar.gz \
    && tar xzvf libressl-${LIBRESSL_VER}.tar.gz  \
    && tar xzf nginx-${NGINX_VER}.tar.gz \
    && cd /tmp/libressl-${LIBRESSL_VER} \
    && ./configure \
        LDFLAGS=-lrt \
        CFLAGS=-fstack-protector-strong \
        --prefix=/tmp/libressl-${LIBRESSL_VER}/.openssl/ \
        --enable-shared=no \
    && make install-strip -j $NB_CORES \
    && cd /tmp/nginx-${NGINX_VER} \
    && ./configure \
            --with-http_v2_module \
            --with-http_ssl_module \
            --with-http_gzip_static_module \
            --with-http_stub_status_module \
            --with-openssl=/tmp/libressl-${LIBRESSL_VER} \
            --with-ld-opt="-lrt" \
            --prefix=/etc/nginx \
            --http-log-path=/tmp/nginx_access.log \
            --error-log-path=/tmp/nginx_error.log \
            --sbin-path=/usr/local/sbin/nginx \
            --user=web \
            --group=web \
            --with-mail \
            --with-threads \
            --with-file-aio \
    && make -j ${NB_CORES} \
    && make install \
    && apk del ${BUILD_DEPS} \
    && rm -rf /tmp/* /var/cache/apk/*

COPY startup /usr/bin/startup
COPY nginx.conf /etc/nginx/conf/nginx.conf

RUN chmod +x /usr/bin/startup

EXPOSE 8080 8443

CMD ["tini","--","/usr/bin/startup"]
	
