#!/bin/sh
consul connect envoy -sidecar-for service_a > /envoy.out &
go run main.go
