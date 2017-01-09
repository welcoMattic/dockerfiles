FROM xataz/node:7
MAINTAINER xataz <https://github.com/xataz>

RUN apk add -U git \
            ca-certificates \
    && git clone https://github.com/onedr0p/manage-this-node \
    && cd /manage-this-node \
    && npm install \
    && apk del git \
               ca-certificates \
    && rm -rf /var/cache/apk/* \
    && mkdir /config

COPY startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["npm", "start"]