FROM alpine:3.2
MAINTAINER xataz <https://github.com/xataz/>

ENV JAVA_HOME=/opt/jre

RUN apk add --update wget ca-certificates && \
  cd /tmp && \
  wget "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" \
    "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk" && \
  apk add --allow-untrusted glibc-2.21-r2.apk glibc-bin-2.21-r2.apk && \
  /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
  echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
  mkdir /opt && \
  wget http://www.java.net/download/jdk8u60/archive/b18/binaries/jre-8u60-ea-bin-b18-linux-x64-02_jun_2015.tar.gz -O /tmp/jre.tgz && \
  cd /opt && tar zxvf /tmp/jre.tgz && \
  mv jre1.8.0_60 jre && \
  ln -s /opt/jre/bin/java /usr/bin/java && \
  cd /opt/jre/lib/amd64 && rm libjavafx_* libjfx* libfx* && \
  cd /opt/jre/lib/ && rm -rf ext/jfxrt.jar jfxswt.jar javafx.properties font* && \
  apk del wget ca-certificates && rm /tmp/* /var/cache/apk/*
