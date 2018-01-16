# Docker image for Varnish caching proxy

## Usage

    docker run -d -p 80:8080 -v path/to/vcl:/etc/varnish/default.vcl quay.io/mittwald/varnish
