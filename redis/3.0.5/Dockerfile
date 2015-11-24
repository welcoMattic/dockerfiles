FROM alpine:3.2
MAINTAINER <https://github.com/xataz>

ENV UID=991 GID=991 REDIS_VER=3.0.5

EXPOSE 6379

RUN PKG_BUILD="wget linux-headers ca-certificates curl gcc libc-dev make tar" && \
	apk add --update ${PKG_BUILD} && \ 
	cd /tmp && wget http://download.redis.io/releases/redis-${REDIS_VER}.tar.gz && \
	tar xzf redis-${REDIS_VER}.tar.gz && cd redis-${REDIS_VER} && \
	make && cp src/redis-server /usr/local/bin/redis-server && \
	apk del ${PKG_BUILD} && rm -rf /tmp/* /var/cache/apk/* && \
	mkdir /var/lib/redis


ADD redis.conf /var/lib/redis/redis.conf
ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["startup"]
