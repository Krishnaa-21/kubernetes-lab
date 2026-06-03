# ☸️ Pods

<div align="center">

<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg" width="120px" />

<h2>🚀 Kubernetes Pods - Smallest Deployable Unit</h2>

<p>
  <img src="https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white" />
  <img src="https://img.shields.io/badge/Pods-Workloads-00C9A7?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Level-Beginner-success?style=for-the-badge" />
</p>

<p>
  <img src="https://img.shields.io/badge/Focus-Pod_Architecture-blue?style=flat-square" />
  <img src="https://img.shields.io/badge/Concept-Kubernetes_Workloads-orange?style=flat-square" />
  <img src="https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square" />
</p>

</div>

---

## 📖 Overview

<table>
<tr>
<td>

A **Pod** is the **smallest deployable unit** in Kubernetes.

Pods are the basic building blocks of Kubernetes applications and serve as a wrapper around one or more containers.

Kubernetes does not manage containers directly. Instead, containers run inside **Pods**.

</td>
</tr>
</table>

---

## ❓ Why Pods?

Containers are lightweight and portable, but managing containers individually becomes difficult at scale.

Pods provide:

<table>
<tr>
<td width="50%">

- 🌐 A shared network environment  
- 💾 Shared storage volumes  
- ⚙️ Resource management  

</td>
<td width="50%">

- 🚀 Simplified application deployment  
- 🧩 Better orchestration capabilities  

</td>
</tr>
</table>

---

## 🎯 Purpose

<div align="center">

<img src="https://img.shields.io/badge/Pod-Purpose-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white" />

</div>

<br>

Pods are used to:

- 📦 Run containerized applications
- 🧱 Host one or more containers
- 🔗 Enable communication between containers
- ⚙️ Manage application workloads
- ☸️ Provide deployment units for Kubernetes

---

## 🏗️ Pod Architecture

<div align="center">

<img src="https://img.shields.io/badge/Pod-Architecture-00C9A7?style=for-the-badge" />

</div>

```text
+-------------------------+
|          Pod            |
|                         |
|  +-------------------+  |
|  |     Container     |  |
|  |       Nginx       |  |
|  +-------------------+  |
|                         |
| Shared Network & Volume |
+-------------------------+
```

A Pod can contain:

<table>
<tr>
<td align="center" width="50%">

### 📦 Single Container

One container running inside a Pod.

</td>
<td align="center" width="50%">

### 📦📦 Multiple Containers

Multiple containers running together inside a Pod.

</td>
</tr>
</table>

---

## 🧩 Types of Pods

### 📦 Single Container Pod

The most common type.

```text
Pod
└── Nginx Container
```

---

### 📦📦 Multi Container Pod

Multiple containers running together in a single Pod.

```text
Pod
├── Application Container
└── Sidecar Container
```

---

## 🔄 Pod Lifecycle

<div align="center">

<img src="https://img.shields.io/badge/Pod-Lifecycle-orange?style=for-the-badge&logo=target&logoColor=white" />

</div>

```text
Pending
   ↓
Running
   ↓
Succeeded
   ↓
Failed
```

<br>

<table>
<tr>
<th>Phase</th>
<th>Description</th>
</tr>
<tr>
<td>🟡 <strong>Pending</strong></td>
<td>Pod is accepted but containers are not yet running.</td>
</tr>
<tr>
<td>🟢 <strong>Running</strong></td>
<td>Pod is running successfully.</td>
</tr>
<tr>
<td>🔵 <strong>Succeeded</strong></td>
<td>All containers completed successfully.</td>
</tr>
<tr>
<td>🔴 <strong>Failed</strong></td>
<td>One or more containers failed.</td>
</tr>
<tr>
<td>⚪ <strong>Unknown</strong></td>
<td>Pod state cannot be determined.</td>
</tr>
</table>

---

## 🔑 Key Characteristics

<div align="center">

<img src="https://img.shields.io/badge/Key-Characteristics-9B59B6?style=for-the-badge" />

</div>

<br>

<table>
<tr>
<td width="50%">

### 🧱 Smallest Deployable Unit

Pods are the smallest objects that can be created in Kubernetes.

### 🌐 Unique IP Address

Each Pod receives its own IP address.

</td>
<td width="50%">

### 🔗 Shared Networking

Containers inside the same Pod share:

- IP Address
- Network Namespace
- Ports

### 💾 Shared Storage

Containers can share volumes attached to the Pod.

</td>
</tr>
</table>

---

## ✅ Advantages

<table>
<tr>
<td width="50%">

### 🚀 Easy Deployment

Applications can be deployed quickly.

### 🔗 Resource Sharing

Containers can share storage and networking.

</td>
<td width="50%">

### ⚙️ Better Management

Kubernetes manages Pods instead of individual containers.

### 📈 Scalability

Pods can be replicated using ReplicaSets and Deployments.

</td>
</tr>
</table>

---

## ⚠️ Limitations

<table>
<tr>
<td width="50%">

### ⏳ Ephemeral Nature

Pods are temporary and can be recreated.

### 🛠️ Not Self-Healing Alone

If a Pod fails, Kubernetes needs higher-level controllers like Deployments to recreate it.

</td>
<td width="50%">

### 📉 Limited Scaling

Pods themselves do not handle scaling.

</td>
</tr>
</table>

---

## 🎯 Learning Objectives

<div align="center">

<img src="https://img.shields.io/badge/Learning-Objectives-FF9800?style=for-the-badge&logo=target&logoColor=white" />

</div>

<br>

After completing this section, you should be able to:

<table>
<tr>
<td width="50%">

- ✅ Understand Pod Architecture
- ✅ Create Pods
- ✅ Inspect Pods
- ✅ View Logs

</td>
<td width="50%">

- ✅ Execute Commands Inside Pods
- ✅ Work With Multi-Container Pods
- ✅ Understand Pod Lifecycle

</td>
</tr>
</table>

---

## 📁 Related Files

<div align="center">

<img src="https://img.shields.io/badge/Directory-Structure-4CAF50?style=for-the-badge&logo=files&logoColor=white" />

</div>

<br>

```text
03-pods/
│
├── README.md
├── notes.md
├── commands.md
├── pod.yaml
├── multi-container-pod.yaml
├── pod-lifecycle.md
└── images/
```

<br>

<div align="center">

| File | Purpose |
| ---- | ------- |
| `README.md` | Overview of Kubernetes Pods |
| `notes.md` | Detailed Pod notes |
| `commands.md` | Pod-related kubectl commands |
| `pod.yaml` | Single container Pod manifest |
| `multi-container-pod.yaml` | Multi-container Pod manifest |
| `pod-lifecycle.md` | Pod lifecycle explanation |
| `images/` | Related diagrams and screenshots |

</div>

---

## 📝 Summary

<table>
<tr>
<td>

Pods are the **foundation of Kubernetes workloads**. Every application deployed in Kubernetes ultimately runs inside a Pod.

Understanding Pods is essential before learning **ReplicaSets, Deployments, Services, and other Kubernetes resources**.

</td>
</tr>
</table>

---

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:326CE5,100:00C9A7&height=3&section=footer" />

<br>

### ☸️ Learn Pods. Understand Workloads. Build Kubernetes Skills.

<br>

<img src="https://img.shields.io/badge/Happy-Learning!-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white" />

</div>
