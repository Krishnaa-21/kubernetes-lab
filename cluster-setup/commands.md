# Cluster Management Commands

## Create Cluster

```bash
kind create cluster --name first-cluster
```

## Create Cluster Using Config File

```bash
kind create cluster \
--name first-cluster \
--config kind-config.yaml
```

## View Clusters

```bash
kind get clusters
```

## View Nodes

```bash
kubectl get nodes
```

## Cluster Information

```bash
kubectl cluster-info
```

## Delete Cluster

```bash
kind delete cluster --name first-cluster
```
