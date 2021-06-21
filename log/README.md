Esse guia tem como objetivo documentar a instalação do EFK que é o acrônimo de ElasticSearch, FluentD e Kibana, num cluster Kubernetes.

Vamos fazer o uso de operadores para instalação do Elastic Search e Kibana, com isso teremos CR "Custom Resources" para subir novos tipos de artefatos no Kubernetes, bem como ler os CRD "Custom Resources Definition" que seriam suas especificações/documentações. Utilizamos o operador desenvolvido pela equipe do ElasticSearch, portanto, ele é encarregado por implantar os artefatos da melhor forma possivel, até mesmo fazer um upgrade de versão.  

> No momento em que escrevemos esta documentação não existe um operador para o FluentD, portanto implantaremos o FluentD num DaemonSet, pois ele precisa ser implantado em todos nós do cluster.

Para facilitar a instalação de toda stack EFK disponibilizamos um script executavel nomeado como ```install.sh```, sendo assim execute os simples comandos abaixo para instalar toda stack em seu cluster.

```shell
chmod +x install.sh
./install.sh
```

O executavel acima executara todos os manifestos contidos neste diretorio numa ordem especifica pois existem dependencia entre eles.

Após executar os comandos e a instalação for finalizada com sucesso, você deve executar o comando abaixo para obter a senha definida para o ElasticSearch.

```shell
kubectl get secret elasticsearch-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
```

Com a senha em mãos agora podemos fazer um port-forward para acessar o Kibana com o comando abaixo.

```shell
kubectl port-forward service/elasticsearch-kb-http 5601 -n elastic-system
```

Ao realizar o port-forward acesse o endereço https://localhost:5601 em seu navegador. Ao acessar o Kibana você será redirecionado para pagina de Login. O usuário para acesso é *elastic* e a senha você obteve no passo anterior.

Vale lembrar que foi disponibilizado um service do tipo load balancer para o Kibana, não necessariamente é preciso realizar o port-forward para acessar o Kibana.