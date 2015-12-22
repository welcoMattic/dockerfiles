FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

EXPOSE 80 443
VOLUME ["/www","/sites-enabled","/conf.d"]
ENV NGINX_VER=1.9.7 UID=991 GID=991

RUN apk add --update openssl-dev pcre-dev zlib-dev wget build-base && \
	cd /tmp && wget http://nginx.org/download/nginx-${NGINX_VER}.tar.gz && \
	tar xzf nginx-${NGINX_VER}.tar.gz && cd /tmp/nginx-${NGINX_VER} && \
	./configure --with-http_ssl_module --with-http_v2_module --with-http_gzip_static_module --with-http_stub_status_module \
        	--prefix=/etc/nginx --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --sbin-path=/usr/local/sbin/nginx \
		--user=www-data --group=www-data && \
	make && make install && \
	apk del build-base openssl-dev pcre-dev zlib-dev wget && apk add openssl pcre zlib && \
    	rm -rf /tmp/* && rm -rf /var/cache/apk/*

ADD startup /usr/bin/startup
ADD nginx.conf /etc/nginx/conf/nginx.conf

RUN chmod +x /usr/bin/startup

CMD ["sh","-c","/usr/bin/startup"]
	
