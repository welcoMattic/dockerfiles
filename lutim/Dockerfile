FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ENV GID=991 \
    UID=991 \
    CONTACT=contact@domain.tld \
    WEBROOT=/ \
    SECRET=e7c0b28877f7479fe6711720475dcbbd \
    MAX_FILE_SIZE=10000000000 \
    DEFAULT_DELAY=1 \
    MAX_DELAY=0

LABEL description="lutim based on alpine" \
      tags="latest" \
      build_ver="2016110801"

RUN BUILD_DEPS="build-base \
                openssl-dev \
                ca-certificates \
                git \
                tar \
                perl-dev \
                libidn-dev \
                wget \
                imagemagick-dev" \
    && apk add -U ${BUILD_DEPS} \
                openssl \
                perl \
                libidn \
                perl-crypt-rijndael \
                perl-test-manifest \
                imagemagick \
                shared-mime-info \
                tini \
                su-exec \
    && echo | cpan \
    && cpan install Carton \
    && cd / \
    && git clone https://git.framasoft.org/luc/lutim.git /usr/lutim \
    && echo "requires 'Image::Magick';" >> /usr/lutim/cpanfile \
    && echo "requires 'Mojolicious::Plugin::AssetPack::Backcompat';" >> /usr/lutim/cpanfile \
    && cd /usr/lutim \
    && rm -rf cpanfile.snapshot \
    && carton install \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /root/.cpan* /usr/lutim/local/cache/* /usr/lufi/utilities

VOLUME /usr/lutim/data/ /usr/lutim/files

EXPOSE 8181

ADD lutim.conf /usr/lutim/lutim.conf
ADD startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

CMD ["/usr/local/bin/startup"]
