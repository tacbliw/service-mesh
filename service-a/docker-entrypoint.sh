#!/bin/sh
go run main.go &
sleep 4
consul agent -config-dir /consul/config &
sleep 4
echo 
echo
echo starting envoy
echo 
echo
consul connect envoy -sidecar-for service-a > /envoy.out
