FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ARG RUNDECK_VER=2.7.1

LABEL description="rundeck based on alpine" \
      tags="latest" \
      build_ver="2016122301"

RUN BUILD_DEPS="wget" \
    && apk add -U openjdk7-jre \
                    openssl \
                    ca-certificates \
                    ${BUILD_DEPS} \
    && mkdir -p /rundeck/bin \
    && wget http://dl.bintray.com/rundeck/rundeck-maven/rundeck-launcher-${RUNDECK_VER}.jar -O /rundeck/bin/rundeck.jar \
    && apk del ${BUILD_DEPS} \
    && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 4440
ADD rootfs /
RUN chmod +x /usr/local/bin/startup

CMD "java -jar /rundeck/bin/rundeck.jar -b /rundeck/conf"