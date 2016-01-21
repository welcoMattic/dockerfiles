FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ENV WEBROOT="" UID=991 GID=991

RUN BUILD_DEPS="py-pip git build-base libxml2-dev python-dev libxslt-dev libffi-dev openssl-dev" && apk add -U python libxml2 libxslt libffi supervisor ${BUILD_DEPS} && \
	git clone https://github.com/RuudBurger/CouchPotatoServer.git && \
	cd /CouchPotatoServer && pip install lxml pyopenssl && \
	apk del ${BUILD_DEPS} && rm -fr /var/cache/apk/*

VOLUME ["/config"]
EXPOSE 5050
ADD startup /usr/bin/startup
ADD config.ini /tmp/config.ini
ADD supervisor.ini /etc/supervisor.d/supervisor.ini
RUN chmod +x /usr/bin/startup

CMD ["/usr/bin/startup"]
