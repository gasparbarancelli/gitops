#!/usr/bin/env bash


set -e

kubectl apply -f "namespace.yaml"
kubectl apply -f "operator.yaml"
kubectl wait --for=condition=available --timeout=600s deployment/prometheus-operator -n monitoring
kustomize build . | kubectl apply -f -