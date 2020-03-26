
# service-mesh

An working implementation of service mesh based on Consul and Envoy.

## Getting started

### Requirements

This demo use `docker` and `docker-compose`.

```bash
apt install docker.io docker-compose
```

### Running the project

Use `docker-compose` to run the project.

```bash
docker-compose up --build
```

### Scaling

You can horizontally scale the services. The scaling is currently done by using `docker-compose`

```bash
docker-compose up --build --scale <service-name>=<num-of-instances> --scale <service-name>=<num-of-instances> ...
```

## Reference
- Consul document: <https://www.consul.io/docs/index.html>