ARG VERSION=2.8

FROM caddy:${VERSION}-builder AS builder

# Add the DigitalOcean DNS module
RUN xcaddy build \
  --with github.com/caddy-dns/digitalocean@master

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
