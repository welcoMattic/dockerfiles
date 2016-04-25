FROM xataz/glibc:2.23
MAINTAINER xataz <https://github.com/xataz>

LABEL description="mono based on alpine" \
      build_ver="2016042601"

RUN export BUILD_DEPS="tar \
                    xz \
                    ca-certificates \
                    wget " \
    && apk add -U ${BUILD_DEPS} \
    && wget https://www.archlinux.org/packages/extra/x86_64/mono/download/ -O /tmp/mono.pkg.tar.xz \
    && tar xJf /tmp/mono.pkg.tar.xz \
    && mozroots --import --ask-remove \
    && apk del ${BUILD_DEPS} \
    && rm -rf /tmp/* /var/cache/apk/*
