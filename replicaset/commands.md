# ReplicaSet Commands

This document contains the most commonly used commands for creating, managing, scaling, and troubleshooting Kubernetes ReplicaSets.

---

# Create ReplicaSet

Apply the ReplicaSet manifest:

```bash
kubectl apply -f replicaset.yml
```

---

# Get ReplicaSets

List all ReplicaSets in the current namespace:

```bash
kubectl get replicasets
```

Short form:

```bash
kubectl get rs
```

Example Output:

```text
NAME       DESIRED   CURRENT   READY
nginx-rs   3         3         3
```

---

# Describe ReplicaSet

View detailed information:

```bash
kubectl describe rs nginx-rs
```

Useful for:

* Events
* Labels
* Selectors
* Pod status
* Troubleshooting

---

# View Pods Created by ReplicaSet

```bash
kubectl get pods
```

More details:

```bash
kubectl get pods -o wide
```

Watch Pods in real time:

```bash
kubectl get pods -w
```

---

# Scale ReplicaSet

Increase replicas:

```bash
kubectl scale rs nginx-rs --replicas=5
```

Decrease replicas:

```bash
kubectl scale rs nginx-rs --replicas=2
```

Verify:

```bash
kubectl get rs
```

---

# Edit ReplicaSet

Modify ReplicaSet directly:

```bash
kubectl edit rs nginx-rs
```

Common changes:

* replicas
* labels
* selectors

---

# Get ReplicaSet YAML

View resource definition:

```bash
kubectl get rs nginx-rs -o yaml
```

Save YAML to a file:

```bash
kubectl get rs nginx-rs -o yaml > replicaset-backup.yaml
```

---

# Get ReplicaSet JSON

```bash
kubectl get rs nginx-rs -o json
```

---

# Delete ReplicaSet

Delete ReplicaSet and managed Pods:

```bash
kubectl delete rs nginx-rs
```

---

# Delete Using Manifest

```bash
kubectl delete -f replicaset.yml
```

---

# Test Self-Healing

List Pods:

```bash
kubectl get pods
```

Delete a Pod:

```bash
kubectl delete pod <pod-name>
```

Example:

```bash
kubectl delete pod nginx-rs-7d8f4c6c8d-xk2qv
```

Check Pods again:

```bash
kubectl get pods
```

A new Pod will be created automatically.

---

# View Labels

Show labels attached to ReplicaSets:

```bash
kubectl get rs --show-labels
```

Show labels for Pods:

```bash
kubectl get pods --show-labels
```

---

# View Events

Check cluster events:

```bash
kubectl get events
```

Sort by latest events:

```bash
kubectl get events --sort-by=.metadata.creationTimestamp
```

---

# Troubleshooting

Describe ReplicaSet:

```bash
kubectl describe rs nginx-rs
```

Describe Pod:

```bash
kubectl describe pod <pod-name>
```

Check Pod logs:

```bash
kubectl logs <pod-name>
```

---

# Namespace Specific Commands

Create ReplicaSet in a namespace:

```bash
kubectl apply -f replicaset.yml -n dev
```

Get ReplicaSets from a namespace:

```bash
kubectl get rs -n dev
```

Describe ReplicaSet:

```bash
kubectl describe rs nginx-rs -n dev
```

Delete ReplicaSet:

```bash
kubectl delete rs nginx-rs -n dev
```

---

# Quick Reference

```bash
kubectl apply -f replicaset.yml
kubectl get rs
kubectl describe rs nginx-rs
kubectl get pods
kubectl get pods -w
kubectl scale rs nginx-rs --replicas=5
kubectl edit rs nginx-rs
kubectl get rs nginx-rs -o yaml
kubectl delete pod <pod-name>
kubectl delete rs nginx-rs
kubectl get events
```

---

# Exam & Interview Commands

Most frequently asked and used commands:

```bash
kubectl get rs
kubectl describe rs nginx-rs
kubectl scale rs nginx-rs --replicas=5
kubectl delete pod <pod-name>
kubectl get pods
```

These commands demonstrate:

* ReplicaSet creation
* Scaling
* Self-healing
* Monitoring
* Troubleshooting
