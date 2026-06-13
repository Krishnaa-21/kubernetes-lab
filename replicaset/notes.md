# Kubernetes ReplicaSet Notes

## What is a ReplicaSet?

A ReplicaSet is a Kubernetes controller responsible for maintaining a specified number of identical Pods running at all times.

Its primary job is simple:

> Ensure the desired number of Pod replicas are always available.

If a Pod fails, crashes, or is deleted, the ReplicaSet automatically creates a new Pod to replace it.

---

## Why Do We Need ReplicaSets?

Imagine you have an application running on 3 Pods.

```text
Pod 1 ✅
Pod 2 ✅
Pod 3 ✅
```

Desired state:

```text
3 Pods Running
```

Now suppose Pod 2 crashes.

```text
Pod 1 ✅
Pod 2 ❌
Pod 3 ✅
```

The ReplicaSet notices that only 2 Pods are running.

Since the desired state is 3 Pods, it automatically creates a replacement Pod.

```text
Pod 1 ✅
Pod 2 ✅ (New)
Pod 3 ✅
```

The desired state is restored.

---

## Real-Life Analogy

Think of a classroom.

The principal says:

> "There must always be 30 students in this class."

If one student leaves:

```text
Students = 29
```

The principal immediately admits another student.

```text
Students = 30
```

The principal is behaving like a ReplicaSet.

The principal does not care who the student is.

The principal only cares about maintaining the required count.

---

## Responsibilities of a ReplicaSet

A ReplicaSet is responsible for:

* Maintaining desired Pod count
* Creating Pods
* Deleting extra Pods
* Replacing failed Pods
* Monitoring Pod availability

A ReplicaSet is NOT responsible for:

* Rolling Updates
* Rollbacks
* Deployment Strategies

These responsibilities belong to Deployments.

---

## Basic ReplicaSet Manifest

```yaml
apiVersion: apps/v1
kind: ReplicaSet

metadata:
  name: nginx-rs

spec:
  replicas: 3

  selector:
    matchLabels:
      app: nginx

  template:
    metadata:
      labels:
        app: nginx

    spec:
      containers:
        - name: nginx
          image: nginx:latest
```

---

## Understanding Each Section

### apiVersion

```yaml
apiVersion: apps/v1
```

Specifies the API group for ReplicaSet resources.

---

### kind

```yaml
kind: ReplicaSet
```

Tells Kubernetes that we are creating a ReplicaSet.

---

### metadata

```yaml
metadata:
  name: nginx-rs
```

Defines the name of the ReplicaSet.

---

### replicas

```yaml
replicas: 3
```

Desired number of Pods.

Kubernetes continuously ensures that exactly 3 Pods remain available.

---

### selector

```yaml
selector:
  matchLabels:
    app: nginx
```

The selector tells the ReplicaSet which Pods belong to it.

ReplicaSets identify Pods using labels.

---

### template

```yaml
template:
```

Acts as a blueprint for creating new Pods.

Whenever a Pod needs replacement, Kubernetes uses this template.

---

## Label Selector Relationship

ReplicaSet:

```yaml
selector:
  matchLabels:
    app: nginx
```

Pod Template:

```yaml
labels:
  app: nginx
```

The selector and labels must match.

If they don't match, ReplicaSet cannot manage the Pods.

---

## Creating a ReplicaSet

Apply the manifest:

```bash
kubectl apply -f replicaset.yml
```

Verify:

```bash
kubectl get rs
```

Example:

```text
NAME       DESIRED   CURRENT   READY
nginx-rs   3         3         3
```

---

## Checking Pods

View Pods created by the ReplicaSet:

```bash
kubectl get pods
```

Example:

```text
nginx-rs-6f5d7f9d7d-ab123
nginx-rs-6f5d7f9d7d-cd456
nginx-rs-6f5d7f9d7d-ef789
```

---

## Self-Healing Demonstration

Delete one Pod:

```bash
kubectl delete pod <pod-name>
```

Example:

```bash
kubectl delete pod nginx-rs-6f5d7f9d7d-ab123
```

Immediately check Pods again:

```bash
kubectl get pods
```

You will notice a new Pod has been created automatically.

Reason:

```text
Desired Pods = 3
Current Pods = 2
```

ReplicaSet detected the mismatch and restored the desired state.

---

## Scaling ReplicaSets

Increase replicas:

```bash
kubectl scale rs nginx-rs --replicas=5
```

Result:

```text
5 Pods Running
```

Decrease replicas:

```bash
kubectl scale rs nginx-rs --replicas=2
```

Result:

```text
2 Pods Running
```

Extra Pods are removed automatically.

---

## Viewing Detailed Information

```bash
kubectl describe rs nginx-rs
```

Useful information includes:

* Pod count
* Events
* Labels
* Selectors
* Container images

---

## Deleting a ReplicaSet

Delete only ReplicaSet:

```bash
kubectl delete rs nginx-rs
```

This removes:

* ReplicaSet
* Associated Pods

---

## ReplicaSet Architecture

```text
            ReplicaSet
                 │
                 │
      ┌──────────┼──────────┐
      │          │          │
      ▼          ▼          ▼

    Pod 1      Pod 2      Pod 3
```

The ReplicaSet continuously monitors all Pods and ensures the desired count is maintained.

---

## ReplicaSet vs Pod

| Feature                 | Pod | ReplicaSet |
| ----------------------- | --- | ---------- |
| Runs Containers         | ✅   | ✅          |
| Self-Healing            | ❌   | ✅          |
| Maintains Desired Count | ❌   | ✅          |
| Automatic Recovery      | ❌   | ✅          |
| Scaling Support         | ❌   | ✅          |

---

## ReplicaSet vs Deployment

| Feature             | ReplicaSet | Deployment |
| ------------------- | ---------- | ---------- |
| Maintains Pod Count | ✅          | ✅          |
| Self-Healing        | ✅          | ✅          |
| Scaling             | ✅          | ✅          |
| Rolling Updates     | ❌          | ✅          |
| Rollbacks           | ❌          | ✅          |
| Production Usage    | Rare       | Common     |

---

## Important Interview Point

In real-world Kubernetes environments:

> We rarely create ReplicaSets directly.

Instead:

```text
Deployment
    │
    ▼
ReplicaSet
    │
    ▼
Pods
```

Deployments automatically create and manage ReplicaSets.

This provides additional capabilities such as rolling updates and rollbacks.

---

## Key Takeaways

* ReplicaSet ensures a specified number of Pods are always running.
* It automatically replaces failed or deleted Pods.
* It uses labels and selectors to identify Pods.
* It supports scaling applications.
* It provides self-healing capabilities.
* Deployments internally use ReplicaSets.
* In production environments, Deployments are preferred over direct ReplicaSet creation.

---

## Quick Summary

A ReplicaSet is a Kubernetes controller that maintains the desired number of Pod replicas. If Pods fail, are deleted, or become unavailable, the ReplicaSet automatically creates replacements to keep the application running consistently.
