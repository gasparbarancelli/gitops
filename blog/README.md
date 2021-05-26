utilize kustomize para gera manifesto

```shell
kustomize edit set namespace teste && kustomize build .
```

Utilizando microk8s habilite as seguintes funcionalidades

```shell
microk8s enable dns ha-cluster istio metrics-server registry storage prometheus
```

Comandos para obter a porta e ip do gateway do istio

```shell
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')

export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}')
```

kustomize
```shell
kustomize build . | kubectl apply -f -
```