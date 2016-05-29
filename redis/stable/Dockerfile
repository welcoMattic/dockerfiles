FROM xataz/alpine:3.3
MAINTAINER <https://github.com/xataz>

ENV UID=991 \
    GID=991 \
    REDIS_VER=3.2.0

EXPOSE 6379

LABEL description="redis based on alpine" \
      tags="latest stable 3.2.0 3.2 3" \
      build_ver="2016052901"

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
	&& cp src/redis-server /usr/local/bin/redis-server \
	&& apk del ${BUILD_DEPS} \
	&& rm -rf /tmp/* /var/cache/apk/* \
	&& mkdir /var/lib/redis


ADD redis.conf /var/lib/redis/redis.conf
ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["tini","--","startup"]
