FROM alpine:latest
LABEL maintainer "V2Fly Community <dev@v2fly.org>"

WORKDIR /root
COPY v2ray.sh /root/v2ray.sh

RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates \
	&& mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
	&& chmod +x /root/v2ray.sh \
	&& /root/v2ray.sh "linux/amd64"

VOLUME /etc/v2ray
CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]
