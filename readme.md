
# service-mesh

Network design and services was taken from: <https://github.com/dnivra26/envoy_servicemesh>

## Services

Golang web applications, inter-service communication, used for PoC.

## Consul

### Server 

```json
{
    "bootstrap_expect": 3,
    "bind_addr": "0.0.0.0",
    "client_addr": "0.0.0.0",
    "datacenter": "dc1",
    "data_dir": "/consul/data",
    "domain": "consul",
    "enable_script_checks": true,
    "dns_config": {
        "enable_truncate": true,
        "only_passing": true
    },
    "enable_syslog": false,
    "encrypt": "goplCZgdmOFMZ2Q43To0jw==",
    "leave_on_terminate": true,
    "log_level": "INFO",
    "rejoin_after_leave": true,
    "server": true,
    "connect": {
        "enabled": true
    },
    "start_join": [
        "consul-server-1:8301",
        "consul-server-2:8301",
        "consul-server-3:8301"
    ],
    "retry_join": [
        "consul-server-1:8301",
        "consul-server-2:8301",
        "consul-server-3:8301"
    ],
    "ui": true
}
```

### Client

#### Consul client

```json
{
  "datacenter": "dc1",
  "bind_addr": "0.0.0.0",
  "client_addr": "0.0.0.0",
  "encrypt": "goplCZgdmOFMZ2Q43To0jw==",
  "data_dir": "/consul/data",
  "log_level": "INFO",
  "node_name": "service-a-node",
  "server": false,
  "ui": false,
  "leave_on_terminate": false,
  "skip_leave_on_interrupt": true,
  "rejoin_after_leave": true,
  "connect": {
    "enabled": true
  },
  "ports": {
    "grpc": 8502
  },
  "start_join": [
    "consul-server-1:8301",
    "consul-server-2:8301",
    "consul-server-3:8301"
  ],
  "retry_join": [
      "consul-server-1:8301",
      "consul-server-2:8301",
      "consul-server-3:8301"
  ]
}
```

#### Consul service with sidecar

With local upstream

```json
{
  "service": {
    "name": "service-b",
    "tags": [
      "go",
      "production"
    ],
    "port": 8788,
    "connect": { "sidecar_service": {} },
    "check": {
      "id": "service-b",
      "name": "service-b TCP on port 8788",
      "tcp": "service-b:8788",
      "interval": "10s",
      "timeout": "1s"
    }
  }
}
```

With remote upstream

```json
{
  "service": {
    "name": "service-a",
    "tags": [
      "go",
      "production"
    ],
    "port": 80,
    "connect": {
      "sidecar_service": {
        "proxy": {
          "upstreams": [
            {
              "destination_name": "service-b",
              "local_bind_port": 8788
            },
            {
              "destination_name": "service-c",
              "local_bind_port": 8791
            }
          ]
        }
      }
    },
    "check": {
      "id": "service-a",
      "name": "service-a TCP on port 80",
      "tcp": "service-a:80",
      "interval": "10s",
      "timeout": "1s"
    }
  }
}
```

## Commands

### Consul agent

Consul agent must be up first. When turned on, it will continuously try to connect and join the configured cluster.

Consul server instances that have `"server": true` will try to elect a master node if the cluster have more than 1 server. `"bootstrap_expect"` have to be set to the number of instances.

```sh
consul agent -config-dir /consul/config
```

### Envoy sidecar with consul

```sh
consul connect envoy -sidecar-for <service-name>
```

for `service-name` in the service config file.
