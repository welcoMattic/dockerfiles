FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz/>

LABEL description="up1 based on alpine" \
      build_ver="2016042601"

ENV GID=991 \
    UID=991 \
    WEB_ROOT="" \
    APIKEY="" \
    DELETEKEY=""

RUN apk add -U go \
                git \
	&& cd / \
	&& git clone https://github.com/xataz/Up1 \
	&& cd /Up1 \
	&& go build server.go \
	&& mv /Up1/server /usr/bin/up1 \
	&& apk del git go \
	&& rm -rf /var/cache/apk/*

EXPOSE 5000
WORKDIR /Up1
VOLUME /Up1/i

ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["tini", "--", "startup"]
