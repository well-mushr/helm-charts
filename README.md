# helm-charts
Helm is a popular tool to manager the lifecyle to Kubernertes applications.

# Installation

## Prerequisites
- Install [Helm](https://docs.helm.sh/using_helm/#installing-helm)
- tl;dr `brew install kubernetes-helm && helm init --client-only`

## Configuring the charts repository
```bash
# Add the charts repository
helm repo add wmaramos https://wmaramos.github.io/helm-charts
# List the available charts
helm search wmaramos
```

## Check which charts are installed
```bash
helm ls
```

## Update/upgrade a release
The namespace from the installation will be used.
```bash
helm upgrade -i <release-name> -f /path/to/values.yaml
```

## Delete a release
```bash
helm uninstall <release-name>
```

## Available charts
- [stateless-app](https://github.com/wmaramos/helm-charts/tree/main/charts/stateless-app)