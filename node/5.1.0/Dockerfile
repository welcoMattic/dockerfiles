FROM alpine:3.2
MAINTAINER xataz <https://github.com/xataz/>

ENV NODE_VER=v5.1.0 NPM_VER=3

RUN apk add --update git wget make gcc g++ python linux-headers paxctl libgcc libstdc++ && \
	cd /tmp && wget --no-check-certificate https://nodejs.org/dist/${NODE_VER}/node-${NODE_VER}.tar.gz && \
	tar xzf node-${NODE_VER}.tar.gz && cd /tmp/node-${NODE_VER} && \
	./configure --prefix=/usr && make && make install && paxctl -cm /usr/bin/node && \
	npm install -g npm@${NPM_VER} && find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf && \
	cd / && apk del git wget make gcc g++ python linux-headers paxctl libgcc libstdc++ && \
	rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /usr/lib/node_modules/npm/man \
	/usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /usr/share/man

CMD ["node","-v"]
