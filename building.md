# Building

## Set up local docker registy

```powershell
    docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

## Set up Dev Database Server

```powershell
kubectl create secret generic mssql --from-literal=SA_PASSWORD="MyC0m9l&xP@ssw0rd"

kubectl apply -f .\kubernetes\deployment.yaml
```

## Build the Python Image

```powershell

docker build `
    --file Dockerfile `
    --label centos-python36-sqlodbc `
    --tag centos-python36-sqlodbc:latest `
    .

```

## Deploy image to local registry

``` powershell

docker tag centos-python36-sqlodbc localhost:5000/centos-python36-sqlodbc
docker push localhost:5000/centos-python36-sqlodbc

```

## Repull fresh image into deployment

```powershell
# Look into adding a replication set to the deployment so that we can do
# rolling updates to images
# https://stackoverflow.com/questions/33112789/how-do-i-force-kubernetes-to-re-pull-an-image

#https://ryaneschinger.com/blog/rolling-updates-kubernetes-replication-controllers-vs-deployments/

kubectl rolling-update heartbeat --image=localhost:5000/centos-python36-sqlodbc --image-pull-policy Always
```