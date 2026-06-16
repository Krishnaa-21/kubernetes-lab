# Job Commands

This document contains commonly used commands for creating, monitoring, troubleshooting, and deleting Kubernetes Jobs.

---

# Create Job

Apply the Job manifest:

```bash
kubectl apply -f job.yml
```

Verify:

```bash
kubectl get jobs
```

---

# Get Jobs

List all Jobs:

```bash
kubectl get jobs
```

Short form:

```bash
kubectl get job
```

Example Output:

```text
NAME        COMPLETIONS   DURATION   AGE
hello-job   1/1           5s         10s
```

---

# Describe Job

View detailed information:

```bash
kubectl describe job hello-job
```

Useful Information:

* Completions
* Parallelism
* Events
* Pod Status
* Failures

---

# View Pods Created by Job

List Pods:

```bash
kubectl get pods
```

Example:

```text
hello-job-7v6ws
```

Detailed Output:

```bash
kubectl get pods -o wide
```

Watch in Real Time:

```bash
kubectl get pods -w
```

---

# View Job Logs

Find Pod Name:

```bash
kubectl get pods
```

View Logs:

```bash
kubectl logs <pod-name>
```

Example:

```bash
kubectl logs hello-job-7v6ws
```

Output:

```text
Hello Kubernetes
```

---

# Get Job YAML

View Job Configuration:

```bash
kubectl get job hello-job -o yaml
```

Save Backup:

```bash
kubectl get job hello-job -o yaml > job-backup.yaml
```

---

# Get Job JSON

```bash
kubectl get job hello-job -o json
```

---

# Delete Job

Delete a Job:

```bash
kubectl delete job hello-job
```

---

# Delete Job Using Manifest

```bash
kubectl delete -f job.yml
```

---

# Delete Completed Jobs

Delete all completed Jobs:

```bash
kubectl delete jobs --all
```

---

# Create Job from CronJob

Run a Job manually from an existing CronJob:

```bash
kubectl create job manual-backup --from=cronjob/db-backup
```

Verify:

```bash
kubectl get jobs
```

---

# Monitor Job Completion

Watch Job Status:

```bash
kubectl get jobs -w
```

Example:

```text
NAME        COMPLETIONS
hello-job   0/1

hello-job   1/1
```

---

# Check Job Events

Describe Job:

```bash
kubectl describe job hello-job
```

Look for:

```text
Events:
SuccessfulCreate
Completed
Failed
```

---

# Test Failed Job

Check Failed Pods:

```bash
kubectl get pods
```

Describe Failed Pod:

```bash
kubectl describe pod <pod-name>
```

View Logs:

```bash
kubectl logs <pod-name>
```

---

# Restart a Job

Jobs cannot be restarted directly.

Delete and recreate:

```bash
kubectl delete job hello-job
kubectl apply -f job.yml
```

Alternative:

```bash
kubectl create job --from=job/hello-job hello-job-v2
```

---

# View Successful Jobs

```bash
kubectl get jobs
```

Example:

```text
NAME        COMPLETIONS
hello-job   1/1
```

Completed means:

```text
Job Successful
```

---

# View Failed Jobs

```bash
kubectl get jobs
```

Describe Job:

```bash
kubectl describe job hello-job
```

Check Failure Details:

```bash
kubectl logs <pod-name>
```

---

# Access Pod Shell

Bash:

```bash
kubectl exec -it <pod-name> -- /bin/bash
```

Sh:

```bash
kubectl exec -it <pod-name> -- /bin/sh
```

Useful for debugging.

---

# View Cluster Events

List Events:

```bash
kubectl get events
```

Sort by Time:

```bash
kubectl get events --sort-by=.metadata.creationTimestamp
```

---

# Namespace Specific Commands

Create Job:

```bash
kubectl apply -f job.yml -n batch
```

Get Jobs:

```bash
kubectl get jobs -n batch
```

Describe Job:

```bash
kubectl describe job hello-job -n batch
```

Delete Job:

```bash
kubectl delete job hello-job -n batch
```

---

# Troubleshooting Commands

Describe Job:

```bash
kubectl describe job hello-job
```

Describe Pod:

```bash
kubectl describe pod <pod-name>
```

Check Logs:

```bash
kubectl logs <pod-name>
```

View Events:

```bash
kubectl get events
```

Check YAML:

```bash
kubectl get job hello-job -o yaml
```

---

# Quick Reference

```bash
kubectl apply -f job.yml
kubectl get jobs
kubectl describe job hello-job
kubectl get pods
kubectl logs <pod-name>
kubectl get jobs -w
kubectl get job hello-job -o yaml
kubectl delete job hello-job
kubectl get events
```

---

# Most Important Commands for Interviews

```bash
kubectl apply -f job.yml
kubectl get jobs
kubectl describe job hello-job
kubectl get pods
kubectl logs <pod-name>
kubectl delete job hello-job
```

These commands demonstrate:

* Job Creation
* Job Monitoring
* Viewing Logs
* Troubleshooting
* Job Deletion

---

# Common Verification Commands

Check Jobs:

```bash
kubectl get jobs
```

Check Pods:

```bash
kubectl get pods
```

Check Logs:

```bash
kubectl logs <pod-name>
```

Check Events:

```bash
kubectl get events
```

Check Detailed Status:

```bash
kubectl describe job hello-job
```

These commands are the most frequently used while working with Kubernetes Jobs in real-world environments.
