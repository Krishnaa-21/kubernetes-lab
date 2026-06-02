# Kubernetes Architecture

## High Level Architecture

```
                Kubernetes Cluster
┌────────────────────────────────────────────┐
│                                            │
│            Control Plane                   │
│                                            │
│  kube-apiserver                            │
│  etcd                                      │
│  kube-scheduler                            │
│  kube-controller-manager                   │
│                                            │
└────────────────────────────────────────────┘
                   │
                   │
    ┌──────────────┼──────────────┐
    │              │              │
    ▼              ▼              ▼

Worker Node   Worker Node   Worker Node

   kubelet       kubelet       kubelet
   kube-proxy    kube-proxy    kube-proxy
   Pods          Pods          Pods
```

## Control Plane Components

### kube-apiserver

Acts as the front-end of the Kubernetes control plane.

### etcd

Stores cluster data and configuration.

### kube-scheduler

Assigns Pods to Worker Nodes.

### kube-controller-manager

Maintains the desired cluster state.

## Worker Node Components

### kubelet

Communicates with the control plane.

### kube-proxy

Handles networking and service communication.

### Container Runtime

Runs containers inside Pods.
