FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz/>

LABEL description="transmission based on alpine" \
      build_ver="2016042601"

ENV UID=991 \
    GID=991 \
    WEBROOT=""

RUN apk add -U transmission-daemon \
    && rm /var/cache/apk/*

VOLUME ["/data","/home/transmission/.config/transmission-daemon/"]
COPY startup /usr/bin/startup
COPY settings.json /tmp/settings.json
RUN chmod +x /usr/bin/startup

CMD ["tini","--","startup"]
