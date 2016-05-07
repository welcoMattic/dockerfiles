FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ENV UID=991 \
    GID=991 \
    USER=user

LABEL description="sshd based on alpine" \
      build_ver="2016050701"

RUN apk add -U dropbear \
    && rm -rf /var/cache/apk/*

COPY startup /usr/bin/startup
RUN chmod +x /usr/bin/startup    
ENTRYPOINT ["tini", "--", "startup"]
