#!/bin/sh
sleep 4
consul agent -config-dir /consul/config &
sleep 4
echo 
echo
echo starting envoy
echo 
echo
consul connect envoy -sidecar-for service_a > /envoy.out &
sleep 4
go run main.go
