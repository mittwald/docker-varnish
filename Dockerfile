FROM    alpine:3.6

LABEL   maintainer ="Dennis Hermsmeier <d.hermsmeier@mittwald.de> for Mittwald CM Service GmbH & Co. KG"

ENV VARNISH_MEMORY 128M

ENV VARNISH_VCL_PATH /etc/varnish/default.vcl

RUN apk update && \
    apk upgrade && \
    apk add varnish && \
    rm -Rf /tmp/*

ADD start.sh /usr/local/bin/startvarnishd
RUN chmod +x /usr/local/bin/startvarnishd

EXPOSE 8080

CMD ["/usr/local/bin/startvarnishd"]