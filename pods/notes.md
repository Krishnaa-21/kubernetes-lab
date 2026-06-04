# Pod Notes

## What is a Pod?

A Pod is the smallest deployable unit in Kubernetes.

It represents a running instance of an application within a Kubernetes cluster.

A Pod can contain:

* One Container (Most Common)
* Multiple Containers

Kubernetes does not deploy containers directly. Instead, containers are always deployed inside Pods.

---

## Why Do We Need Pods?

Containers are lightweight and portable, but Kubernetes requires a higher-level abstraction to manage them efficiently.

Pods provide:

* Shared Networking
* Shared Storage
* Resource Allocation
* Container Coordination

Without Pods, Kubernetes would need to manage each container individually.

---

## Purpose of Pods

Pods are used to:

* Run Applications
* Host Containers
* Share Resources
* Deploy Workloads
* Enable Container Communication

Pods act as the execution environment for containers in Kubernetes.

---

## Pod Architecture

### Single Container Pod

```text
+-------------------+
|       Pod         |
|                   |
|  +-------------+  |
|  |    Nginx    |  |
|  | Container   |  |
|  +-------------+  |
+-------------------+
```

Most Pods contain a single container.

---

### Multi Container Pod

```text
+---------------------------+
|           Pod             |
|                           |
|  +---------+  +--------+  |
|  |  App    |  |Logger  |  |
|  |Container|  |Container| |
|  +---------+  +--------+  |
+---------------------------+
```

Multiple containers work together inside the same Pod.

---

## Pod Components

### Metadata

Contains information about the Pod.

Examples:

* Name
* Labels
* Namespace

### Spec

Defines the desired state of the Pod.

Examples:

* Container Image
* Ports
* Volumes

### Status

Represents the current state of the Pod.

Examples:

* Running
* Pending
* Failed

---

## Pod Lifecycle

A Pod moves through several phases.

```text
Pending
   ↓
Running
   ↓
Succeeded
   ↓
Failed
```

---

### Pending

The Pod has been accepted by Kubernetes but containers have not started yet.

Possible reasons:

* Image Pulling
* Scheduling Delays

---

### Running

The Pod is running successfully.

Containers are healthy and operational.

---

### Succeeded

All containers completed successfully.

Common for Jobs and Batch Processing.

---

### Failed

One or more containers failed.

The workload did not complete successfully.

---

### Unknown

Kubernetes cannot determine the Pod status.

Usually caused by communication issues.

---

## Shared Network

All containers inside a Pod share:

* Same IP Address
* Same Network Namespace
* Same Port Space

Example:

```text
Pod IP: 10.244.0.5

Container A
Container B

Both use the same Pod IP.
```

---

## Shared Storage

Containers inside a Pod can share storage using Volumes.

Example:

```text
Pod
│
├── Container A
├── Container B
│
└── Shared Volume
```

This allows containers to exchange files and data.

---

## Pod Scheduling

Pods are scheduled onto Nodes by the Kubernetes Scheduler.

Process:

```text
Create Pod
     ↓
API Server
     ↓
Scheduler
     ↓
Worker Node
     ↓
Pod Running
```

---

## Pod YAML Structure

Every Pod manifest contains:

```yaml
apiVersion: v1
kind: Pod

metadata:
  name: nginx-pod

spec:
  containers:
  - name: nginx
    image: nginx
```

---

## Important Fields

### apiVersion

Defines the Kubernetes API version.

```yaml
apiVersion: v1
```

### kind

Defines the object type.

```yaml
kind: Pod
```

### metadata

Stores Pod information.

```yaml
metadata:
  name: nginx-pod
```

### spec

Defines the desired state.

```yaml
spec:
```

### containers

List of containers inside the Pod.

```yaml
containers:
```

### image

Container image to use.

```yaml
image: nginx
```

---

## Advantages of Pods

### Simplified Deployment

Containers are managed as a single unit.

### Shared Resources

Networking and storage can be shared.

### Better Management

Kubernetes manages Pods efficiently.

### Supports Sidecar Pattern

Allows helper containers to run alongside applications.

---

## Limitations of Pods

### Temporary Nature

Pods are ephemeral.

If a Pod is deleted, it is recreated with a different identity.

### No Automatic Scaling

Pods alone cannot scale applications.

### No Self-Healing

Pods require Deployments or ReplicaSets for automatic recovery.

---

## Real-World Examples

### Web Server Pod

```text
Pod
└── Nginx Container
```

### Logging Sidecar

```text
Pod
├── Application Container
└── Logging Container
```

### Monitoring Sidecar

```text
Pod
├── Application Container
└── Monitoring Container
```

---

## Best Practices

* Use one main application per Pod.
* Keep Pods lightweight.
* Use labels for organization.
* Define resource limits.
* Use Deployments instead of standalone Pods for production workloads.

---

## Key Takeaways

* Pod is the smallest deployable unit in Kubernetes.
* Kubernetes manages Pods, not containers directly.
* Pods can contain one or more containers.
* Containers inside a Pod share networking and storage.
* Pods are temporary and are typically managed by higher-level controllers such as Deployments and ReplicaSets.
