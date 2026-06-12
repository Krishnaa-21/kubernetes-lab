<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=12,20,25&height=200&section=header&text=Kubernetes%20Deployment&fontSize=50&fontColor=fff&animation=twinkling&fontAlignY=38&desc=Deploy%20%7C%20Scale%20%7C%20Heal%20%7C%20Update&descAlignY=58&descSize=20" width="100%"/>

<br>



<h1>☸️ Kubernetes Deployment</h1>
<h3><em>Deploy Smarter. Scale Faster. Heal Automatically.</em></h3>

<br>

<img src="https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white"/>
<img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white"/>
<img src="https://img.shields.io/badge/NGINX-009639?style=for-the-badge&logo=nginx&logoColor=white"/>
<img src="https://img.shields.io/badge/YAML-CB171E?style=for-the-badge&logo=yaml&logoColor=white"/>
<img src="https://img.shields.io/badge/Cloud_Native-0089D6?style=for-the-badge&logo=microsoft-azure&logoColor=white"/>

<br><br>

<blockquote>
🚀 <strong>What is a Deployment?</strong> A Deployment is one of the most commonly used Kubernetes resources. It provides a <strong>declarative way</strong> to manage Pods — ensuring your application is always running in the desired state, automatically.
</blockquote>

<br>

<img src="https://user-images.githubusercontent.com/74038190/212284100-561aa473-3905-4a80-b561-0d28506553ee.gif" width="800">

</div>

<br>

## 🎯 Why Use Deployments?

<table>
<tr>
<td width="50%" align="center">

<h3>😰 Without Deployment</h3>

<br>

<pre>
❌ Pod crashes → Gone forever
❌ No auto-recovery
❌ Manual scaling required
❌ Downtime during updates
❌ No rollback capability
</pre>

<br>

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Cross%20Mark.png" width="60">

<p><strong>You're on your own!</strong></p>

</td>
<td width="50%" align="center">

<h3>😎 With Deployment</h3>

<br>

<pre>
✅ Pod crashes → Auto-replaced
✅ Self-healing built-in
✅ One-command scaling
✅ Zero-downtime rolling updates
✅ Instant rollbacks
</pre>

<br>

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Check%20Mark.png" width="60">

<p><strong>Kubernetes handles it all!</strong></p>

</td>
</tr>
</table>

<br>

<div align="center">
<blockquote>⭐ <strong>Golden Rule:</strong> Never create Pods directly in production. Create Deployments and let Kubernetes manage the Pods for you.</blockquote>
</div>

<br><br>

## 🔥 Self-Healing in Action

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/High%20Voltage.png" width="80">
<h3>Watch What Happens When a Pod Crashes</h3>
</div>

<br>

<table>
<tr>
<td width="33%" align="center">

<h3>😊 Step 1: All Running</h3>

```text
┌─────────┐
│  Pod 1  │ ✅
└─────────┘

┌─────────┐
│  Pod 2  │ ✅
└─────────┘

┌─────────┐
│  Pod 3  │ ✅
└─────────┘
```

<p><strong>3/3 Pods Healthy</strong></p>

</td>
<td width="33%" align="center">

<h3>💥 Step 2: Pod Crashes</h3>

```text
┌─────────┐
│  Pod 1  │ ✅
└─────────┘

┌─────────┐
│  Pod 2  │ ✅
└─────────┘

┌─────────┐
│  Pod 3  │ ❌
└─────────┘
```

<p><strong>Pod 3 Crashed!</strong></p>

</td>
<td width="33%" align="center">

<h3>🔄 Step 3: Auto-Healed</h3>

```text
┌─────────┐
│  Pod 1  │ ✅
└─────────┘

┌─────────┐
│  Pod 2  │ ✅
└─────────┘

┌─────────┐
│  Pod 3  │ ✅ NEW
└─────────┘
```

<p><strong>3/3 Restored!</strong></p>

</td>
</tr>
</table>

<div align="center">
<blockquote>🛡️ <strong>Self-Healing:</strong> Deployment detects the crash and automatically creates a fresh replacement Pod — no human intervention needed!</blockquote>
</div>

<br><br>

## 🏗️ Architecture

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Building%20Construction.png" width="80">
<h3>How It All Fits Together</h3>
</div>

<br>

```text
                    ☸️ Deployment
                         │
                         │  manages
                         ▼
                   📦 ReplicaSet
                         │
           ┌─────────────┼─────────────┐
           │             │             │
           ▼             ▼             ▼
        🐳 Pod 1      🐳 Pod 2      🐳 Pod 3
        [nginx]       [nginx]       [nginx]
```

<br>

<div align="center">

