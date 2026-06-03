# Minikube Commands

## Check Minikube Version

```bash
minikube version
```

## Start a Cluster

```bash
minikube start
```

## Start with Docker Driver

```bash
minikube start --driver=docker
```

## Check Cluster Status

```bash
minikube status
```

## View Cluster Information

```bash
kubectl cluster-info
```

## View Nodes

```bash
kubectl get nodes
```

## SSH into Minikube Node

```bash
minikube ssh
```

## Open Kubernetes Dashboard

```bash
minikube dashboard
```

## Enable Ingress Addon

```bash
minikube addons enable ingress
```

## List Enabled Addons

```bash
minikube addons list
```

## Get Minikube IP

```bash
minikube ip
```

## Access a Service

```bash
minikube service <service-name>
```

Example:

```bash
minikube service nginx-service
```

## View Running Pods

```bash
kubectl get pods
```

## View All Resources

```bash
kubectl get all
```

## View Namespaces

```bash
kubectl get namespaces
```

## Stop Cluster

```bash
minikube stop
```

## Pause Cluster

```bash
minikube pause
```

## Unpause Cluster

```bash
minikube unpause
```

## Delete Cluster

```bash
minikube delete
```

## Delete All Profiles

```bash
minikube delete --all
```

## Start Cluster with Specific Kubernetes Version

```bash
minikube start --kubernetes-version=v1.33.1
```

## View Logs

```bash
minikube logs
```

## View Profile List

```bash
minikube profile list
```

## Update Context

```bash
kubectl config current-context
```

Expected Output:

```text
minikube
```

## Useful Troubleshooting Commands

```bash
minikube status

kubectl get nodes

kubectl get pods -A

kubectl cluster-info

minikube logs
```
