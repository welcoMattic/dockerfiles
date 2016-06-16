FROM xataz/node:6
MAINTAINER xataz <https://github.com/xataz>

ENV UID=991 \
    GID=991

LABEL description="bower based on alpine" \
      tags="latest" \
      build_ver="2016060301"

RUN apk add -U git \
        make \
        gcc \
        g++ \
        python \
        linux-headers \
    && npm install -g bower

COPY entrypoint /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["entrypoint"]
CMD ["-v"]
