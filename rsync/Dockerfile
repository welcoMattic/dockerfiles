FROM xataz/sshd
MAINTAINER xataz <https://github.com/xataz>

LABEL description="rsync based on alpine" \
      tags="latest" \
      build_ver="2016092701"

RUN apk add -U rsync \
    && rm -rf /var/cache/apk/*
