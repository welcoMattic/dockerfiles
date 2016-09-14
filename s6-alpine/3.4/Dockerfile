FROM alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

LABEL description="Alpine image with su-exec && s6" \
      tags="3.4 latest" \
      build_ver="2016091401"

RUN apk upgrade -U \
    && apk add su-exec s6 \
    && rm -rf /var/cache/apk/*

CMD ["sh"]
