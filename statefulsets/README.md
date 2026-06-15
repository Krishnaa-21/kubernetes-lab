```markdown
<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=180&section=header&text=Kubernetes%20StatefulSet&fontSize=45&fontColor=fff&animation=twinkling&fontAlignY=32" width="100%"/>

<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="500">

<h1>☸️ Kubernetes StatefulSet</h1>
<h3><em>Master Stateful Applications with Stable Identity & Persistent Storage</em></h3>

<br>

<img src="https://img.shields.io/badge/Kubernetes-StatefulSet-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white"/> <img src="https://img.shields.io/badge/Level-Intermediate-FF6B6B?style=for-the-badge&logo=levelup&logoColor=white"/> <img src="https://img.shields.io/badge/Status-Complete-4CAF50?style=for-the-badge&logo=checkmarx&logoColor=white"/>

<br>

<blockquote>🚀 <strong>Manage stateful applications</strong> with stable identities, persistent storage, and predictable deployment behavior in Kubernetes.</blockquote>

<br>

<img src="https://user-images.githubusercontent.com/74038190/212284100-561aa473-3905-4a80-b561-0d28506553ee.gif" width="800">

</div>

<br>

## 📖 Overview

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

A **StatefulSet** is a Kubernetes workload resource designed for applications that require:

<table>
<tr>
<td align="center" width="16%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Identification%20Card.png" width="40"><br><strong>Stable Pod Names</strong></td>
<td align="center" width="16%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Globe%20with%20Meridians.png" width="40"><br><strong>Stable Network Identity</strong></td>
<td align="center" width="16%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Package.png" width="40"><br><strong>Persistent Storage</strong></td>
<td align="center" width="16%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Hourglass%20Done.png" width="40"><br><strong>Ordered Deployment</strong></td>
<td align="center" width="16%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Upwards%20Button.png" width="40"><br><strong>Ordered Scaling</strong></td>
<td align="center" width="16%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Wastebasket.png" width="40"><br><strong>Ordered Termination</strong></td>
</tr>
</table>

<br>

<blockquote>💡 <strong>Key Insight:</strong> Unlike Deployments, StatefulSets ensure that each Pod maintains its <strong>unique identity</strong> throughout its lifecycle.</blockquote>

<br>

---

<br>

## 🎯 Why StatefulSets?

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

### 🌐 Stateless Applications

Most web applications are stateless.

**Examples:**

```text
Nginx
React Frontend
Node.js API
Spring Boot API
```

**Characteristics:**

- ✅ Any Pod can handle requests
- ✅ Pod identity does not matter
- ✅ Requests are interchangeable
- ✅ Easy horizontal scaling

**Use:** `Deployment`

<br>

### 🗄️ Stateful Applications

Databases and distributed systems are different.

**Examples:**

```text
MySQL
PostgreSQL
MongoDB
Redis Cluster
Kafka
Elasticsearch
ZooKeeper
```

**Requirements:**

- ✅ Consistent hostnames
- ✅ Persistent storage
- ✅ Predictable startup order
- ✅ Stable network identities

**Use:** `StatefulSet`

<br>

---

<br>

## 🚀 Deployment vs StatefulSet

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

<table>
<tr>
<td width="50%">

### 📦 Deployment

```text
Deployment
      │
      ▼

app-a8d92
app-x3f12
app-k7m55
```

If a Pod crashes:

```text
app-new123
```

A completely new Pod is created.

**Identity changes.**

</td>
<td width="50%">

### 🗄️ StatefulSet

```text
StatefulSet
      │
      ▼

mysql-0
mysql-1
mysql-2
```

If `mysql-1` crashes:

```text
mysql-1
```

The Pod is recreated with the same identity.

**Identity remains stable.**

</td>
</tr>
</table>

<br>

---

<br>

## 🏗️ Architecture

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

```text
                    StatefulSet
                          │
                          ▼

        ┌─────────────────────────┐
        │        mysql-0          │
        └─────────────────────────┘
                    │
                    ▼
                 PVC-0

        ┌─────────────────────────┐
        │        mysql-1          │
        └─────────────────────────┘
                    │
                    ▼
                 PVC-1

        ┌─────────────────────────┐
        │        mysql-2          │
        └─────────────────────────┘
                    │
                    ▼
                 PVC-2
```

<br>

### ✨ Each Pod Receives

<table>
<tr>
<td align="center" width="33%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Identification%20Card.png" width="60"><br><strong>Unique Identity</strong><br><code>mysql-0, mysql-1, mysql-2</code></td>
<td align="center" width="33%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Package.png" width="60"><br><strong>Dedicated Storage</strong><br><code>PVC-0, PVC-1, PVC-2</code></td>
<td align="center" width="33%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Globe%20with%20Meridians.png" width="60"><br><strong>Persistent Data</strong><br><sub>Data survives Pod restarts</sub></td>
</tr>
</table>

<br>

---

<br>

## 🎬 Real-World Analogy

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

### 🏢 Company Database Team

```text
DB-Server-1
DB-Server-2
DB-Server-3
```

Each server:

- ✅ Has its own hostname
- ✅ Has its own storage
- ✅ Stores important data

If DB-Server-2 restarts:

```text
DB-Server-2
```

It comes back with the **same identity** and **same storage**.

StatefulSet works exactly like this.

<br>

---

<br>

## 📝 Basic StatefulSet Example

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

```yaml
apiVersion: apps/v1
kind: StatefulSet

