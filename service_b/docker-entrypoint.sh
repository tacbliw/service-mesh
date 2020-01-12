#!/bin/sh
sleep 4
consul agent -config-dir /consul/config &
echo 
echo
echo starting envoy
echo 
echo
consul connect envoy -sidecar-for service_b > /envoy.out &
go run main.go
