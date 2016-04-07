FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz/>

ARG JAVA_VERSION=8u77-b03
ARG GLIBC_VER=2.23-r1

ENV JAVA_HOME=/opt/jre \
    FOLDER_TMP=jre1.8.0_77 \
    GLIBC_URL=https://github.com/andyshinn/alpine-pkg-glibc/releases/download/unreleased 

RUN export BUILD_DEPS="wget \
			ca-certificates" \
    && apk add -U ${BUILD_DEPS} \
    && wget --no-check-certificate ${GLIBC_URL}/glibc-${GLIBC_VER}.apk -O /tmp/glibc-${GLIBC_VER}.apk \
    && wget --no-check-certificate ${GLIBC_URL}/glibc-bin-${GLIBC_VER}.apk -O /tmp/glibc-bin-${GLIBC_VER}.apk \
    && apk add --allow-untrusted /tmp/glibc-${GLIBC_VER}.apk \
                                    /tmp/glibc-bin-${GLIBC_VER}.apk \
    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    && mkdir /opt \
    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
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
