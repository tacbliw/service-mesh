FROM consul:latest
FROM envoyproxy/envoy-alpine
FROM nginx

COPY --from=0 /bin/consul /usr/local/bin/consul
COPY --from=1 /usr/local/bin/envoy /usr/local/bin/envoy

COPY config/default.conf /etc/nginx/conf.d/default.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD ["/bin/sh", "/docker-entrypoint.sh"]
