# Minikube Notes

## What is Minikube?

Minikube is a tool that allows users to run a local Kubernetes cluster on a single machine.

It is designed for:

* Learning Kubernetes
* Local Development
* Testing Applications
* Experimenting with Kubernetes Features

Minikube creates a local Kubernetes cluster using a virtual machine or container runtime such as Docker.

---

## Why Use Minikube?

Before deploying applications to production Kubernetes clusters, developers often need a local environment for testing.

Minikube provides:

* Easy Kubernetes setup
* Lightweight local cluster
* Fast experimentation
* Built-in addons
* Kubernetes dashboard support

---

## Minikube Architecture

```text
+-----------------------+
|      Minikube         |
|                       |
|  Kubernetes Cluster   |
|                       |
|  Control Plane        |
|  Worker Node          |
|                       |
+-----------------------+
```

Unlike production environments, Minikube typically runs the control plane and worker node on the same machine.

---

## Components Installed

When Minikube starts a cluster, it automatically configures:

* kube-apiserver
* etcd
* kube-scheduler
* kube-controller-manager
* kubelet
* kube-proxy

---

## Drivers

Minikube supports multiple drivers.

Common drivers:

### Docker Driver

Runs Minikube inside Docker containers.

```bash
minikube start --driver=docker
```

### Virtual Machine Drivers

Examples:

* VirtualBox
* Hyper-V
* KVM
* VMware

---

## Important Minikube Commands

Start Cluster

```bash
minikube start
```

Check Status

```bash
minikube status
```

View Nodes

```bash
kubectl get nodes
```

Stop Cluster

```bash
minikube stop
```

Delete Cluster

```bash
minikube delete
```

---

## Minikube Dashboard

Minikube provides a built-in Kubernetes Dashboard.

Launch Dashboard:

```bash
minikube dashboard
```

The dashboard helps visualize:

* Pods
* Deployments
* Services
* Nodes
* Namespaces

---

## Minikube Addons

Minikube includes several addons.

Examples:

* ingress
* dashboard
* metrics-server
* storage-provisioner

Enable an addon:

```bash
minikube addons enable ingress
```

List addons:

```bash
minikube addons list
```

---

## Advantages of Minikube

* Beginner Friendly
* Easy Installation
* Local Development Environment
* Supports Kubernetes Addons
* Good for Testing and Learning

---

## Limitations of Minikube

* Not intended for Production
* Usually Single Node
* Limited Resource Availability
* Does not fully represent large production clusters

---

## Minikube vs Kind

| Feature            | Minikube               | Kind                          |
| ------------------ | ---------------------- | ----------------------------- |
| Purpose            | Learning & Development | Kubernetes Testing & Learning |
| Runs On            | VM / Docker            | Docker Containers             |
| Multi Node Support | Limited                | Excellent                     |
| Resource Usage     | Higher                 | Lower                         |
| Setup Complexity   | Easy                   | Easy                          |

---

## Summary

Minikube is a lightweight Kubernetes environment designed for local development and learning. It provides a quick way to create and manage a Kubernetes cluster without requiring cloud infrastructure or multiple servers.
