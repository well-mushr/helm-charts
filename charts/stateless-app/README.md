# Stateless Application Template

This template is used to deploy a stateless application using Helm.

## Requirements

| Name    | Version   |
|---------|-----------|
| kubectl | >= 1.19.3 |
| helm    | >= 3.3.4  |

## Get Repo Info

```
helm repo add wmaramos https://wmaramos.github.io/helm-charts
helm repo update
```

## Install Chart

```
helm install [RELEASE_NAME] wmaramos/stateless-app
```

## Configuration

| Name                                          | Description                                                               | Default      | Required |
|-----------------------------------------------|---------------------------------------------------------------------------|--------------|----------|
| replicaCount                                  | Inicial number of replicaset for a service                                | 1            | no       |
| image.repository                              | Docker repository                                                         | null         | yes      |
| image.pullPolicy                              | Defines when pull images                                                  | IfNotPresent | no       |
| image.tag                                     | Docker tags on image                                                      | null         | no       |
| imagePullSecrets                              | Secret to docker pull                                                     | []           | no       |
| nameOverride                                  | Override value defined at _helpers                                        | null         | no       |
| fullNameOverride                              | Override value defined at _helpers                                        | null         | no       |
| serviceAccount.create                         | Create service account definition                                         | true         | no       |
| serviceAccount.annotations                    | Annotations to serviceAccount                                             | {}           | no       |
| serviceAccount.name                           | If not set and create is true, name is genereated using fullname template | null         | no       |
| podAnnotations                                | Annotations to Pod                                                        | {}           | no       |
| podSecurity                                   | Security Context definition in Pod                                        | {}           | no       |
| securityContext                               | Security Context definition in Container                                  | {}           | no       |
| service.type                                  | Define type of the service                                                | ClusterIP    | no       |
| service.port                                  | Port used by the service                                                  | 80           | no       |
| ingress.enabled                               | Enable ingress                                                            | false        | no       |
| ingress.annotations                           | Ingress annotations, required when ingress is enabled                     | {}           | no       |
| ingress.hosts                                 | Host and route definitions, required when ingress is enabled              | []           | no       |
| ingress.tls                                   | TLS settings to ingress                                                   | []           | no       |
| resources                                     | Map containing settings to limit resources                                | {}           | no       |
| autoscaling.enabled                           | Enable HPA                                                                | true         | no       |
| autoscaling.minReplicas                       | Minimal number of replicas                                                | 1            | no       |
| autoscaling.maxReplicas                       | Maximum number of replicas                                                | 10           | no       |
| autoscaling.targetCPUUtilizationPercentage    | Target CPU used by HPA                                                    | 80           | no       |
| autoscaling.targetMemoryUtilizationPercentage | Target Memory used by HPA                                                 | null         | no       |
| tolerations                                   | Map to configure tolerations                                              | {}           | no       |
| affinity                                      | Map to configure affinity                                                 | {}           | no       |
| nodeSelector                                  | Map to configure nodeSelector                                             | {}           | no       |

## Tests

This project support tests using [helm tests](https://helm.sh/docs/topics/chart_tests/), the easiest way to run is using [minikube](https://minikube.sigs.k8s.io/docs/start/) and `make`.

```
make test
```