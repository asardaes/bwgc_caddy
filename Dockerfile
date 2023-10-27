FROM caddy:builder-alpine AS caddy-builder
RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:alpine
COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
RUN apk add --no-cache tzdata
