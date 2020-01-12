FROM consul
FROM envoyproxy/envoy:v1.9.1
FROM golang

WORKDIR /app
COPY --from=0 /bin/consul /usr/local/bin/consul
COPY --from=1 /usr/local/bin/envoy /usr/local/bin/envoy

COPY main.go main.go
COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD ["/bin/sh", "/docker-entrypoint.sh"]