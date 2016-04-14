FROM alpine:3.3 
MAINTAINER xataz <https://github.com/xataz> 

RUN export BUILD_DEPS="wget \
                    ca-certificates \
		    tar" \
    && apk add -U git \
                bash \
                ${BUILD_DEPS} \
    && wget https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz -O /tmp/docker.tgz \
    && tar xzvf /tmp/docker.tgz -C /tmp \
    && mv /tmp/docker/docker /usr/bin/docker \
    && chmod +x /usr/bin/docker \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/* 
   

CMD ["sh"] 
