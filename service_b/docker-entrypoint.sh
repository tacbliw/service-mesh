#!/bin/sh
consul connect envoy -sidecar-for service_b > /envoy.out &
go run main.go
