FROM xataz/node:lts
MAINTAINER xataz <https://github.com/xataz/>

LABEL description="nodejs based on alpine" \
      tags="4.4.7-onbuild 4.4-onbuild 4-onbuild lts-onbuild" \
      build_ver="2016072703"

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY . /usr/src/app/
ONBUILD RUN PKG_BUILD="git make gcc g++ python linux-headers" && \
	apk add --update ${PKG_BUILD} && \
	if [ -e /usr/src/app/package.json ]; then \
		npm install; \
	fi && if [ -e /usr/src/app/bower.js ]; then \
		npm install -g bower && bower install; \
	fi && if [ -e /usr/src/app/gulpfile.js ]; then \
		npm install -g gulp && gulp; \
	fi && if [ -e /usr/src/app/Gruntfile.js ]; then \
		npm install -g grunt && grunt; \
	fi && \
	&& npm cache clean /root/.npm && apk del ${PKG_BUILD} && rm -rf /var/cache/apk/* \
	&& chown -R ${UID}:${GID} /usr/src/app

CMD ["start"]
