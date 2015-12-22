FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz/>


RUN apk add --update go@community git && \
	cd / && git clone https://github.com/xataz/Up1 && cd /Up1 && go build server.go && \
	mv /Up1/server /usr/bin/up1 && \
	apk del git go && rm -rf /var/cache/apk/*

ENV WEB_ROOT="" APIKEY="" DELETEKEY="" GID=991 UID=991

EXPOSE 5000
WORKDIR /Up1
VOLUME /Up1/i

ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["startup"]
