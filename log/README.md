Execute a command below

```shell
chmod +x install.sh
./install.sh
```

usuario do kibana __elastic__
obter a senha do kibana

```shell
kubectl get secret quickstart-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
```

port-forward kibana
```shell
kubectl port-forward service/quickstart-kb-http 5601
```
