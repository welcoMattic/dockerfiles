FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz/>

ENV NODE_VER=v4.2.6 NPM_VER=3

RUN PKGS_BUILD="git \
                wget \
                make \
                gcc \
                g++ \
                python \
                linux-headers \
                paxctl \
                binutils-gold" && \
    apk add --update libgcc libstdc++ ${PKGS_BUILD} && \
    cd /tmp && \
    wget --no-check-certificate https://nodejs.org/dist/${NODE_VER}/node-${NODE_VER}.tar.gz && \
    tar xzf node-${NODE_VER}.tar.gz && \
    cd /tmp/node-${NODE_VER} && \
    NB_CORES=$(grep -c "processor" /proc/cpuinfo) && \
    ./configure --prefix=/usr --without-snapshot && \
    make -j ${NB_CORES} && \
    make install && paxctl -cm /usr/bin/node && \
    npm install -g npm@${NPM_VER} && \
    find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf && \
    cd / && \
    apk del ${PKGS_BUILD} && \
    rm -rf /tmp/* \
        /var/cache/apk/* \
        /root/.npm \
        /root/.node-gyp \
        /usr/lib/node_modules/npm/man \
        /usr/lib/node_modules/npm/doc \
        /usr/lib/node_modules/npm/html \
        /usr/share/man

CMD ["node","-v"]
