# redis-tools

A redis-tools docker image for k8s deployment.

## Running on Kubernetes (AWS EKS)

### Prerequisites

You need a working Kubernetes cluster and `kubectl` configured.

Edit the `redis-cli-conf` configmap in `redis-tools.yml` with the information
for the `${REDIS_ENDPOINT}` and `${REDIS_PORT}` to use. Replace those strings
with the correct values for your environment.

### Deploy the objects:

```sh
kubectl apply -f redis-tools.yml
```

### Attach to the pod:

```sh
kubectl attach --namespace redis-tools -ti redis-tools
```

## References

<https://www.stunnel.org/config_unix.html>

<https://www.stunnel.org/static/stunnel.html#CONFIGURATION-FILE>

## Authors

**Andre Silva**

## License

This project is licensed under the [Unlicense](UNLICENSE).

## Acknowledgements

<https://github.com/tsing/docker-stunnel>

<https://github.com/innuendonh/stunnel-docker>
