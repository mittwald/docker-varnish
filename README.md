# Docker image for Varnish caching proxy

[![Docker Automated build](https://img.shields.io/docker/automated/mittwald/varnish.svg)](https://hub.docker.com/r/mittwald/varnish/)
[![Docker build status](https://img.shields.io/docker/build/mittwald/varnish.svg)](https://hub.docker.com/r/mittwald/varnish/)

Docker image for easily running a Varnish caching reverse proxy.

## Usage

This image needs a custom configuration file to work. I can be supplied by mounting a file to `/etc/varnish/default.vcl`.

    docker run -d -p 80:8080 -v path/to/vcl:/etc/varnish/default.vcl mittwald/varnish
