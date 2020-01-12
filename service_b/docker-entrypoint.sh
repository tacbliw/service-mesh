#!/bin/sh
consul agent -config-dir /consul/config &
consul connect envoy -sidecar-for service_b > /envoy.out &
go run main.go
