FROM alpine:3.2
MAINTAINER <https://github.com/xataz>

ENV UID=991 GID=991 REDIS_VER=3.0.5

RUN apk add --update build-base wget linux-headers tcl-dev && \ 
	cd /tmp && wget http://download.redis.io/releases/redis-${REDIS_VER}.tar.gz && \
	tar xzf redis-${REDIS_VER}.tar.gz
RUN	cd /tmp/redis-${REDIS_VER} && make 
RUN	cd /tmp/redis-${REDIS_VER} && make test
RUN	cd /tmp/redis-${REDIS_VER} && make install
RUN	cd /tmp/redis-${REDIS_VER} && ls
RUN	apk del build-base wget linux-headers tcl-dev && rm -rf /var/cache/apk/* /tmp/*

ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["startup"]