| Component | Role | Emoji |
|:---:|:---:|:---:|
| **Deployment** | Manages the application lifecycle | ☸️ |
| **ReplicaSet** | Maintains the desired Pod count | 📦 |
| **Pod** | Runs the actual container | 🐳 |

</div>

<br><br>

## 📂 Project Structure

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/File%20Folder.png" width="80">
</div>

<br>

```text
deployment/
│
├── 📄 README.md          ← You are here!
├── 📝 notes.md           ← Learning notes
└── ⚙️  deployment.yml    ← Kubernetes manifest
```

<br><br>

## 📝 Deployment Manifest

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Memo.png" width="80">
<h3>The YAML Configuration</h3>
</div>

<br>

```yaml
apiVersion: apps/v1
kind: Deployment

metadata:
  name: nginx-deployment         # Name of the Deployment

spec:
  replicas: 3                    # Run 3 Pods at all times

  selector:
    matchLabels:
      app: nginx                 # Select Pods with this label

  template:
    metadata:
      labels:
        app: nginx               # Label applied to each Pod

    spec:
      containers:
        - name: nginx
          image: nginx:latest    # Container image to use
          ports:
            - containerPort: 80  # Port exposed by container
```

<br>

<details>
<summary><strong>📖 YAML Field Reference (Click to expand)</strong></summary>

<br>

| Field | Description |
|---|---|
| `apiVersion: apps/v1` | API version for Deployments |
| `kind: Deployment` | Resource type |
| `metadata.name` | Unique name for this Deployment |
| `spec.replicas` | Number of Pods to maintain |
| `selector.matchLabels` | How Deployment finds its Pods |
| `template.metadata.labels` | Labels attached to each Pod |
| `spec.containers.image` | Docker image to run |
| `containerPort` | Port the container listens on |

</details>

<br><br>

## ⚡ Deploy the Application

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Rocket.png" width="80">
<h3>Get Your App Running</h3>
</div>

<br>

<table>
<tr>
<td width="50%">

<h3>1️⃣ Apply the Manifest</h3>

```bash
kubectl apply -f deployment.yml
```

<h3>2️⃣ Verify Deployment</h3>

```bash
kubectl get deployments
```

<strong>Expected Output:</strong>

```text
NAME               READY   UP-TO-DATE   AVAILABLE
nginx-deployment   3/3     3            3
```

</td>
<td width="50%">

<h3>3️⃣ Check the Pods</h3>

```bash
kubectl get pods
```

<strong>Expected Output:</strong>

```text
NAME                                READY   STATUS
nginx-deployment-7fd8b6b4c9-abc12   1/1     Running
nginx-deployment-7fd8b6b4c9-def34   1/1     Running
nginx-deployment-7fd8b6b4c9-ghi56   1/1     Running
```

<h3>4️⃣ Describe Deployment</h3>

```bash
kubectl describe deployment nginx-deployment
```

</td>
</tr>
</table>

<br><br>

## 📈 Scaling Deployments

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Chart%20Increasing.png" width="80">
<h3>Scale Up or Down Instantly</h3>
</div>

<br>

<table>
<tr>
<td width="50%" align="center">

<h3>🔼 Scale Up</h3>

```bash
kubectl scale deployment nginx-deployment \
  --replicas=5
```

<br>

```text
Before:  ●●● (3 Pods)
After:   ●●●●● (5 Pods)
```

<br>

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Chart%20Increasing.png" width="50">
<p>Handle more traffic!</p>

</td>
<td width="50%" align="center">

<h3>🔽 Scale Down</h3>

```bash
kubectl scale deployment nginx-deployment \
  --replicas=2
```

<br>

```text
Before:  ●●●●● (5 Pods)
After:   ●● (2 Pods)
```

<br>

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Chart%20Decreasing.png" width="50">
<p>Save resources!</p>

</td>
</tr>
</table>

<br><br>

## 🔄 Rolling Updates

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Symbols/Counterclockwise%20Arrows%20Button.png" width="80">
<h3>Zero-Downtime Updates</h3>
</div>

<br>

**Step 1:** Update your image version in `deployment.yml`:

```yaml
image: nginx:1.26    # Changed from nginx:latest
```

**Step 2:** Apply the changes:

```bash
kubectl apply -f deployment.yml
```

**Step 3:** Kubernetes rolls it out gradually:

```text
🔁 Rolling Update in Progress...

Old Pod 1  → ❌ Terminated
New Pod 1  → ✅ Started (nginx:1.26)

Old Pod 2  → ❌ Terminated
New Pod 2  → ✅ Started (nginx:1.26)

Old Pod 3  → ❌ Terminated
New Pod 3  → ✅ Started (nginx:1.26)

✅ Update Complete! Zero downtime achieved.
```

