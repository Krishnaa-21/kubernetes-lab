# 🚀 Kubernetes ReplicaSet

> 🎯 Ensure the right number of Pods are always running — automatically. Built-in self-healing. Zero manual intervention.

![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![YAML](https://img.shields.io/badge/YAML-CB171E?style=for-the-badge&logo=yaml&logoColor=white)
![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)

---

## 📖 Overview

A **ReplicaSet** is a Kubernetes controller that maintains a stable set of identical Pods running at all times.

Its primary responsibility is simple:

> 💬 *"Keep the desired number of Pod replicas running — always."*

If a Pod crashes, is deleted, or becomes unavailable, the ReplicaSet **automatically** creates a replacement Pod to restore the desired state.

---

## 🎯 Why ReplicaSets Matter

### ✅ All Pods Healthy

```text
┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│  🟢  Pod 1   │   │  🟢  Pod 2   │   │  🟢  Pod 3   │
└──────────────┘   └──────────────┘   └──────────────┘
```

### 💥 One Pod Crashes

```text
┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│  🟢  Pod 1   │   │  🔴  Pod 2   │   │  🟢  Pod 3   │
└──────────────┘   └──────────────┘   └──────────────┘
```

### 🔄 ReplicaSet Detects Mismatch

```text
Desired Pods = 3
Current Pods = 2
             ↓
     Creating new Pod...
```

### ✅ State Restored Automatically

```text
┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│  🟢  Pod 1   │   │  🔵  Pod 2′  │   │  🟢  Pod 3   │
└──────────────┘   └──────────────┘   └──────────────┘
```

> 🩺 This capability is known as **Self-Healing**.

---

## 🏗 Architecture

```text
              🎛  ReplicaSet
                     │
       ┌─────────────┼─────────────┐
       ▼             ▼             ▼
   📦 Pod 1      📦 Pod 2      📦 Pod 3
```

> The ReplicaSet continuously **watches** Pods and ensures the desired count is always maintained.

---

## 🎬 Real-World Analogy

> 🧑‍💼 Imagine a company manager has a rule:
>
> *"There must always be 5 support engineers available."*

| Situation | Engineers | Action |
|-----------|-----------|--------|
| Normal | 5 ✅ | Nothing — desired state met |
| One resigns | 4 ⚠️ | Manager hires a new one |
| Restored | 5 ✅ | Back to desired state |

> The manager doesn't care **who** the engineer is — only that the **count** is maintained.
> 
> 🤖 That manager behaves exactly like a **ReplicaSet**.

---

## 📂 Project Structure

```text
02-ReplicaSet/
│
├── 📄 README.md
├── 📝 notes.md
├── ⌨️  commands.md
├── 📋 replicaset.yml
└── 🖼  images/
```

---

## 📝 ReplicaSet Manifest

```yaml
apiVersion: apps/v1
kind: ReplicaSet

metadata:
  name: nginx-rs

spec:
  replicas: 3          # 👈 desired pod count

  selector:
    matchLabels:
      app: nginx       # 👈 matches pods with this label

  template:
    metadata:
      labels:
        app: nginx     # 👈 must match selector above

    spec:
      containers:
        - name: nginx
          image: nginx:latest
```

---

## 🔍 Understanding the Workflow

```text
  ReplicaSet Created
          │
          ▼
    Creates 3 Pods
          │
          ▼
  Monitors Pod Health
          │
          ▼
     Pod Fails? ──── No ──→ Keep Watching
          │
         Yes
          │
          ▼
    Create New Pod
          │
          ▼
  Desired State Restored ✅
```

---

## ⚡ Essential Commands

### 📌 Create ReplicaSet

```bash
kubectl apply -f replicaset.yml
```

### 📌 Verify ReplicaSet

```bash
kubectl get rs
```

**Expected Output:**

```text
NAME       DESIRED   CURRENT   READY
nginx-rs   3         3         3
```

### 📌 View Pods

```bash
kubectl get pods
```

**Output:**

```text
nginx-rs-ab123   1/1   Running   0   2m
nginx-rs-cd456   1/1   Running   0   2m
nginx-rs-ef789   1/1   Running   0   2m
```

### 📌 Inspect ReplicaSet

```bash
kubectl describe rs nginx-rs
```

> Shows: Events, Labels, Selectors, Pod Status, Container Images, Replica Count

---

## 🛡 Self-Healing Demonstration

**Step 1 — Delete a Pod manually:**

```bash
kubectl delete pod nginx-rs-ab123
```

**Step 2 — Check Pods again:**

```bash
kubectl get pods
```

**Step 3 — Observe a new Pod appears automatically!**

```text
Desired Pods = 3
Current Pods = 2
      ↓
ReplicaSet spawns a new Pod
      ↓
Current Pods = 3 ✅
```

---

## 📈 Scaling ReplicaSets

### ⬆️ Scale Up to 5

```bash
kubectl scale rs nginx-rs --replicas=5
```

```text
📦 Pod 1   📦 Pod 2   📦 Pod 3   🆕 Pod 4   🆕 Pod 5
```

### ⬇️ Scale Down to 2

```bash
kubectl scale rs nginx-rs --replicas=2
```

```text
📦 Pod 1   📦 Pod 2
(3 pods removed automatically)
```

---

## 🏷 Labels and Selectors

ReplicaSets use **Labels** and **Selectors** to identify which Pods they own.

### Selector (in ReplicaSet spec)

```yaml
selector:
  matchLabels:
    app: nginx
```

### Pod Label (in template)

```yaml
labels:
  app: nginx
```

### How Matching Works

```text
Selector ──→ app=nginx
Pod Label ─→ app=nginx
               │
               ▼
           ✅ Match!
    ReplicaSet manages this Pod
```

| Match? | Result |
|--------|--------|
| ✅ Labels match selector | ReplicaSet **manages** the Pod |
| ❌ Labels don't match | ReplicaSet **ignores** the Pod |

---

## ⚠️ ReplicaSet vs Pod

| Feature | 📦 Pod | 🎛 ReplicaSet |
|---------|--------|--------------|
| Runs Containers | ✅ | ✅ |
| Self-Healing | ❌ | ✅ |
| Maintains Desired Count | ❌ | ✅ |
| Scaling | ❌ | ✅ |
| Automatic Recovery | ❌ | ✅ |

---

## 🚀 ReplicaSet vs Deployment

| Feature | 🎛 ReplicaSet | 🚀 Deployment |
|---------|--------------|--------------|
| Pod Management | ✅ | ✅ |
| Self-Healing | ✅ | ✅ |
| Scaling | ✅ | ✅ |
| Rolling Updates | ❌ | ✅ |
| Rollbacks | ❌ | ✅ |
| Production Ready | ⚠️ Limited | ✅ Yes |

---

## 🔗 Relationship with Deployments

In real-world environments, engineers **rarely** create ReplicaSets directly.

```text
🚀 Deployment          ← You create this
      │
      ▼
🎛  ReplicaSet         ← Auto-created by Deployment
      │
      ▼
📦  Pods               ← Created & monitored by ReplicaSet
```

> A Deployment automatically creates and manages ReplicaSets behind the scenes.

---

## 🎓 Learning Outcomes

After completing this section, you should be able to:

- [x] 🏗 Understand ReplicaSet architecture
- [x] ✏️ Create ReplicaSets from YAML manifests
- [x] 📈 Scale applications up and down
- [x] 🩺 Perform self-healing demonstrations
- [x] 🏷 Use labels and selectors effectively
- [x] 🔍 Troubleshoot ReplicaSets
- [x] 🔗 Understand the relationship between ReplicaSets and Deployments

---

## 💡 Key Takeaways

| # | Takeaway |
|---|----------|
| 1 | 🎯 ReplicaSet ensures the desired number of Pods are always running |
| 2 | 🩺 It automatically replaces failed or deleted Pods |
| 3 | 🏷 It uses labels and selectors to identify Pods |
| 4 | 📈 It supports application scaling |
| 5 | 🔗 Deployments internally use ReplicaSets |
| 6 | 🏗 ReplicaSets are a foundational Kubernetes controller |

---

## ⭐ Golden Rule

```text
╔══════════════════════════════════════════════════╗
║                                                  ║
║   A Pod can run an application.                  ║
║                                                  ║
║   A ReplicaSet ensures the application           ║
║   keeps running.                                 ║
║                                                  ║
║   A Deployment manages the ReplicaSet.           ║
║                                                  ║
╚══════════════════════════════════════════════════╝

      📦 Pod  →  🎛 ReplicaSet  →  🚀 Deployment
```

> Mastering ReplicaSets is the first step toward understanding how Kubernetes achieves **high availability** and **reliability**.

---

<div align="center">

Made with ❤️ for Kubernetes learners

⭐ Star this repo if it helped you!

</div>