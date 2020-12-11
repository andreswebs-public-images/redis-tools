# redis-tools

A redis-tools docker image for k8s deployment.

## Running on Kubernetes (AWS EKS)

### Prerequisites

You need a working EKS cluster and `kubectl` configured.

You need an IAM role for the k8s service account, with permissions to access the SSM parameters used in `redis-tools.yml`.

The k8s manifest assumes there are two SSM parameters in the environment, storing the Redis endpoint and port:

- `/elasticache/endpoint`
- `/elasticache/port`

Edit the `redis-tools.yml` with the correct information for IAM and SSM.

### Deploy the objects:

``` bash
kubectl apply -f redis-tools.yml
```

### Attach to the pod:

``` bash
kubectl attach --namespace redis-tools -ti redis-tools
```

## References

<https://www.stunnel.org/config_unix.html>

<https://www.stunnel.org/static/stunnel.html#CONFIGURATION-FILE>

## Authors

**Andre Silva**

## License

This project is licensed under the [Unlicense](UNLICENSE.md).

## Acknowledgements

<https://github.com/tsing/docker-stunnel>

<https://github.com/innuendonh/stunnel-docker>
