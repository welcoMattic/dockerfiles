FROM xataz/sshd
MAINTAINER xataz <https://github.com/xataz>

LABEL description="rsync based on alpine" \
      tags="latest" \
      build_ver="$(date +%Y%m%d)"

RUN apk add -U rsync \
    && rm -rf /var/cache/apk/*
