FROM alpine:3.2 
MAINTAINER xataz <https://github.com/xataz/>

ADD start.sh /usr/bin/start.sh

RUN apk add --update go git && \
	cd / && git clone https://github.com/xataz/Up1 && cd /Up1 && go build server.go && \
	mv /Up1/server /usr/bin/up1 && \
	chmod +x /usr/bin/start.sh && \
	apk del git go && rm -rf /var/cache/apk/*

ENV WEB_ROOT=""
ENV APIKEY=""
ENV DELETEKEY=""

EXPOSE 80
WORKDIR /Up1
VOLUME /Up1/i

CMD ["/usr/bin/start.sh"]
