FROM alpine:edge
MAINTAINER Tobias Gesellchen <tobias@gesellix.de> (@gesellix)

ENV CADDY_VERSION="0.8.3"
ENV CADDY_URL="https://github.com/mholt/caddy/releases/download/v${CADDY_VERSION}/caddy_linux_amd64.tar.gz"

RUN apk add --no-cache --virtual=build-deps curl ca-certificates && \
    curl -sSL "${CADDY_URL}" | tar xz -C /usr/local/bin/ caddy_linux_amd64 && \
    apk del --no-cache build-deps && \
    apk add --no-cache su-exec && \
    addgroup -S caddy && adduser -s /sbin/nologin -S -G caddy caddy && \
    cd /usr/local/bin/ && mv caddy_linux_amd64 caddy && chown caddy:caddy caddy

RUN mkdir -p /site
WORKDIR /site

EXPOSE 8080
CMD [ "su-exec", "caddy", "caddy", "-conf=/Caddyfile", "$@" ]

COPY Caddyfile /
