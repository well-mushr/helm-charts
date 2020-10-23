SHELL = /usr/bin/env bash

.PHONY: help
.DEFAULT_GOAL := help

help:
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

test: ## Execute tests
	@minikube start
	helm upgrade --install --set image.repository=nginx helm-test-asdf charts/stateless-app/
	helm test helm-test-asdf

package: ## Create helm package
	@helm package charts/*
	helm repo index --url https://wmaramos.github.io/helm-charts/ .

clean:
	@helm uninstall helm-test-asdf

changelog: ## Update changelog to include changes since last release
	@git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

release: ## Create new release version
	@semtag final -s minor