metadata:
  name: nginx

spec:
  serviceName: nginx-service
  replicas: 3

  selector:
    matchLabels:
      app: nginx

  template:
    metadata:
      labels:
        app: nginx

    spec:
      containers:
        - name: nginx
          image: nginx:latest
```

<br>

---

<br>

## ⭐ Key Features

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

### 1️⃣ Stable Pod Names

Pods receive predictable names:

```text
nginx-0
nginx-1
nginx-2
```

These names **never change** across restarts.

<br>

### 2️⃣ Stable Network Identity

Each Pod gets a stable DNS name:

```text
nginx-0.nginx-service.default.svc.cluster.local
nginx-1.nginx-service.default.svc.cluster.local
nginx-2.nginx-service.default.svc.cluster.local
```

Applications can reliably communicate with each other.

<br>

### 3️⃣ Persistent Storage

Each Pod receives its own Persistent Volume Claim (PVC):

```text
nginx-0 → PVC-0
nginx-1 → PVC-1
nginx-2 → PVC-2
```

Even if the Pod is recreated, the data remains safe.

<br>

### 4️⃣ Ordered Pod Creation

Pods are created sequentially:

```text
nginx-0 → Ready
   ↓
nginx-1 → Ready
   ↓
nginx-2 → Ready
```

The next Pod starts only after the previous Pod is ready.

<br>

### 5️⃣ Ordered Pod Deletion

Pods terminate in reverse order:

```text
nginx-2 → Terminating
   ↓
nginx-1 → Terminating
   ↓
nginx-0 → Terminating
```

This is critical for clustered databases.

<br>

---

<br>

## 🚀 Deploy StatefulSet

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

### Apply Configuration

```bash
kubectl apply -f statefulset.yml
```

### Verify StatefulSet

```bash
kubectl get sts
```

**Expected Output:**

```text
NAME    READY   AGE
nginx   3/3     1m
```

### Check Pods

```bash
kubectl get pods
```

**Output:**

```text
NAME      READY   STATUS    RESTARTS   AGE
nginx-0   1/1     Running   0          1m
nginx-1   1/1     Running   0          1m
nginx-2   1/1     Running   0          1m
```

Notice the **predictable names**.

<br>

---

<br>

## 💾 Storage Persistence

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

```text
mysql-0
   │
   ▼
PVC-0
   │
   ▼
Persistent Volume

mysql-1
   │
   ▼
PVC-1
   │
   ▼
