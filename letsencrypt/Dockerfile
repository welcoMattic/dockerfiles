FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>


RUN apk add -U dialog python python-dev py-pip git build-base libffi-dev openssl-dev linux-headers augeas-libs && pip install virtualenv cffi cryptography psutil && \
	cd / && git clone https://github.com/letsencrypt/letsencrypt && \
	cd /letsencrypt && ./letsencrypt-auto --help && \
	apk del git build-base python-dev libffi-dev py-pip linux-headers openssl-dev && rm -rf /var/cache/apk/*

EXPOSE 80 443
VOLUME /etc/letsencrypt/

WORKDIR /letsencrypt
ENTRYPOINT ["./letsencrypt-auto"]
CMD ["--help"]
