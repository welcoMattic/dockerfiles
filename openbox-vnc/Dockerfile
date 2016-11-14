FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ENV USER=alpine \
    PASSWORD=alpine \
    UID=1000 \
    GID=1000 \
    DEF_SCREEN=1920x1080

LABEL description="vnc with openbox based on alpine" \
      tags="latest" \
      build_ver="2016111401"

RUN export BUILD_DEPS="build-base \
                        git \
                        autoconf \
                        automake \
                        libx11-dev \
                        libvncserver-dev" \
    && apk add -U ${BUILD_DEPS} \
                s6 \
                su-exec \
                xvfb \
                openbox \
                sudo \
                libvncserver \
                lxterminal \
                pcmanfm \
                midori \
                libxi \
                libxtst \
    && git clone -b 0.9.14 https://github.com/LibVNC/x11vnc /usr/src/x11vnc \
    && cd /usr/src/x11vnc \
    && aclocal \
    && autoconf \
    && autoheader \
    && automake --force-missing --add-missing \
    && ./configure --prefix=/usr/local \
                    --exec-prefix=/usr/local \
    && make \
    && make install \
    && apk del ${BUILD_DEPS} \
    && cd / \
    && rm -rf /var/cache/apk/* /usr/src

ADD rootfs /
RUN chmod +x /usr/local/bin/startup /etc/s6.d/*/*
EXPOSE 5900

ENTRYPOINT ["/usr/local/bin/startup"]