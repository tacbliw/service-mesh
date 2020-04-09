FROM consul
FROM envoyproxy/envoy-alpine
FROM golang

WORKDIR /app
COPY --from=0 /bin/consul /usr/local/bin/consul
COPY --from=1 /usr/local/bin/envoy /usr/local/bin/envoy

COPY main.go main.go
COPY ["docker-entrypoint.sh", "/"]
CMD ["/bin/bash", "/docker-entrypoint.sh"]