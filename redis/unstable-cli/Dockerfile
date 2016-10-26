FROM alpine:3.4
MAINTAINER <https://github.com/xataz>

ENV REDIS_VER=unstable \
	UID=991 \
	GID=991 

EXPOSE 6379

LABEL description="redis based on alpine" \
      tags="unstable-cli" \
      build_ver="2016102601"

RUN export BUILD_DEPS="wget \
                    linux-headers \
		    ca-certificates \
		    curl \
		    gcc \
		    libc-dev \
		    make \
		    tar" \
	&& apk add --update ${BUILD_DEPS} \
						tini \
						su-exec \
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

COPY startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["--help"]
