FROM xataz/sshd
MAINTAINER xataz <https://github.com/xataz>

LABEL description="rsync based on alpine" \
      build_ver="2016052901"

RUN apk add -U rsync \
    && rm -rf /var/cache/apk/*
