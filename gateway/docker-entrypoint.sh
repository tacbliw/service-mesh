#!/bin/sh
nginx -t && nginx
mkdir /consul/data
sleep 10
consul agent -config-dir /consul/config &
sleep 10
consul connect envoy -sidecar-for nginx
