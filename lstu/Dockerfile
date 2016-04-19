FROM debian:jessie
MAINTAINER xataz <https://github.com/xataz>

ENV GID=991 \
    UID=991 \
    SECRET=f6056062888a9a6aff1cc89dd3397853 \
    CONTACT=contact@domain.tld \
    WEBROOT=/ \
    ADMINPWD="s3cr3T"

LABEL description="lstu based on debian" \
      build_ver="2016041901"

RUN apt-get update && apt-get upgrade \
    && BUILD_DEPS="make gcc ca-certificates git libssl-dev" \
    && apt-get install -y --no-install-recommends --no-install-suggests \
            perl \
            ${BUILD_DEPS} \
    && cpan install Carton \
    && cd / \
    && git clone https://git.framasoft.org/luc/lstu.git \
    && cd /lstu \
    && carton install \
    && apt-get purge -y ${BUILD_DEPS} \
    && apt-get autoremove --purge -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /root/.cpan* /lstu/local/cache/* /lstu/utilities
    
EXPOSE 8282

ADD startup /usr/bin/startup
ADD lstu.conf /lstu/lstu.conf
RUN chmod +x /usr/bin/startup

CMD ["startup"]
