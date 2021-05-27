#!/usr/bin/env bash


set -e

kubectl apply -f "namespace.yaml"
kubectl apply -f "operator.yaml"
kubectl wait --for=condition=available --timeout=600s deployment/prometheus-operator -n monitoring
kustomize build . | kubectl apply -f -


curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.18.1/install.sh | bash -s v0.18.1

kubectl create -f https://operatorhub.io/install/grafana-operator.yaml
kubectl wait --for=condition=available --timeout=600s deployment/grafana-operator  -n my-grafana-operator

kubectl apply -f grafana-volume.yaml
kubectl apply -f grafana-datasource.yaml
kubectl apply -f grafana-dashboard.yaml
kubectl apply -f grafana.yaml