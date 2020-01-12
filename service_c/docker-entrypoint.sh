#!/bin/sh
sleep 4
consul agent -config-dir /consul/config &
consul connect envoy -sidecar-for service_c > /envoy.out &
go run main.go