Persistent Volume
```

Each Pod owns its own storage.

This makes StatefulSets perfect for databases.

<br>

---

<br>

## 📊 Deployment vs StatefulSet

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

<table>
<tr>
<th>Feature</th>
<th>Deployment</th>
<th>StatefulSet</th>
</tr>
<tr>
<td><strong>Stable Pod Name</strong></td>
<td align="center">❌</td>
<td align="center">✅</td>
</tr>
<tr>
<td><strong>Stable Network Identity</strong></td>
<td align="center">❌</td>
<td align="center">✅</td>
</tr>
<tr>
<td><strong>Persistent Storage</strong></td>
<td align="center">Optional</td>
<td align="center">Common</td>
</tr>
<tr>
<td><strong>Ordered Startup</strong></td>
<td align="center">❌</td>
<td align="center">✅</td>
</tr>
<tr>
<td><strong>Ordered Shutdown</strong></td>
<td align="center">❌</td>
<td align="center">✅</td>
</tr>
<tr>
<td><strong>Database Workloads</strong></td>
<td align="center">❌</td>
<td align="center">✅</td>
</tr>
<tr>
<td><strong>Web Applications</strong></td>
<td align="center">✅</td>
<td align="center">❌</td>
</tr>
<tr>
<td><strong>Pod Identity</strong></td>
<td align="center">Random</td>
<td align="center">Fixed</td>
</tr>
<tr>
<td><strong>Scaling Behavior</strong></td>
<td align="center">Parallel</td>
<td align="center">Sequential</td>
</tr>
</table>

<br>

---

<br>

## 🌍 Common Use Cases

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

### 🗄️ Databases

<table>
<tr>
<td align="center"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Database.png" width="50"><br><strong>MySQL</strong></td>
<td align="center"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Database.png" width="50"><br><strong>PostgreSQL</strong></td>
<td align="center"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Database.png" width="50"><br><strong>MongoDB</strong></td>
<td align="center"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Database.png" width="50"><br><strong>Cassandra</strong></td>
</tr>
</table>

<br>

### 📨 Messaging Systems

<table>
<tr>
<td align="center"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Package.png" width="50"><br><strong>Kafka</strong></td>
<td align="center"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Package.png" width="50"><br><strong>RabbitMQ</strong></td>
<td align="center"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Package.png" width="50"><br><strong>ActiveMQ</strong></td>
</tr>
</table>

<br>

### 🌐 Distributed Systems

<table>
<tr>
<td align="center"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Gear.png" width="50"><br><strong>ZooKeeper</strong></td>
<td align="center"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Magnifying%20Glass%20Tilted%20Left.png" width="50"><br><strong>Elasticsearch</strong></td>
<td align="center"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Gear.png" width="50"><br><strong>etcd</strong></td>
</tr>
</table>

<br>

---

<br>

## 🎓 Learning Outcomes

After completing this section, you should be able to:

- ✅ Understand StatefulSet architecture
- ✅ Create StatefulSets
- ✅ Manage stateful workloads
- ✅ Configure persistent storage
- ✅ Understand stable identities
- ✅ Work with Headless Services
- ✅ Troubleshoot StatefulSets
- ✅ Differentiate Deployment and StatefulSet

<br>

---

<br>

## 💡 Key Takeaways

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

<table>
<tr>
<td align="center" width="14%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Database.png" width="40"><br><strong>Stateful Apps</strong></td>
<td align="center" width="14%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Identification%20Card.png" width="40"><br><strong>Unique Identity</strong></td>
<td align="center" width="14%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Package.png" width="40"><br><strong>Dedicated PVC</strong></td>
<td align="center" width="14%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Hourglass%20Done.png" width="40"><br><strong>Ordered Ops</strong></td>
<td align="center" width="14%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Gear.png" width="40"><br><strong>Databases</strong></td>
<td align="center" width="14%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Deployment.png" width="40"><br><strong>Deployments</strong></td>
<td align="center" width="14%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Briefcase.png" width="40"><br><strong>Workloads</strong></td>
</tr>
</table>

<br>

<ul>
<li>✅ StatefulSet is designed for <strong>stateful applications</strong></li>
<li>✅ Every Pod gets a <strong>stable identity</strong></li>
<li>✅ Every Pod gets <strong>dedicated persistent storage</strong></li>
<li>✅ Pods are created and deleted in order</li>
<li>✅ StatefulSets are commonly used for <strong>databases and distributed systems</strong></li>
<li>✅ Deployments are best for <strong>stateless workloads</strong></li>
<li>✅ StatefulSets solve problems where <strong>data and identity matter</strong></li>
</ul>

<br>

---

<br>

## ⭐ Golden Rule

<div align="center">
<img src="https://user-images.githubusercontent.com/74038190/225813708-98b745f2-7d22-48cf-9150-083f1b00d6c9.gif" width="400">
</div>

<br>

> **Deployment** is for **Stateless Applications**.
>
> **StatefulSet** is for **Stateful Applications**.

```text
Deployment
     │
     ▼
 Stateless Apps

------------------

StatefulSet
     │
     ▼
 Stateful Apps
```

Mastering StatefulSets is essential for running production-grade databases and distributed systems in Kubernetes.

<br>

---

<br>

<div align="center">

<img src="https://user-images.githubusercontent.com/74038190/212284115-f47cd8ff-2ffb-4b04-b5bf-4d1c14c0247f.gif" width="1000">

<br><br>

<h2>🎉 Mastered StatefulSets!</h2>

<br>

<table>
<tr>
<td align="center" width="25%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Books.png" width="60"><br><a href="#-overview"><strong>Basics</strong></a></td>
<td align="center" width="25%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Gear.png" width="60"><br><a href="#-key-features"><strong>Features</strong></a></td>
<td align="center" width="25%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Briefcase.png" width="60"><br><a href="#-common-use-cases"><strong>Use Cases</strong></a></td>
<td align="center" width="25%"><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Smilies/Thinking%20Face.png" width="60"><br><a href="#-deployment-vs-statefulset"><strong>Comparison</strong></a></td>
</tr>
</table>

<br>

<img src="https://img.shields.io/badge/Kubernetes-Mastered-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white"/> <img src="https://img.shields.io/badge/StatefulSet-Complete-4CAF50?style=for-the-badge&logo=checkmarx&logoColor=white"/>

<br><br>

<p><strong>Made with ❤️ for Kubernetes Engineers</strong></p>

<br>

<img src="https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=flat-square&logo=kubernetes&logoColor=white"/> <img src="https://img.shields.io/badge/statefulset-%234285F4.svg?style=flat-square&logo=kubernetes&logoColor=white"/> <img src="https://img.shields.io/badge/containers-%2300C7FD.svg?style=flat-square&logo=docker&logoColor=white"/> <img src="https://img.shields.io/badge/cloud-%23FF6B6B.svg?style=flat-square&logo=amazon-aws&logoColor=white"/>

<br>

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=100&section=footer" width="100%"/>

</div>
```

