FROM xataz/alpine:3.3-tini
MAINTAINER <https://github.com/xataz>

ENV UID=991 \
    GID=991 \
    REDIS_VER=3.0.7

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
	&& cp src/redis-server /usr/local/bin/redis-server \
	&& apk del ${BUILD_DEPS} \
	&& rm -rf /tmp/* /var/cache/apk/* \
	&& mkdir /var/lib/redis


ADD redis.conf /var/lib/redis/redis.conf
ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["tini","--","startup"]
