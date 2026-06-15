# StatefulSet Commands

This document contains the most commonly used commands for creating, managing, scaling, and troubleshooting Kubernetes StatefulSets.

---

# Create StatefulSet

Apply the StatefulSet manifest:

```bash
kubectl apply -f statefulset.yml
```

---

# Get StatefulSets

List all StatefulSets:

```bash
kubectl get statefulsets
```

Short form:

```bash
kubectl get sts
```

Example Output:

```text
NAME      READY   AGE
mysql     3/3     5m
```

---

# Describe StatefulSet

View detailed information:

```bash
kubectl describe sts mysql
```

Useful for:

* Events
* Replica count
* Selectors
* Pod status
* Storage details

---

# View StatefulSet Pods

List Pods created by StatefulSet:

```bash
kubectl get pods
```

Example:

```text
mysql-0
mysql-1
mysql-2
```

Detailed output:

```bash
kubectl get pods -o wide
```

Watch Pods in real time:

```bash
kubectl get pods -w
```

---

# Scale StatefulSet

Scale up:

```bash
kubectl scale sts mysql --replicas=5
```

Scale down:

```bash
kubectl scale sts mysql --replicas=2
```

Verify:

```bash
kubectl get sts
```

---

# Edit StatefulSet

Modify StatefulSet directly:

```bash
kubectl edit sts mysql
```

Common changes:

* replicas
* image
* resource limits

---

# Update Container Image

Update image:

```bash
kubectl set image statefulset/mysql mysql=mysql:8.0
```

Syntax:

```bash
kubectl set image statefulset/<sts-name> <container-name>=<image>
```

Verify rollout:

```bash
kubectl rollout status statefulset/mysql
```

---

# Restart StatefulSet

Perform rolling restart:

```bash
kubectl rollout restart statefulset/mysql
```

---

# Check Rollout Status

Monitor rollout progress:

```bash
kubectl rollout status statefulset/mysql
```

---

# View Rollout History

Show rollout history:

```bash
kubectl rollout history statefulset/mysql
```

---

# Undo Rollout

Rollback StatefulSet:

```bash
kubectl rollout undo statefulset/mysql
```

---

# Get StatefulSet YAML

View YAML definition:

```bash
kubectl get sts mysql -o yaml
```

Save backup:

```bash
kubectl get sts mysql -o yaml > statefulset-backup.yaml
```

---

# Get StatefulSet JSON

```bash
kubectl get sts mysql -o json
```

---

# View Persistent Volume Claims

List PVCs:

```bash
kubectl get pvc
```

Example:

```text
NAME                STATUS
data-mysql-0        Bound
data-mysql-1        Bound
data-mysql-2        Bound
```

---

# View Persistent Volumes

```bash
kubectl get pv
```

Detailed output:

```bash
kubectl get pv -o wide
```

---

# Check Storage Usage

Describe PVC:

```bash
kubectl describe pvc data-mysql-0
```

Describe PV:

```bash
kubectl describe pv <pv-name>
```

---

# Test Stateful Identity

Delete a Pod:

```bash
kubectl delete pod mysql-1
```

Watch recreation:

```bash
kubectl get pods -w
```

Expected result:

```text
mysql-1
```

The Pod returns with the same name.

---

# Verify Pod Hostnames

Open shell:

```bash
kubectl exec -it mysql-0 -- hostname
```

Output:

```text
mysql-0
```

Check another Pod:

```bash
kubectl exec -it mysql-1 -- hostname
```

Output:

```text
mysql-1
```

---

# Access Pod Shell

Bash shell:

```bash
kubectl exec -it mysql-0 -- /bin/bash
```

Sh shell:

```bash
kubectl exec -it mysql-0 -- /bin/sh
```

---

# View Logs

Logs from Pod:

```bash
kubectl logs mysql-0
```

Follow logs:

```bash
kubectl logs -f mysql-0
```

Previous container logs:

```bash
kubectl logs --previous mysql-0
```

---

# Check Events

View cluster events:

```bash
kubectl get events
```

Sort by time:

```bash
kubectl get events --sort-by=.metadata.creationTimestamp
```

---

# Troubleshooting

Describe StatefulSet:

```bash
kubectl describe sts mysql
```

Describe Pod:

```bash
kubectl describe pod mysql-0
```

Describe PVC:

```bash
kubectl describe pvc data-mysql-0
```

Check logs:

```bash
kubectl logs mysql-0
```

---

# Delete StatefulSet

Delete StatefulSet only:

```bash
kubectl delete sts mysql
```

Delete using manifest:

```bash
kubectl delete -f statefulset.yml
```

---

# Delete StatefulSet and PVCs

Delete StatefulSet:

```bash
kubectl delete sts mysql
```

Delete PVCs manually:

```bash
kubectl delete pvc --all
```

⚠️ Be careful: deleting PVCs may permanently remove application data.

---

# Namespace Specific Commands

Create StatefulSet:

```bash
kubectl apply -f statefulset.yml -n database
```

Get StatefulSets:

```bash
kubectl get sts -n database
```

Describe StatefulSet:

```bash
kubectl describe sts mysql -n database
```

Delete StatefulSet:

```bash
kubectl delete sts mysql -n database
```

---

# Quick Reference

```bash
kubectl apply -f statefulset.yml
kubectl get sts
kubectl describe sts mysql
kubectl get pods
kubectl get pvc
kubectl get pv
kubectl scale sts mysql --replicas=5
kubectl rollout restart statefulset/mysql
kubectl rollout status statefulset/mysql
kubectl exec -it mysql-0 -- hostname
kubectl logs mysql-0
kubectl delete pod mysql-1
kubectl delete sts mysql
```

---

# Most Important Commands for Interviews

```bash
kubectl get sts
kubectl describe sts mysql
kubectl get pvc
kubectl scale sts mysql --replicas=5
kubectl delete pod mysql-1
kubectl rollout status statefulset/mysql
kubectl exec -it mysql-0 -- hostname
```

These commands demonstrate:

* StatefulSet creation
* Scaling
* Stable Pod identity
* Persistent storage
* Troubleshooting
* Rollout management
