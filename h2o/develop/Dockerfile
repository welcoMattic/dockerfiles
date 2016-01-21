FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

RUN BUILD_DEPS="build-base cmake git openssl-dev linux-headers" && \
	apk add -U ${BUILD_DEPS} \
		openssl && \
	cd /tmp && \
	git clone https://github.com/h2o/h2o.git && \
	cd /tmp/h2o && \
	NB_CORES=$(grep -c "processor" /proc/cpuinfo) && \
	cmake -DWITH_BUNDLED_SSL=on -DCMAKE_INSTALL_PREFIX=/usr/local/h2o . && \
	make -j ${NB_CORES} && \
	make install && \
	cd / && \
	ln -s /usr/local/h2o/bin/h2o /usr/bin/h2o && \
	apk del ${BUILD_DEPS} && \
	rm -rf /tmp/* /var/cache/apk/*
