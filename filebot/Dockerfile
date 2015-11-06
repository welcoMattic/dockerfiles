FROM xataz/java
MAINTAINER xataz <xataz@mondedie.fr>

ENV FB_VER=4.6

RUN apk add --update wget unzip && \
  mkdir /opt/filebot && cd /opt/filebot && \
  wget http://downloads.sourceforge.net/project/filebot/filebot/FileBot_${FB_VER}/FileBot_${FB_VER}-portable.zip && \
  unzip FileBot_${FB_VER}-portable.zip && \
  apk del wget unzip && rm -rf /opt/filebot/FileBot_${FB_VER}-portable.zip /var/cache/apk/*
  
ENTRYPOINT ["/opt/filebot/filebot.sh"]
