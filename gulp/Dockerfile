FROM xataz/node:5.1.0
MAINTAINER xataz <https://github.com/xataz>

ENV GULP_VER=3.9.0

RUN apk add --update libgcc libstdc++ && \
	npm install -g gulp@${GULP_VER}

ENTRYPOINT ["gulp"]
CMD ["-v"]
