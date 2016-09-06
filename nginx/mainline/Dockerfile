FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

LABEL Description="nginx based on alpine" \
      tags="latest mainline 1.11.3 1.11" \
      build_ver="2016090601"

ARG NGINX_VER=1.11.3
ARG NGINX_GPG="B0F4253373F8F6F510D42178520A9993A1C052F8"
ARG BUILD_CORES
ARG NGINX_CONF="--prefix=/etc/nginx \
                --sbin-path=/usr/local/sbin/nginx \
                --http-log-path=/nginx/log/nginx_access.log \
                --error-log-path=/nginx/log/nginx_error.log \
                --pid-path=/nginx/run/nginx.pid \
                --lock-path=/nginx/run/nginx.lock \
                --user=web --group=web \
                --with-http_ssl_module \
                --with-http_realip_module \
                --with-http_addition_module \
                --with-http_sub_module \
                --with-http_dav_module \
                --with-http_flv_module \
                --with-http_mp4_module \
                --with-http_gunzip_module \
                --with-http_gzip_static_module \
                --with-http_random_index_module \
                --with-http_secure_link_module \
                --with-http_stub_status_module \
                --with-threads \
                --with-stream \
                --with-stream_ssl_module \
                --with-http_slice_module \
                --with-mail \
                --with-mail_ssl_module \
                --with-http_v2_module \
                --with-ipv6"

ENV UID=991 \
    GID=991

RUN export BUILD_DEPS="build-base \
                    openssl-dev \
                    pcre-dev \
                    zlib-dev \
                    wget \
                    gnupg " \
    && NB_CORES=${BUILD_CORES-$(grep -c "processor" /proc/cpuinfo)} \
    && apk add -U ${BUILD_DEPS} \
    && cd /tmp \
    && wget http://nginx.org/download/nginx-${NGINX_VER}.tar.gz \
    && wget http://nginx.org/download/nginx-${NGINX_VER}.tar.gz.asc \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$NGINX_GPG" \
	&& gpg --batch --verify nginx-${NGINX_VER}.tar.gz.asc nginx-${NGINX_VER}.tar.gz \
    && tar xzf nginx-${NGINX_VER}.tar.gz \
    && cd /tmp/nginx-${NGINX_VER} \
    && ./configure ${NGINX_CONF} \            
    && make -j ${NB_CORES} \
    && make install \
    && apk del ${BUILD_DEPS} \
    && apk add openssl pcre zlib \
    && rm -rf /tmp/* /var/cache/apk/*

COPY startup /usr/bin/startup
COPY nginx.conf /etc/nginx/conf/nginx.conf
RUN chmod +x /usr/bin/startup

RUN chmod +x /usr/bin/startup

EXPOSE 8080 8443

CMD ["tini","--","/usr/bin/startup"]
