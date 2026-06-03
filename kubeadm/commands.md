# kubeadm Commands

## Check Versions

### Check kubeadm Version

```bash
kubeadm version
```

### Check kubectl Version

```bash
kubectl version --client
```

### Check kubelet Version

```bash
kubelet --version
```

---

## Initialize Cluster

### Initialize Control Plane

```bash
sudo kubeadm init
```

### Initialize With Pod Network CIDR

For Calico:

```bash
sudo kubeadm init \
--pod-network-cidr=192.168.0.0/16
```

For Flannel:

```bash
sudo kubeadm init \
--pod-network-cidr=10.244.0.0/16
```

---

## Configure kubectl

Run these commands after successful cluster initialization.

```bash
mkdir -p $HOME/.kube
```

```bash
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
```

```bash
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

---

## Cluster Information

### View Cluster Information

```bash
kubectl cluster-info
```

### View Nodes

```bash
kubectl get nodes
```

### Detailed Node Information

```bash
kubectl describe node <node-name>
```

---

## Worker Node Operations

### Generate Join Command

```bash
kubeadm token create --print-join-command
```

### Join Worker Node

Example:

```bash
sudo kubeadm join 192.168.1.10:6443 \
--token <token> \
--discovery-token-ca-cert-hash sha256:<hash>
```

---

## Pod Operations

### View All Pods

```bash
kubectl get pods -A
```

### View Pods in Current Namespace

```bash
kubectl get pods
```

### Describe Pod

```bash
kubectl describe pod <pod-name>
```

### View Pod Logs

```bash
kubectl logs <pod-name>
```

---

## Namespace Operations

### List Namespaces

```bash
kubectl get namespaces
```

### Create Namespace

```bash
kubectl create namespace demo
```

---

## Networking

### Check CNI Pods

```bash
kubectl get pods -n kube-system
```

### Apply Calico

```bash
kubectl apply -f calico.yaml
```

### Apply Flannel

```bash
kubectl apply -f kube-flannel.yml
```

---

## Cluster Troubleshooting

### Check Cluster Components

```bash
kubectl get componentstatuses
```

### Check Events

```bash
kubectl get events
```

### Check System Pods

```bash
kubectl get pods -n kube-system
```

### Check kubelet Status

```bash
systemctl status kubelet
```

### View kubelet Logs

```bash
journalctl -u kubelet -f
```

---

## Reset Cluster

### Reset kubeadm Cluster

```bash
sudo kubeadm reset
```

### Remove Kubernetes Configuration

```bash
rm -rf $HOME/.kube
```

---

## Useful Commands

### View All Resources

```bash
kubectl get all
```

### View API Resources

```bash
kubectl api-resources
```

### View API Versions

```bash
kubectl api-versions
```

### Current Context

```bash
kubectl config current-context
```

---

## Quick Verification Checklist

```bash
kubectl cluster-info

kubectl get nodes

kubectl get pods -A

systemctl status kubelet

kubectl get namespaces
```
