#!/usr/bin/env bash

set -e

kubectl apply -f "namespace.yaml"
kubectl apply -f "operator.yaml"
kubectl wait --for=condition=Ready=true pod/elastic-operator-0 -n elastic-system
kustomize build . | kubectl apply -f -