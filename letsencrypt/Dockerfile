FROM alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ARG CERTBOT_VER="0.8.1"

WORKDIR /certbot
ENV PATH /certbot/venv/bin:$PATH

LABEL description="Letsencrypt based on alpine" \
      tags="latest" \
      build_ver="2016092301"

RUN export BUILD_DEPS="build-base \
                libffi-dev \
                linux-headers \
                openssl-dev \
                py-pip \
                python-dev" \
    && apk add -U dialog \
                python \
                augeas-libs \
                tini \
                ${BUILD_DEPS} \
    && pip --no-cache-dir install certbot==${CERTBOT_VER} \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/*

EXPOSE 80 443
VOLUME /etc/letsencrypt/

ENTRYPOINT ["/sbin/tini","--","certbot"]
CMD ["--help"]
