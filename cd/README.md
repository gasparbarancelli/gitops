### Antes de executar o yaml do argo crie o namespace argocd
```kubectl
kubectl create namespace argocd
```

### Apos executar o argocd, gera uma nova senha do tipo BCRYPT no site https://www.browserling.com/tools/bcrypt e execute o comando abaixo para alterar a senha do usuario do min do argocd

```kubectl
kubectl -n argocd patch secret argocd-secret \
-p '{"stringData": {
"admin.password": "NOVA_SENHA",
"admin.passwordMtime": "'$(date +%FT%T%Z)'"
}}'
```
