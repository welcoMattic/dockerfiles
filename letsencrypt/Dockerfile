FROM xataz/alpine:3.5
MAINTAINER xataz <https://github.com/xataz>

ARG CERTBOT_VER=v0.9.3

LABEL description="Letsencrypt based on alpine" \
      tags="latest 0.9.3 0.9" \
      build_ver="2016122801"

RUN BUILD_DEPS="py2-pip \
            gcc \
            musl-dev \
            python2-dev \
            libffi-dev \
            openssl-dev" \
    && apk add -U ${BUILD_DEPS} \
        py-pip \
        tini \
        dialog \
        python \
    && pip install --no-cache virtualenv \
    && virtualenv --no-site-packages -p python2 /usr/certbot/venv \
    && /usr/certbot/venv/bin/pip install --no-cache-dir certbot==${CERTBOT_VER} \
    && pip uninstall --no-cache-dir -y virtualenv \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /root/.cache/pip

EXPOSE 80 443
VOLUME /etc/letsencrypt/

ENTRYPOINT ["/sbin/tini","--","/usr/certbot/venv/bin/certbot"]
CMD ["--help"]
