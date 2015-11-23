FROM alpine:3.2
MAINTAINER <https://github.com/xataz>

ENV UID=991 GID=991 REDIS_VER=3.0.5

RUN apk add --update build-base wget && \ 
	cd /tmp && wget http://download.redis.io/releases/redis-${REDIS_VER}.tar.gz && \
	cd /tmp/redis-${REDIS_VER} && make && make install && \
	apk del build-base wget && rm -rf /var/cache/apk/* /tmp/*

ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["startup"]
