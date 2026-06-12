# Deployment Commands

This file contains commonly used commands for working with Kubernetes Deployments.

---

# Create Deployment

Apply the deployment manifest:

```bash
kubectl apply -f deployment.yml
```

---

# Get Deployments

List all deployments in the current namespace:

```bash
kubectl get deployments
```

Short form:

```bash
kubectl get deploy
```

---

# Describe Deployment

View detailed information about a deployment:

```bash
kubectl describe deployment nginx-deployment
```

---

# Get Pods

View all pods created by the deployment:

```bash
kubectl get pods
```

Watch pods in real time:

```bash
kubectl get pods -w
```

---

# Get ReplicaSets

View ReplicaSets managed by the deployment:

```bash
kubectl get replicasets
```

Short form:

```bash
kubectl get rs
```

---

# Scale Deployment

Scale deployment to 5 replicas:

```bash
kubectl scale deployment nginx-deployment --replicas=5
```

Scale deployment to 2 replicas:

```bash
kubectl scale deployment nginx-deployment --replicas=2
```

---

# Edit Deployment

Modify deployment configuration directly:

```bash
kubectl edit deployment nginx-deployment
```

---

# Update Deployment Image

Update container image without modifying YAML:

```bash
kubectl set image deployment/nginx-deployment nginx=nginx:1.26
```

Syntax:

```bash
kubectl set image deployment/<deployment-name> <container-name>=<image-name>
```

---

# Check Rollout Status

Monitor deployment progress:

```bash
kubectl rollout status deployment nginx-deployment
```

---

# View Rollout History

Show deployment revision history:

```bash
kubectl rollout history deployment nginx-deployment
```

---

# Rollback Deployment

Rollback to previous revision:

```bash
kubectl rollout undo deployment nginx-deployment
```

Rollback to a specific revision:

```bash
kubectl rollout undo deployment nginx-deployment --to-revision=2
```

---

# Restart Deployment

Perform a rolling restart:

```bash
kubectl rollout restart deployment nginx-deployment
```

---

# Pause Deployment

Pause rollout updates:

```bash
kubectl rollout pause deployment nginx-deployment
```

---

# Resume Deployment

Resume paused rollout:

```bash
kubectl rollout resume deployment nginx-deployment
```

---

# Get Deployment YAML

View deployment manifest in YAML format:

```bash
kubectl get deployment nginx-deployment -o yaml
```

---

# Get Deployment JSON

View deployment manifest in JSON format:

```bash
kubectl get deployment nginx-deployment -o json
```

---

# View Logs

Logs from a pod:

```bash
kubectl logs <pod-name>
```

Follow logs continuously:

```bash
kubectl logs -f <pod-name>
```

---

# Execute Command Inside Pod

Open interactive shell:

```bash
kubectl exec -it <pod-name> -- /bin/bash
```

If bash is unavailable:

```bash
kubectl exec -it <pod-name> -- /bin/sh
```

---

# Delete Deployment

Delete deployment:

```bash
kubectl delete deployment nginx-deployment
```

Short form:

```bash
kubectl delete deploy nginx-deployment
```

---

# Delete Deployment Using Manifest

```bash
kubectl delete -f deployment.yml
```

---

# Namespace Specific Commands

Get deployments from a namespace:

```bash
kubectl get deployments -n dev
```

Create deployment in a namespace:

```bash
kubectl apply -f deployment.yml -n dev
```

Delete deployment from a namespace:

```bash
kubectl delete deployment nginx-deployment -n dev
```

---

# Troubleshooting Commands

Check deployment events:

```bash
kubectl describe deployment nginx-deployment
```

Check pod events:

```bash
kubectl describe pod <pod-name>
```

Check cluster events:

```bash
kubectl get events
```

Sort events by time:

```bash
kubectl get events --sort-by=.metadata.creationTimestamp
```

---

# Quick Reference

```bash
kubectl apply -f deployment.yml
kubectl get deployments
kubectl get pods
kubectl get rs
kubectl describe deployment nginx-deployment
kubectl scale deployment nginx-deployment --replicas=5
kubectl rollout status deployment nginx-deployment
kubectl rollout history deployment nginx-deployment
kubectl rollout undo deployment nginx-deployment
kubectl rollout restart deployment nginx-deployment
kubectl edit deployment nginx-deployment
kubectl delete deployment nginx-deployment
```
