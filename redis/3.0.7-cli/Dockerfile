FROM xataz/alpine:3.3
MAINTAINER <https://github.com/xataz>

ENV REDIS_VER=3.0.7

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
	&& NB_CORES=`grep -c "processor" /proc/cpuinfo` \
	&& make -j ${NB_CORES} \
	&& cp src/redis-cli /usr/local/bin/redis-cli \
	&& apk del ${BUILD_DEPS} \
	&& rm -rf /tmp/* /var/cache/apk/* \
	&& mkdir /var/lib/redis

ENTRYPOINT ["redis-cli"]
CMD ["--help"]
