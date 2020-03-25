#!/bin/sh
if [ -z ${NODE} ]; then
    NODE=service_a_${HOSTNAME}
fi
go run main.go &
sleep 10
consul agent -config-dir /consul/config -node ${NODE} &
sleep 10
consul connect envoy -sidecar-for service-a
