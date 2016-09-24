FROM alpine:3.4
MAINTAINER xataz <https://github.com/xataz/>

ARG NODE_VER=v6.6.0
ARG NPM_VER=3
ARG CORES_BUILD

LABEL description="nodejs based on alpine" \
      tags="latest 6.6.0 6.6 6" \
      build_ver="2016092301"

ENV UID=991 \
    GID=991

RUN export BUILD_DEPS="git \
                wget \
                make \
                gcc \
                g++ \
                python \
                linux-headers \
                paxctl \
                binutils-gold" \
    && apk add -U libgcc \
                libstdc++ \
                su-exec \
                tini \
                ${BUILD_DEPS} \
    && cd /tmp \
    && wget https://nodejs.org/dist/${NODE_VER}/node-${NODE_VER}.tar.gz \
    && tar xzf node-${NODE_VER}.tar.gz \
    && cd /tmp/node-${NODE_VER} \
    && NB_CORES=${CORES_BUILD-$(grep -c "processor" /proc/cpuinfo)} \
    && ./configure --prefix=/usr \
    && make -j ${NB_CORES} \
    && make install && paxctl -cm /usr/bin/node \
    && npm install -g npm@${NPM_VER} \
    && find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf \
    && strip -s /usr/bin/node \
    && cd / \
    && apk del ${BUILD_DEPS} \
    && rm -rf /tmp/* \
        /var/cache/apk/* \
        /root/.npm \
        /root/.node-gyp \
        /usr/lib/node_modules/npm/man \
        /usr/lib/node_modules/npm/doc \
        /usr/lib/node_modules/npm/html \
        /usr/share/man

COPY startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["-v"]
