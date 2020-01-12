#!/bin/sh
consul connect envoy -sidecar-for service_c > /envoy.out &
go run main.go
