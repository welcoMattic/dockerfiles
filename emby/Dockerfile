FROM xataz/mono:latest
MAINTAINER xataz <https://github.com/xataz>

ARG MEDIAINFO_VER=0.7.88

ENV GID=991 \
    UID=991

LABEL description="Emby based on alpine" \
      tags="latest" \
      build_ver="2016072701"

RUN export BUILD_DEPS="build-base \
                        git \
                        unzip \
                        wget \
                        ca-certificates" \
    && apk add -U imagemagick \
	            sqlite \
	            ffmpeg \
	            supervisor \
                $BUILD_DEPS \
    && cd /tmp \
    && wget http://mediaarea.net/download/binary/mediainfo/${MEDIAINFO_VER}/MediaInfo_CLI_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && wget http://mediaarea.net/download/binary/libmediainfo0/${MEDIAINFO_VER}/MediaInfo_DLL_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && tar xzf MediaInfo_DLL_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && tar xzf MediaInfo_CLI_${MEDIAINFO_VER}_GNU_FromSource.tar.gz \
    && cd  /tmp/MediaInfo_DLL_GNU_FromSource \
    && ./SO_Compile.sh \
    && cd /tmp/MediaInfo_DLL_GNU_FromSource/ZenLib/Project/GNU/Library \
    && make install \
    && cd /tmp/MediaInfo_DLL_GNU_FromSource/MediaInfoLib/Project/GNU/Library \
    && make install \
    && cd /tmp/MediaInfo_CLI_GNU_FromSource \
    && ./CLI_Compile.sh \
    && cd /tmp/MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI \
    && make install \
    && mkdir /embyServer \
    && mkdir /embyData \
    && cd /embyServer \
    && wget https://github.com/MediaBrowser/Emby.Releases/raw/master/Server/Emby.Mono.zip \
    && unzip Emby.Mono.zip \
    && apk del $BUILD_DEPS \
    && rm -rf /var/cache/apk/* /tmp/* \
    && rm -f Emby.Mono.zip

EXPOSE 8096
VOLUME /embyData
ADD rootfs /
RUN chmod +x /usr/bin/startup

CMD ["tini","--","startup"]
