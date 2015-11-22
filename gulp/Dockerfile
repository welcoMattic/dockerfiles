FROM xataz/node:5.1.0
MAINTAINER xataz <https://github.com/xataz>

RUN apk add --update libgcc libstdc++ && \
	npm install -g gulp

ENTRYPOINT ["gulp"]
