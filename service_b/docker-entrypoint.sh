#!/bin/sh
go run main.go &
sleep 4
consul agent -config-dir /consul/config &
