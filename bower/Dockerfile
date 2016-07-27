FROM xataz/node:6
MAINTAINER xataz <https://github.com/xataz>

ENV UID=991 \
    GID=991

LABEL description="bower based on alpine" \
      tags="latest" \
      build_ver="2016072701"

RUN apk add -U git \
        make \
        gcc \
        g++ \
        python \
        linux-headers \
    && npm install -g bower \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["su-exec", "${UID}:${GID}", "bower"]
CMD ["-v"]
