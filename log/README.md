usuario do kibana

```shell
elastic
```

obter senha do kibana

```shell
kubectl get secret quickstart-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
```

status do kibana

```shell
kubectl get kibana
```

pod associado ao kibana

```shell
kubectl get pod --selector='kibana.k8s.elastic.co/name=quickstart'
```

port-forward kibana

```shell
kubectl port-forward service/quickstart-kb-http 5601
```

obter senha do elastic search
```shell
kubectl get secret quickstart-es-elastic-user -o go-template='{{.data.elastic | base64decode}}'
```

status elastic search

```shell
kubectl get elasticsearch
```

pod associado ao elastic search

```shell
kubectl get pods --selector='elasticsearch.k8s.elastic.co/cluster-name=quickstart'
```

logs dos pods

```shell
kubectl logs -f quickstart-es-default-0
```

servico
```shell
kubectl get service quickstart-es-http
```

port-forward

```shell
kubectl port-forward service/quickstart-es-http 9200
```