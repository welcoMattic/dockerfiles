FROM xataz/alpine:3.3-full
MAINTAINER xataz <https://github.com/xataz/>

ENV UID=991 \
    GID=991 \
    WEBROOT=""

RUN apk add -U transmission-daemon \
    && rm /var/cache/apk/*

VOLUME ["/data","/home/transmission/.config/transmission-daemon/"]
ADD startup /usr/bin/startup
ADD settings.json /tmp/settings.json
RUN chmod +x /usr/bin/startup

CMD ["tini","--","startup"]
