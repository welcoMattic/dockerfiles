<<<<<<< Updated upstream
FROM xataz/tini-alpine:3.4
=======
FROM alpine:3.4
>>>>>>> Stashed changes
MAINTAINER xataz <https://github.com/xataz/>

LABEL description="transmission based on alpine" \
      tags="latest" \
      build_ver="$(date +%Y%m%d)"

ENV UID=991 \
    GID=991 \
    WEBROOT=""

RUN apk add -U transmission-daemon \
    && rm /var/cache/apk/*

VOLUME ["/data","/home/transmission/.config/transmission-daemon/"]
COPY startup /usr/bin/startup
COPY settings.json /tmp/settings.json
RUN chmod +x /usr/bin/startup

EXPOSE 9091

CMD ["startup"]
