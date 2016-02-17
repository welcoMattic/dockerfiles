FROM xataz/alpine:3.3
MAINTAINER <https://github.com/xataz>

ENV REDIS_VER=unstable

EXPOSE 6379

RUN export BUILD_DEPS="wget \
                    linux-headers \
		    ca-certificates \
		    curl \
		    gcc \
		    libc-dev \
		    make \
		    tar" \
	&& apk add --update ${BUILD_DEPS} \ 
	&& wget https://github.com/antirez/redis/archive/${REDIS_VER}.tar.gz -O /tmp/redis-${REDIS_VER}.tar.gz \
	&& cd /tmp \
	&& tar xzf redis-${REDIS_VER}.tar.gz \
	&& cd redis-${REDIS_VER} \
	&& make \
	&& cp src/redis-cli /usr/local/bin/redis-cli \
	&& apk del ${BUILD_DEPS} \
	&& rm -rf /tmp/* /var/cache/apk/* \
	&& mkdir /var/lib/redis

ENTRYPOINT ["redis-cli"]
CMD ["-h"]