**Step 4:** Check rollout status:

```bash
kubectl rollout status deployment nginx-deployment
```

<br><br>

## ⏪ Rollback

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Symbols/Reverse%20Button.png" width="80">
<h3>Something Went Wrong? Go Back Instantly!</h3>
</div>

<br>

<table>
<tr>
<td width="50%">

<h3>📜 View Rollout History</h3>

```bash
kubectl rollout history deployment nginx-deployment
```

<strong>Output:</strong>

```text
REVISION  CHANGE-CAUSE
1         Initial deploy (nginx:latest)
2         Updated to nginx:1.26
```

</td>
<td width="50%">

<h3>⏮️ Rollback to Previous Version</h3>

```bash
kubectl rollout undo deployment nginx-deployment
```

<strong>Output:</strong>

```text
deployment.apps/nginx-deployment
rolled back ✅
```

</td>
</tr>
</table>

<br><br>

## 🛠️ Useful Commands

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Wrench.png" width="80">
<h3>Your kubectl Cheat Sheet</h3>
</div>

<br>

<details>
<summary><strong>📋 All Commands at a Glance (Click to expand)</strong></summary>

<br>

```bash
# ──────────────────────────────────────────
#  DEPLOY
# ──────────────────────────────────────────
kubectl apply -f deployment.yml               # Create / Update deployment

# ──────────────────────────────────────────
#  INSPECT
# ──────────────────────────────────────────
kubectl get deployments                        # List all deployments
kubectl describe deployment nginx-deployment   # Full deployment details
kubectl get pods                               # List all pods
kubectl rollout status deployment nginx-deployment  # Check rollout

# ──────────────────────────────────────────
#  SCALE
# ──────────────────────────────────────────
kubectl scale deployment nginx-deployment --replicas=5   # Scale to 5 pods

# ──────────────────────────────────────────
#  ROLLBACK
# ──────────────────────────────────────────
kubectl rollout history deployment nginx-deployment      # View history
kubectl rollout undo deployment nginx-deployment         # Rollback

# ──────────────────────────────────────────
#  DELETE
# ──────────────────────────────────────────
kubectl delete deployment nginx-deployment               # Remove deployment
```

</details>

<br>

<table>
<tr>
<th>Command</th>
<th>What It Does</th>
<th>When To Use</th>
</tr>
<tr>
<td><code>kubectl apply -f</code></td>
<td>Create or update deployment</td>
<td>Deploy changes</td>
</tr>
<tr>
<td><code>kubectl get deployments</code></td>
<td>List deployments & status</td>
<td>Quick health check</td>
</tr>
<tr>
<td><code>kubectl get pods</code></td>
<td>List all running pods</td>
<td>See individual pods</td>
</tr>
<tr>
<td><code>kubectl describe deployment</code></td>
<td>Detailed deployment info</td>
<td>Debugging issues</td>
</tr>
<tr>
<td><code>kubectl scale</code></td>
<td>Change replica count</td>
<td>Traffic up/down</td>
</tr>
<tr>
<td><code>kubectl rollout undo</code></td>
<td>Revert to previous version</td>
<td>Failed update</td>
</tr>
<tr>
<td><code>kubectl delete deployment</code></td>
<td>Remove deployment</td>
<td>Cleanup</td>
</tr>
</table>

<br><br>

## 🎓 Key Concepts

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Books.png" width="80">
<h3>Master These Ideas</h3>
</div>

<br>

<table>
<tr>
<td align="center" width="20%">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Shield.png" width="60">
<br><strong>Self-Healing</strong>
<br><sub>Crashed Pod? Auto-replaced instantly</sub>
</td>
<td align="center" width="20%">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Chart%20Increasing.png" width="60">
<br><strong>Scaling</strong>
<br><sub>Add/remove Pods on demand</sub>
</td>
<td align="center" width="20%">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Symbols/Counterclockwise%20Arrows%20Button.png" width="60">
<br><strong>Rolling Updates</strong>
<br><sub>Update with zero downtime</sub>
</td>
<td align="center" width="20%">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Symbols/Reverse%20Button.png" width="60">
<br><strong>Rollbacks</strong>
<br><sub>Instantly revert bad releases</sub>
</td>
<td align="center" width="20%">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Bullseye.png" width="60">
<br><strong>Desired State</strong>
<br><sub>Kubernetes enforces your spec 24/7</sub>
</td>
</tr>
</table>

<br><br>

## 💡 Real-World Analogy

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Fork%20and%20Knife%20With%20Plate.png" width="80">
<h3>Think of it Like a Restaurant</h3>
</div>

