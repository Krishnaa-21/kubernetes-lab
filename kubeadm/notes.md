# kubeadm Notes

## What is kubeadm?

kubeadm is an official Kubernetes tool used to bootstrap and manage Kubernetes clusters.

It simplifies the process of creating a Kubernetes cluster by automating the setup of Kubernetes control plane components and worker node configuration.

kubeadm is commonly used for:

* Learning Kubernetes Administration
* Building Production-Like Clusters
* Certification Practice (CKA, CKAD)
* On-Premises Kubernetes Deployments
* Multi-Node Cluster Setup

---

## Why kubeadm?

Setting up Kubernetes manually is complex because multiple components need to be installed and configured.

kubeadm automates this process while still providing administrators with control over cluster configuration.

Benefits:

* Easy Cluster Initialization
* Standardized Deployment Method
* Production-Oriented Setup
* Supports Multi-Node Clusters
* Officially Maintained by Kubernetes

---

## Purpose of kubeadm

The primary purpose of kubeadm is to create and manage Kubernetes clusters.

It helps administrators:

* Initialize Control Plane Nodes
* Join Worker Nodes
* Upgrade Clusters
* Manage Certificates
* Configure Cluster Networking

---

## How kubeadm Works

A typical kubeadm cluster consists of:

```text
                 Control Plane
                       │
        ┌──────────────┼──────────────┐
        │              │              │
        ▼              ▼              ▼

    Worker-1      Worker-2      Worker-3
```

The Control Plane manages the cluster while Worker Nodes run application workloads.

---

## Prerequisites

Before using kubeadm:

### Operating System

* Ubuntu
* CentOS
* Debian
* RHEL

### Container Runtime

* containerd (Recommended)
* CRI-O

### Required Tools

* kubeadm
* kubelet
* kubectl

### Network Requirements

* Unique hostname for each node
* Proper DNS resolution
* Required ports open

---

## Kubernetes Components Installed

When a cluster is initialized using kubeadm, the following components are configured:

### Control Plane Components

#### kube-apiserver

Acts as the front-end of Kubernetes.

#### etcd

Stores cluster data and state information.

#### kube-scheduler

Assigns Pods to Nodes.

#### kube-controller-manager

Maintains the desired cluster state.

---

### Worker Node Components

#### kubelet

Communicates with the API Server and manages Pods.

#### kube-proxy

Handles networking and service communication.

#### Container Runtime

Runs containers inside Pods.

---

## kubeadm Cluster Setup Workflow

### Step 1

Install:

* kubeadm
* kubelet
* kubectl

### Step 2

Initialize the Control Plane.

```bash
sudo kubeadm init
```

### Step 3

Configure kubectl.

### Step 4

Install a CNI Plugin.

Examples:

* Calico
* Flannel
* Cilium

### Step 5

Join Worker Nodes.

```bash
sudo kubeadm join ...
```

### Step 6

Verify Cluster Status.

```bash
kubectl get nodes
```

---

## CNI Plugins

Kubernetes does not include networking by default.

A CNI (Container Network Interface) plugin is required.

Popular options:

### Calico

* Most Popular
* Network Policies Support
* Production Ready

### Flannel

* Easy Setup
* Beginner Friendly

### Cilium

* Advanced Networking
* eBPF Based

---

## Advantages of kubeadm

### Production-Oriented

Creates clusters similar to real production environments.

### Official Kubernetes Tool

Maintained by the Kubernetes project.

### Multi-Node Support

Supports multiple worker nodes.

### Better Understanding

Helps learn Kubernetes internals and administration.

### Flexible

Allows custom cluster configurations.

---

## Limitations of kubeadm

### More Complex

Requires more setup compared to Minikube and Kind.

### Manual Configuration

Networking and cluster management require additional steps.

### Infrastructure Required

Usually needs multiple VMs or servers for realistic setups.

### Maintenance Responsibility

The administrator is responsible for cluster upgrades and maintenance.

---

## kubeadm vs Kind vs Minikube

| Feature               | kubeadm                  | Kind               | Minikube               |
| --------------------- | ------------------------ | ------------------ | ---------------------- |
| Purpose               | Production-Like Clusters | Testing & Learning | Learning & Development |
| Multi-Node            | Excellent                | Excellent          | Limited                |
| Resource Usage        | High                     | Low                | Medium                 |
| Complexity            | High                     | Low                | Low                    |
| Production Similarity | High                     | Medium             | Low                    |
| Beginner Friendly     | Moderate                 | High               | High                   |

---

## Common Use Cases

### Learning Cluster Administration

Understanding Kubernetes internals.

### Certification Preparation

Useful for:

* CKA
* CKAD
* CKS

### Home Lab

Creating local multi-node clusters.

### On-Premises Deployments

Deploying Kubernetes without cloud providers.

---

## Best Practices

* Use containerd as the container runtime.
* Install a CNI plugin immediately after cluster initialization.
* Regularly back up etcd.
* Monitor cluster health.
* Use RBAC for access control.
* Keep Kubernetes versions updated.

---

## Summary

kubeadm is the official Kubernetes cluster bootstrapping tool used to create production-like Kubernetes environments. It provides greater control and a deeper understanding of Kubernetes architecture compared to Kind and Minikube, making it an essential tool for Kubernetes administrators and DevOps engineers.
