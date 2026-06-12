# Kubernetes Deployment Notes

## What is a Deployment?

A Deployment is a Kubernetes resource used to manage and maintain Pods.

Instead of creating Pods directly, we usually create a Deployment because it provides additional features such as:

* Pod management
* Self-healing
* Scaling
* Rolling updates
* Rollbacks

Think of a Deployment as a manager whose job is to ensure the desired number of Pods are always running.

---

## Why Do We Need Deployments?

Suppose we create a Pod directly:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
    - name: nginx
      image: nginx
```

If this Pod crashes or gets deleted, Kubernetes will not recreate it automatically.

Now imagine this application is serving thousands of users. A single Pod failure would make the application unavailable.

This is where Deployments help.

A Deployment continuously monitors the state of Pods and ensures the desired state is maintained.

---

## Real-Life Analogy

Imagine a company has a requirement:

> We need 3 customer support employees available at all times.

The company manager keeps checking:

* If one employee leaves, hire another.
* If business grows, hire more employees.
* If business slows down, reduce the workforce.

In Kubernetes:

* Employees = Pods
* Manager = Deployment

The Deployment continuously ensures the required number of Pods are available.

---

## Basic Deployment Example

```yaml
apiVersion: apps/v1
kind: Deployment

metadata:
  name: nginx-deployment

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
          ports:
            - containerPort: 80
```

---

## Understanding Each Section

### apiVersion

```yaml
apiVersion: apps/v1
```

Specifies which Kubernetes API version is being used.

Deployments belong to the `apps/v1` API group.

---

### kind

```yaml
kind: Deployment
```

Defines the type of Kubernetes resource we are creating.

In this case, it is a Deployment.

---

### metadata

```yaml
metadata:
  name: nginx-deployment
```

Provides information about the resource.

The Deployment name is:

```text
nginx-deployment
```

---

### replicas

```yaml
replicas: 3
```

Defines how many Pod copies should be running.

Desired state:

```text
Pod 1
Pod 2
Pod 3
```

If one Pod dies:

```text
Pod 1
Pod 2
Pod X
```

Deployment automatically creates a replacement Pod.

---

### selector

```yaml
selector:
  matchLabels:
    app: nginx
```

The Deployment needs to know which Pods it manages.

It uses labels for this purpose.

Any Pod with:

```yaml
app: nginx
```

will be managed by this Deployment.

---

### template

The template section describes how new Pods should be created.

```yaml
template:
```

Whenever Deployment creates a new Pod, it follows this blueprint.

---

### Labels

```yaml
labels:
  app: nginx
```

Labels act like tags attached to resources.

Example:

```yaml
app: nginx
environment: production
team: backend
```

Labels help Kubernetes identify and organize resources.

---

### Containers

```yaml
containers:
  - name: nginx
    image: nginx:latest
```

Defines which container will run inside the Pod.

Container Name:

```text
nginx
```

Image:

```text
nginx:latest
```

---

## Creating the Deployment

Apply the Deployment:

```bash
kubectl apply -f deployment.yml
```

Verify:

```bash
kubectl get deployments
```

Output:

```text
NAME               READY   UP-TO-DATE   AVAILABLE
nginx-deployment   3/3     3            3
```

---

## Checking Pods

```bash
kubectl get pods
```

Example:

```text
nginx-deployment-7fd8b6b4c9-abc12
nginx-deployment-7fd8b6b4c9-def34
nginx-deployment-7fd8b6b4c9-ghi56
```

Notice that the Deployment created the Pods automatically.

---

## Scaling a Deployment

Increase replicas:

```bash
kubectl scale deployment nginx-deployment --replicas=5
```

Result:

```text
Pod 1
Pod 2
Pod 3
Pod 4
Pod 5
```

Reduce replicas:

```bash
kubectl scale deployment nginx-deployment --replicas=2
```

Result:

```text
Pod 1
Pod 2
```

Extra Pods are removed automatically.

---

## Updating a Deployment

Suppose we want to upgrade Nginx.

Current:

```yaml
image: nginx:1.25
```

New:

```yaml
image: nginx:1.26
```

Apply again:

```bash
kubectl apply -f deployment.yml
```

Deployment performs a Rolling Update.

---

## What is a Rolling Update?

Instead of stopping all Pods at once:

❌ Bad

```text
Stop all old Pods
Start all new Pods
```

This causes downtime.

Deployment follows:

✅ Good

```text
Create new Pod
Wait until healthy
Remove one old Pod
Repeat
```

Users experience little or no downtime.

---

## Rollback

If a new version has issues:

Check history:

```bash
kubectl rollout history deployment nginx-deployment
```

Rollback:

```bash
kubectl rollout undo deployment nginx-deployment
```

Deployment restores the previous stable version.

---

## Useful Commands

Create Deployment

```bash
kubectl apply -f deployment.yml
```

List Deployments

```bash
kubectl get deployments
```

Describe Deployment

```bash
kubectl describe deployment nginx-deployment
```

View Pods

```bash
kubectl get pods
```

Scale Deployment

```bash
kubectl scale deployment nginx-deployment --replicas=5
```

View Rollout Status

```bash
kubectl rollout status deployment nginx-deployment
```

View History

```bash
kubectl rollout history deployment nginx-deployment
```

Rollback

```bash
kubectl rollout undo deployment nginx-deployment
```

Delete Deployment

```bash
kubectl delete deployment nginx-deployment
```

---

## Key Interview Points

* Deployment manages Pods.
* Deployment uses ReplicaSets internally.
* Deployments provide self-healing.
* Deployments support scaling.
* Deployments support rolling updates.
* Deployments support rollback.
* Pods are usually not created directly in production.
* Deployments are the standard way to run stateless applications in Kubernetes.

---

## Quick Summary

A Deployment is a Kubernetes controller that ensures the desired number of Pods are always running. It automatically recreates failed Pods, scales applications, performs rolling updates, and supports rollbacks, making it the preferred way to run applications in Kubernetes.