<br>

<table>
<tr>
<th>Restaurant</th>
<th>Kubernetes</th>
</tr>
<tr>
<td>🍽️ Restaurant</td>
<td>☸️ Your Application</td>
</tr>
<tr>
<td>👨‍💼 Manager</td>
<td>📦 Deployment</td>
</tr>
<tr>
<td>🧑‍🍳 Waiters</td>
<td>🐳 Pods</td>
</tr>
<tr>
<td>👥 Customers</td>
<td>🌐 Users / Traffic</td>
</tr>
</table>

<br>

| Scenario | Manager Does | Deployment Does |
|---|---|---|
| 🤒 Waiter gets sick | Hires a replacement | Replaces crashed Pod |
| 🌊 Rush hour hits | Calls in more staff | Scales up Pods |
| 🌙 Quiet night | Sends extra staff home | Scales down Pods |
| 🔄 New menu launched | Trains staff gradually | Rolls update out slowly |

<br>

<div align="center">
<blockquote>💡 <strong>The manager (Deployment) always ensures the restaurant (app) operates smoothly — no matter what!</strong></blockquote>
</div>

<br><br>

## 🧠 Interview Questions

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Smilies/Nerd%20Face.png" width="80">
<h3>Crack Your Kubernetes Interview</h3>
</div>

<br>

<details>
<summary><strong>❓ What is a Kubernetes Deployment?</strong></summary>
<br>
A Deployment is a Kubernetes resource used to manage Pods declaratively. It provides production-ready features such as <strong>self-healing, scaling, rolling updates, and rollbacks</strong> — automatically maintaining the desired state you define.
<br><br>
</details>

<details>
<summary><strong>❓ Why are Deployments preferred over raw Pods?</strong></summary>
<br>
Pods alone do not provide automatic recovery, scaling, or update capabilities. If a Pod crashes, it stays dead. A Deployment wraps Pods with a ReplicaSet to ensure the desired count is always maintained — making it production-safe.
<br><br>
</details>

<details>
<summary><strong>❓ What is the relationship between Deployment and ReplicaSet?</strong></summary>
<br>
A <strong>Deployment manages a ReplicaSet</strong>, and the ReplicaSet manages individual Pods. When you update a Deployment, Kubernetes creates a new ReplicaSet and gradually shifts traffic — enabling rolling updates and easy rollbacks.
<br><br>
</details>

<details>
<summary><strong>❓ What happens when a Pod managed by a Deployment crashes?</strong></summary>
<br>
The ReplicaSet (controlled by the Deployment) detects that the current Pod count is below the desired count and automatically schedules a new Pod as a replacement — with no manual intervention required.
<br><br>
</details>

<br><br>

## 📚 Learning Outcomes

<div align="center">
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Flexed%20Biceps.png" width="80">
<h3>After This Section, You Can:</h3>
</div>

<br>

<div align="center">

| # | Skill | Status |
|:---:|---|:---:|
| 1 | Create Deployments from scratch | ✅ |
| 2 | Understand ReplicaSets & their role | ✅ |
| 3 | Scale applications up and down | ✅ |
| 4 | Perform zero-downtime Rolling Updates | ✅ |
| 5 | Rollback failed releases instantly | ✅ |
| 6 | Troubleshoot Deployment issues | ✅ |
| 7 | Understand the full Deployment lifecycle | ✅ |

</div>

<br><br>

<div align="center">

<img src="https://user-images.githubusercontent.com/74038190/212284115-f47cd8ff-2ffb-4b04-b5bf-4d1c14c0247f.gif" width="1000">

<br><br>

<h2>🚀 Ready for the Next Topic?</h2>

<br>

<blockquote>"The best way to learn Kubernetes is to break things — safely."</blockquote>

<br>

<img src="https://img.shields.io/badge/Next-Services-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white"/>
<img src="https://img.shields.io/badge/Back-ReplicaSets-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white"/>

<br><br>

<p><strong>Remember:</strong> Every cloud engineer was once a beginner. Keep deploying! ☸️💪</p>

<br>

<hr>

<p><strong>Made with ❤️ for aspiring DevOps Engineers</strong></p>

<br>

<img src="https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=flat-square&logo=kubernetes&logoColor=white"/>
<img src="https://img.shields.io/badge/docker-%230db7ed.svg?style=flat-square&logo=docker&logoColor=white"/>
<img src="https://img.shields.io/badge/yaml-%23CB171E.svg?style=flat-square&logo=yaml&logoColor=white"/>

<br>

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=12,20,25&height=100&section=footer" width="100%"/>

</div>
