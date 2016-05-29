FROM xataz/glibc:2.23
MAINTAINER xataz <https://github.com/xataz/>

ARG JAVA_VERSION=8u92-b14

LABEL description="Java based on alpine" \
      tags="latest 8u92-b14 8" \
      build_ver="2016052901"

ENV JAVA_HOME=/opt/jre \
    FOLDER_TMP=jre1.8.0_92

RUN export BUILD_DEPS="wget \
			ca-certificates" \
    && apk add -U ${BUILD_DEPS} \
    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    && mkdir /opt \
    && wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}/jre-$(echo ${JAVA_VERSION} | cut -d- -f1)-linux-x64.tar.gz -O /tmp/jre.tgz \
    && cd /opt \
    && tar zxvf /tmp/jre.tgz \
    && mv ${FOLDER_TMP} jre \
    && ln -s /opt/jre/bin/java /usr/bin/java \
    && cd /opt/jre/lib/amd64 \
    && rm libjavafx_* libjfx* libfx* \
    && cd /opt/jre/lib/ \
    && rm -rf ext/jfxrt.jar jfxswt.jar javafx.properties font* \
    && apk del ${BUILD_DEPS} \
    && rm /tmp/* /var/cache/apk/*
