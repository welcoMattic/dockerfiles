FROM alpine:3.2
MAINTAINER <https://github.com/xataz>

ENV UID=991 GID=991 REDIS_VER=unstable

EXPOSE 6379

RUN PKG_BUILD="git linux-headers ca-certificates curl gcc libc-dev make tar" && \
	apk add --update ${PKG_BUILD} && \ 
	cd /tmp && git clone https://github.com/antirez/redis.git && \
	cd redis && git checkout unstable && \
	make && cp src/redis-cli /usr/local/bin/redis-cli && \
	apk del ${PKG_BUILD} && rm -rf /tmp/* /var/cache/apk/* && \
	mkdir /var/lib/redis


ENTRYPOINT ["redis-cli"]
CMD ["-h"]
