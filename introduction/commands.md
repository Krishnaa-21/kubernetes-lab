# Basic Kubernetes Commands

## Check kubectl Version

```bash
kubectl version --client
```

## Cluster Information

```bash
kubectl cluster-info
```

## View Nodes

```bash
kubectl get nodes
```

## View Pods

```bash
kubectl get pods
```

## View All Namespaces

```bash
kubectl get namespaces
```

## View Kubernetes Resources

```bash
kubectl api-resources
```

## View API Versions

```bash
kubectl api-versions
```

## Detailed Node Information

```bash
kubectl describe node <node-name>
```

## Cluster Events

```bash
kubectl get events
```

## Current Context

```bash
kubectl config current-context
```
