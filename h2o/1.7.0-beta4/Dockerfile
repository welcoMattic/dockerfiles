FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ENV H2O_VER=1.7.0-beta4

RUN BUILD_DEPS="build-base cmake wget openssl-dev linux-headers" && \
	apk add -U ${BUILD_DEPS} \
		openssl && \
	cd /tmp && \
	wget https://github.com/h2o/h2o/archive/v${H2O_VER}.tar.gz && \
	tar xzf v${H2O_VER}.tar.gz && \
	cd /tmp/h2o-${H2O_VER} && \
	NB_CORES=$(grep -c "processor" /proc/cpuinfo) && \
	cmake -DWITH_BUNDLED_SSL=on -DCMAKE_INSTALL_PREFIX=/usr/local/h2o . && \
	make -j ${NB_CORES} && \
	make install && \
	cd / && \
	ln -s /usr/local/h2o/bin/h2o /usr/bin/h2o && \
	apk del ${BUILD_DEPS} && \
	rm -rf /tmp/* /var/cache/apk/*
