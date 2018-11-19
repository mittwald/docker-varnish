FROM    alpine:3.6

LABEL   maintainer="Dennis Hermsmeier <d.hermsmeier@mittwald.de> for Mittwald CM Service GmbH & Co. KG"

ENV VARNISH_MEMORY="128M" \
    VARNISH_VCL_PATH="/etc/varnish/default.vcl" \
    VARNISH_PORT="8080"

RUN apk update && \
    apk upgrade && \
    apk add varnish && \
    rm -Rf /tmp/*

ADD start.sh /usr/local/bin/startvarnishd

CMD ["/usr/local/bin/startvarnishd"]
