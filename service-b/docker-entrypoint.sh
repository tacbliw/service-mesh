#!/bin/sh
go run main.go &
sleep 10
consul agent -config-dir /consul/config &
sleep 10
consul connect envoy -sidecar-for service-b
