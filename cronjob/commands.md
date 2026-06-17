# CronJob Commands

This document contains the most commonly used commands for creating, monitoring, troubleshooting, and managing Kubernetes CronJobs.

---

# Create CronJob

Apply the CronJob manifest:

```bash
kubectl apply -f cronjob.yml
```

Verify:

```bash
kubectl get cronjobs
```

Short form:

```bash
kubectl get cj
```

---

# Get CronJobs

List all CronJobs:

```bash
kubectl get cronjobs
```

Short form:

```bash
kubectl get cj
```

Example Output:

```text
NAME         SCHEDULE      SUSPEND
backup-job   0 2 * * *     False
```

---

# Describe CronJob

View detailed information:

```bash
kubectl describe cronjob backup-job
```

Useful Information:

* Schedule
* Last Schedule Time
* Active Jobs
* Events
* Concurrency Policy

---

# View Jobs Created by CronJob

List Jobs:

```bash
kubectl get jobs
```

Example:

```text
backup-job-28736211
backup-job-28736212
backup-job-28736213
```

Each execution creates a new Job.

---

# View Pods Created by Jobs

List Pods:

```bash
kubectl get pods
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

# View Logs

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
kubectl logs backup-job-28736211-x4lm2
```

---

# Get CronJob YAML

View CronJob Configuration:

```bash
kubectl get cronjob backup-job -o yaml
```

Save Backup:

```bash
kubectl get cronjob backup-job -o yaml > cronjob-backup.yaml
```

---

# Get CronJob JSON

```bash
kubectl get cronjob backup-job -o json
```

---

# Edit CronJob

Modify CronJob directly:

```bash
kubectl edit cronjob backup-job
```

Common Changes:

* schedule
* suspend
* concurrencyPolicy
* history limits

---

# Suspend CronJob

Pause execution:

```bash
kubectl patch cronjob backup-job \
-p '{"spec":{"suspend":true}}'
```

Verify:

```bash
kubectl get cronjobs
```

Output:

```text
SUSPEND = True
```

---

# Resume CronJob

Enable execution again:

```bash
kubectl patch cronjob backup-job \
-p '{"spec":{"suspend":false}}'
```

Verify:

```bash
kubectl get cronjobs
```

Output:

```text
SUSPEND = False
```

---

# Delete CronJob

Delete CronJob:

```bash
kubectl delete cronjob backup-job
```

Short form:

```bash
kubectl delete cj backup-job
```

---

# Delete Using Manifest

```bash
kubectl delete -f cronjob.yml
```

---

# Create Manual Job from CronJob

Useful for testing.

Create Job manually:

```bash
kubectl create job manual-backup \
--from=cronjob/backup-job
```

Verify:

```bash
kubectl get jobs
```

---

# Monitor CronJob

Watch CronJobs:

```bash
kubectl get cronjobs -w
```

Watch Jobs:

```bash
kubectl get jobs -w
```

Watch Pods:

```bash
kubectl get pods -w
```

---

# View Active Jobs

```bash
kubectl get jobs
```

Filter by CronJob:

```bash
kubectl get jobs | grep backup-job
```

---

# View Job History

List Jobs:

```bash
kubectl get jobs
```

Example:

```text
backup-job-28736211
backup-job-28736212
backup-job-28736213
```

These represent previous CronJob executions.

---

# View Events

Check Cluster Events:

```bash
kubectl get events
```

Sort by Time:

```bash
kubectl get events \
--sort-by=.metadata.creationTimestamp
```

---

# Troubleshooting

Describe CronJob:

```bash
kubectl describe cronjob backup-job
```

Describe Job:

```bash
kubectl describe job <job-name>
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

---

# Namespace Specific Commands

Create CronJob:

```bash
kubectl apply -f cronjob.yml -n batch
```

Get CronJobs:

```bash
kubectl get cronjobs -n batch
```

Describe CronJob:

```bash
kubectl describe cronjob backup-job -n batch
```

Delete CronJob:

```bash
kubectl delete cronjob backup-job -n batch
```

---

# Check Schedule

View Schedule:

```bash
kubectl get cronjob backup-job
```

Detailed View:

```bash
kubectl describe cronjob backup-job
```

Example:

```text
Schedule: 0 2 * * *
```

---

# Check Last Run Time

```bash
kubectl describe cronjob backup-job
```

Example:

```text
Last Schedule Time:
```

Useful for verifying execution.

---

# Cleanup Old Jobs

Delete Specific Job:

```bash
kubectl delete job <job-name>
```

Delete All Jobs:

```bash
kubectl delete jobs --all
```

---

# Quick Reference

```bash
kubectl apply -f cronjob.yml
kubectl get cronjobs
kubectl get cj
kubectl describe cronjob backup-job
kubectl get jobs
kubectl get pods
kubectl logs <pod-name>
kubectl edit cronjob backup-job
kubectl create job manual-backup --from=cronjob/backup-job
kubectl delete cronjob backup-job
```

---

# Most Important Commands for Interviews

```bash
kubectl apply -f cronjob.yml
kubectl get cronjobs
kubectl describe cronjob backup-job
kubectl get jobs
kubectl get pods
kubectl logs <pod-name>
kubectl create job manual-backup --from=cronjob/backup-job
kubectl delete cronjob backup-job
```

These commands demonstrate:

* CronJob Creation
* Schedule Verification
* Job Creation
* Pod Monitoring
* Log Analysis
* Troubleshooting
* CronJob Management

---

# Common Verification Commands

Check CronJobs:

```bash
kubectl get cronjobs
```

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
kubectl describe cronjob backup-job
```

These are the commands most frequently used when working with Kubernetes CronJobs in real-world environments.
