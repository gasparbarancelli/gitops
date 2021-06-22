# Guia de instalação do Prometheus em cluster Kubernetes

Esse guia tem como objetivo documentar a instalação do Prometheus.

Primeiramente vamos trazer uma breve explicação sobre cada uma das peças mencionadas anteriormente, mas não entraremos em detalhes, pois nosso foco é na instalação.

**Prometheus** o Prometheus é um sistema de monitoramento para serviços e aplicações. Ele coleta as métricas de seus alvos em determinados intervalos, avalia expressões de regras, exibe os resultados e também pode acionar alertas se alguma condição for observada como verdadeira.

---

Vamos fazer o uso do Operator para instalação do Prometheus, com isso teremos CR "Custom Resources" para subir novos tipos de artefatos no Kubernetes, bem como ler os CRD "Custom Resources Definition" que seriam suas especificações/documentações. Utilizamos o operator open source desenvolvido pelo mesmo time que cuida do kube-prometheus ( stack completa monitoria), portanto, ele é encarregado por implantar os artefatos da melhor forma possivel, até mesmo fazer um upgrade de versão.

Segue desenho abaixo da estrategia de monitoria baseada em coletar as metricas dos services.



![Prometeus Service Monitor Print - fonte https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/master/Documentation/user-guides/images/architecture.png](images/architecture.png)

Para facilitar a instalação do Prometheus disponibilizamos um script executável nomeado como ```install.sh```, sendo assim execute os simples comandos abaixo para instalar em seu cluster.

```shell
chmod +x install.sh
./install.sh
```

O executável acima executará todos os manifestos contidos neste diretório numa ordem específica pois existem dependência entre eles.

Execute comando abaixo para acessar console prometheus no navegador.

```shell
kubectl port-forward service/prometheus  9090 -n monitoring
```

Ao realizar o port-forward acesse o endereço https://localhost:9090 em seu navegador.

>O Arquivo serviceMonitor definiu os labels customizados para realizar monitoria nas apps java.

>O service monitorado deve ter um "Port com nome http-monitoring-prometheus" e um label "java-monitoring: prometheus"
Ele realizara a coleta de metricas do seguinte path
path: /actuator/prometheus. 


>Também foi incluido o arquivo prometheus-istio-operator.yaml
que defini regras monitoria padrao para os componentes istio.