FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ENV WEBROOT="/" UID="991" GID="991"

RUN apk add --update python \
		py-pip \
		git \
		supervisor && \ 
	pip install cheetah && \
	cd / && git clone https://github.com/SickRage/SickRage.git && \
	apk del py-pip && rm -rf /var/cache/apk/* 

ADD startup /usr/bin/startup
ADD config.ini /tmp/config.ini
ADD supervisor.ini /etc/supervisor.d/supervisor.ini
RUN chmod +x /usr/bin/startup

VOLUME ["/config"]
EXPOSE 8081
CMD ["/usr/bin/startup"]
