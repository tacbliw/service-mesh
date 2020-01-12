#!/bin/sh
go run main.go &
sleep 4
consul agent -config-dir /consul/config &
sleep 4
consul connect envoy -sidecar-for service-c
