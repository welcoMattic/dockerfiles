FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz/>

ARG FB_VER=4.6.1

LABEL description="Filebot based on alpine" \
      build_ver="2016042601"

RUN export BUILD_DEPS="wget \
                    unzip \
                    ca-certificates" \
    && apk add -U ${BUILD_DEPS} \
                    openjdk8-jre \
    && mkdir -p /opt/filebot \
    && cd /opt/filebot \
    && wget http://downloads.sourceforge.net/project/filebot/filebot/FileBot_${FB_VER}/FileBot_${FB_VER}-portable.zip \
    && unzip FileBot_${FB_VER}-portable.zip \
    && chmod -R 777 /opt/filebot \
    && apk del ${BUILD_DEPS} \
    && rm -rf /opt/filebot/FileBot_${FB_VER}-portable.zip /var/cache/apk/*
