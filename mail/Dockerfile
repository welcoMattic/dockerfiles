FROM debian:jessie
MAINTAINER xataz <https://github.com/xataz>

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get upgrade -y

RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y openssl postfix postfix-mysql dovecot-core dovecot-imapd dovecot-lmtpd \
	dovecot-mysql opendkim opendkim-tools opendmarc dovecot-sieve dovecot-managesieved \
	clamav-milter supervisor


ADD rootfs /
RUN chmod +x /usr/bin/startup
VOLUME /mail /ssl
ENV UID=5000 GID=5000 DOMAIN=domain.tld FQDN=mail.domain.tld db_host=localhost db_name=postfix db_user=postfix db_passwd=postfix


CMD ["/usr/bin/startup"]
