FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

EXPOSE 8000
ENV CONTACT_MAIL=admin@domain.tld UID=991 GID=991

RUN apk add --update python py-setuptools py-pip && pip install --upgrade pip && \
        pip install zerobin && \
        apk del py-pip && rm -rf /var/cache/apk/* && rm -rf /root/.cache

ADD settings.py /zerobin/settings.py
ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup
VOLUME /paste

CMD ["startup"]

