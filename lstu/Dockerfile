FROM xataz/alpine:3.5
MAINTAINER xataz <https://github.com/xataz>

ENV GID=991 \
    UID=991 \
    SECRET=f6056062888a9a6aff1cc89dd3397853 \
    CONTACT=contact@domain.tld \
    WEBROOT=/ \
    ADMINPWD="s3cr3T"

LABEL description="lstu based on alpine" \
      tags="latest" \
      build_ver="2016122803"

RUN BUILD_DEPS="build-base \
                openssl-dev \
                ca-certificates \
                git \
                tar \
                perl-dev \
                libidn-dev \
                wget" \
    && apk add -U ${BUILD_DEPS} \
                openssl \
                perl \
                libidn \
                tini \
                su-exec \
    && echo | cpan \
    && cpan install Carton \
    && git clone https://git.framasoft.org/luc/lstu.git /usr/lstu \
    && cd /usr/lstu \
    && carton install \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /root/.cpan* /usr/lstu/local/cache/* /usr/lstu/utilities
    
EXPOSE 8282

COPY startup /usr/local/bin/startup
COPY lstu.conf /usr/lstu/lstu.conf
RUN chmod +x /usr/local/bin/startup

CMD ["/usr/local/bin/startup"]
