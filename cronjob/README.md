# ⏰🎨 KUBERNETES CRONJOB - ULTIMATE GUIDE 🎨⏰

---

## 🌈✨ OVERVIEW ✨🌈

### 🎯 What is a CronJob?

```
╔══════════════════════════════════════════════════════════════╗
║                    ⏰ CRONJOB ⏰                             ║
║                                                              ║
║   A Kubernetes workload resource that creates Jobs          ║
║   AUTOMATICALLY on a SCHEDULE 📅                            ║
║                                                              ║
║              🔄 Scheduler + Job = CronJob                   ║
╚══════════════════════════════════════════════════════════════╝
```

### 📊 Architecture Overview:

```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ ⏰ CronJob                                      ┃
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃           ⬇️  Creates  ⬇️                       ┃
┃ ┌─────────────────────────────────────────┐  ┃
┃ │         📦 Job (Scheduled)              │  ┃
┃ └─────────────────────────────────────────┘  ┃
┃           ⬇️  Creates  ⬇️                       ┃
┃ ┌─────────────────────────────────────────┐  ┃
┃ │       🐳 Pod (Containerized Task)       │  ┃
┃ └─────────────────────────────────────────┘  ┃
┃           ⬇️  Executes  ⬇️                      ┃
┃ ┌─────────────────────────────────────────┐  ┃
┃ │    ⚙️ Execute Task & Complete ✅        │  ┃
┃ └─────────────────────────────────────────┘  ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
```

---

## 🎯💎 WHY DO WE NEED CRONJOBS? 💎🎯

### 🔄 Daily Repetitive Tasks

Many tasks must run **repeatedly** without manual intervention.

```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ 📋 COMMON REPETITIVE TASKS:               ┃
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ 💾 Daily Database Backup                 ┃
┃ 📊 Generate Daily Reports                ┃
┃ 🗑️ Clean Old Logs                        ┃
┃ 📧 Send Email Notifications              ┃
┃ 🔄 Data Synchronization                  ┃
┃ 🏥 Health Checks                         ┃
┃ 📈 Metrics Collection                    ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
```

### ❌ Without CronJob (Manual Process):

```
┌─────────────────────────────────────┐
│  Manual Task Execution ❌            │
├─────────────────────────────────────┤
│  Day 1: Engineer ⚙️ runs backup     │
│  Day 2: Engineer ⚙️ runs backup     │
│  Day 3: Engineer 😴 FORGOT!        │
│  Day 4: Engineer ⚙️ runs backup     │
│  Day 5: Engineer 🤷 where am I?     │
│                                     │
│  ❌ Error-Prone                     │
│  ❌ Inefficient                     │
│  ❌ Not Reliable                    │
└─────────────────────────────────────┘
```

### ✅ With CronJob (Automated):

```
╔═════════════════════════════════════╗
║  AUTOMATED TASK EXECUTION ✅        ║
╠═════════════════════════════════════╣
║  Day 1: CronJob 🤖 runs auto       ║
║  Day 2: CronJob 🤖 runs auto       ║
║  Day 3: CronJob 🤖 runs auto ✅    ║
║  Day 4: CronJob 🤖 runs auto       ║
║  Day 5: CronJob 🤖 runs auto       ║
║                                     ║
║  ✅ Reliable                        ║
║  ✅ Efficient                       ║
║  ✅ Always Works                    ║
╚═════════════════════════════════════╝
```

---

## 🎭🌟 REAL-WORLD ANALOGY 🌟🎭

### 📌 Scenario: Daily Database Backup Required

### ❌ Without Automation:

```
┌────────────────────────────────────────┐
│ 2:00 AM - Database Admin's Routine    │
├────────────────────────────────────────┤
│ 🌙 Midnight: Goes to sleep             │
│ 1:59 AM: 😴😴😴                         │
│ 2:00 AM: ALARM! ⏰ Wakes up            │
│ 2:05 AM: 👀 Checks emails             │
│ 2:10 AM: ☕ Gets coffee               │
│ 2:20 AM: 💻 Opens laptop              │
│ 2:25 AM: 🔐 Enters passwords          │
│ 2:30 AM: 💾 Starts backup             │
│ 3:00 AM: 🎉 Backup done               │
│ 3:05 AM: 😴 Goes back to sleep        │
│                                        │
│ ⚠️ What if they FORGOT?               │
│ ⚠️ What if they got SICK?             │
│ ⚠️ What if HOLIDAYS?                  │
└────────────────────────────────────────┘
```

### ✅ With CronJob:

```
╔════════════════════════════════════════╗
║ 🤖 AUTOMATED BACKUP PROCESS           ║
╠════════════════════════════════════════╣
║ 1:59:59 AM: Everything sleeping 😴    ║
║                                        ║
║ 2:00:00 AM: ⏰ TIMER TRIGGERED!       ║
║     ⬇️                                 ║
║ 🕐 CronJob Controller Activated 🤖    ║
║     ⬇️                                 ║
║ 📦 Job Created Automatically          ║
║     ⬇️                                 ║
║ 🐳 Pod Spawned                        ║
║     ⬇️                                 ║
║ 💾 Backup Script Executed             ║
║     ⬇️                                 ║
║ ✅ Backup COMPLETED (3:00 AM)        ║
║                                        ║
║ 📅 REPEATS EVERY SINGLE DAY!          ║
║ 🎯 ZERO MANUAL INTERVENTION!          ║
║ 🛡️ GUARANTEED TO RUN!                 ║
╚════════════════════════════════════════╝
```

---

## 🚀⚡ JOB vs CRONJOB - DETAILED COMPARISON ⚡🚀

### 📦 JOB - Runs ONCE (One-Time Execution)

```
╔════════════════════════════════════════════════╗
║              📦 JOB                           ║
║         (One-Time Execution)                  ║
╠════════════════════════════════════════════════╣
║                                               ║
║    JOB TRIGGERED (Manually or Programmed)    ║
║           ⬇️                                  ║
║    EXECUTE TASK ONCE ▶️                       ║
║           ⬇️                                  ║
║    ✅ COMPLETE & EXIT                        ║
║                                               ║
║    🎯 Perfect for ONE-TIME tasks:            ║
║    • Database Migration 🗄️                    ║
║    • One-time Data Import 📥                 ║
║    • Initial Setup Script 🔧                 ║
║                                               ║
╚════════════════════════════════════════════════╝
```

**Visual Timeline:**

```
│ Time ─────────────────────────────────────────>
│
│     [Job Execution]
│     ⬆️
│     Run Once
│
│     Status: ✅ COMPLETED
└─────────────────────────────────────────────────
```

---

### 🔄 CRONJOB - Runs REPEATEDLY on Schedule (Automation)

```
╔════════════════════════════════════════════════╗
║          🔄 CRONJOB                          ║
║      (Scheduled Repeated Execution)           ║
╠════════════════════════════════════════════════╣
║                                               ║
║    Every Scheduled Time:                      ║
║    ⏰ 2:00 AM Daily ➜ Job 1 Created          ║
║    ⏰ 2:00 AM Daily ➜ Job 2 Created          ║
║    ⏰ 2:00 AM Daily ➜ Job 3 Created          ║
║    ⏰ 2:00 AM Daily ➜ Job 4 Created          ║
║    ... REPEATS FOREVER ...                   ║
║                                               ║
║    🎯 Perfect for REPETITIVE tasks:          ║
║    • Daily Database Backup 💾                 ║
║    • Weekly Reports 📊                       ║
║    • Hourly Health Checks 🏥                 ║
║    • Monthly Cleanup 🧹                      ║
║                                               ║
╚════════════════════════════════════════════════╝
```

**Visual Timeline:**

```
│ Time ──────────────────────────────────────────────────────>
│
│     [Day 1]  [Day 2]  [Day 3]  [Day 4]  [Day 5]
│     2:00 AM  2:00 AM  2:00 AM  2:00 AM  2:00 AM
│      Job1    Job2     Job3     Job4     Job5
│       ✅      ✅       ✅       ✅       ✅
│
│     Status: ♾️ REPEATING FOREVER
└──────────────────────────────────────────────────────────
```

---

## 📊 COMPARISON TABLE

```
╔═════════════════════════════════╦═════════════╦══════════════╗
║  FEATURE                        ║    JOB 📦   ║  CRONJOB 🔄  ║
╠═════════════════════════════════╬═════════════╬══════════════╣
║ Runs Once                       ║    ✅       ║     ❌       ║
║ Scheduled Execution             ║    ❌       ║     ✅       ║
║ Creates Pods                    ║    ✅       ║   Indirect   ║
║ Creates Jobs                    ║    ❌       ║     ✅       ║
║ Repeated Execution              ║    ❌       ║     ✅       ║
║ Manual Trigger                  ║    ✅       ║     ❌       ║
║ Automation Level                ║   Limited   ║    HIGH 🚀   ║
║ Use Case                        ║  One-time   ║  Repetitive  ║
║ Timeline                        ║   Linear    ║   Cyclical   ║
║ Ideal For                       ║  Migrations ║   Backups    ║
╚═════════════════════════════════╩═════════════╩══════════════╝
```

---

## 🏗️✨ CRONJOB ARCHITECTURE DEEP DIVE ✨🏗️

### 🔷 Complete Flow Diagram:

```
╔══════════════════════════════════════════════════════════════╗
║              CRONJOB ARCHITECTURE FLOW                       ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  [1] ⏰ CRON SCHEDULE TRIGGERS                              ║
║  └─> Every Day at 2:00 AM                                   ║
║                                                              ║
║  [2] 🕐 CRONJOB CONTROLLER ACTIVATES                       ║
║  └─> Kubernetes Control Plane detects schedule              ║
║                                                              ║
║  [3] 📦 JOB CREATED                                         ║
║  └─> CronJob creates a new Job resource                    ║
║  └─> Named: backup-job-1234567890                           ║
║                                                              ║
║  [4] 🐳 POD CREATED                                         ║
║  └─> Job creates Pod container                             ║
║  └─> Named: backup-job-1234567890-abcde                     ║
║                                                              ║
║  [5] ⚙️ TASK EXECUTED                                       ║
║  └─> Container runs backup script                           ║
║  └─> Connects to database                                   ║
║  └─> Creates backup file                                    ║
║  └─> Uploads to storage                                     ║
║                                                              ║
║  [6] ✅ JOB COMPLETED                                       ║
║  └─> Task finishes successfully                             ║
║  └─> Pod terminates                                         ║
║  └─> Status: COMPLETED ✅                                   ║
║                                                              ║
║  [7] 🔄 NEXT SCHEDULE                                       ║
║  └─> 24 hours later, process repeats                        ║
║  └─> New Job created automatically                          ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

### 🎬 Visual Sequence:

```
    Time: 2:00 AM Daily
         │
         ▼
    ╔═════════════════╗
    │ ⏰ CronJob      │
    │ Time Triggered  │
    └────────┬────────┘
             │
             ▼
    ╔═════════════════╗
    │ 📦 Job         │
    │ Created        │
    └────────┬────────┘
             │
             ▼
    ╔═════════════════╗
    │ 🐳 Pod         │
    │ Created        │
    └────────┬────────┘
             │
             ▼
    ╔═════════════════╗
    │ ⚙️ Task        │
    │ Executing      │
    └────────┬────────┘
             │
             ▼
    ╔═════════════════╗
    │ ✅ Complete    │
    │ & Ready for    │
    │ Next Schedule  │
    └─────────────────┘
```

---

## 🎯💻 BASIC CRONJOB MANIFEST - EXPLAINED 💻🎯

### 📝 Complete YAML Configuration:

```yaml
╔══════════════════════════════════════════════════════════════╗
║            CRONJOB MANIFEST TEMPLATE                         ║
╚══════════════════════════════════════════════════════════════╝

apiVersion: batch/v1              🔹 API Version
kind: CronJob                      🔹 Resource Type

metadata:
  name: database-backup-job        🔹 CronJob Name
  namespace: default               🔹 Kubernetes Namespace
  labels:
    app: backup                    🔹 Labels for identification

spec:
  # ⏰ SCHEDULE CONFIGURATION
  schedule: "0 2 * * *"            🔹 Run at 2:00 AM Daily
  
  # 🔀 CONCURRENCY HANDLING
  concurrencyPolicy: Forbid        🔹 Don't run if previous job running
  
  # ⏱️ DEADLINE
  startingDeadlineSeconds: 300     🔹 Skip if 5 minutes late

  # 📊 HISTORY CONFIGURATION
  successfulJobsHistoryLimit: 5    🔹 Keep last 5 successful jobs
  failedJobsHistoryLimit: 3        🔹 Keep last 3 failed jobs

  # ⏸️ SUSPEND (Pause CronJob)
  suspend: false                   🔹 true = paused, false = running

  # 📦 JOB TEMPLATE (Blueprint for Jobs)
  jobTemplate:
    spec:
      # 🔄 JOB CONFIGURATION
      backoffLimit: 3              🔹 Retry up to 3 times on failure
      
      # ⏱️ JOB DEADLINE
      activeDeadlineSeconds: 600   🔹 Kill job after 10 minutes
      
      template:
        metadata:
          labels:
            job: backup            🔹 Pod labels

        spec:
          # 🐳 CONTAINER CONFIGURATION
          containers:
          - name: backup-container 🔹 Container name
            image: busybox:latest   🔹 Container image
            imagePullPolicy: Always 🔹 Always pull fresh image
            
            # ⚙️ COMMAND TO EXECUTE
            command:
            - /bin/sh
            - -c
            - |
              echo "🚀 Backup Started"
              # Your backup script here
              mysqldump -u root -p$MYSQL_PASSWORD mydb > backup.sql
              echo "✅ Backup Completed"
            
            # 🌍 ENVIRONMENT VARIABLES
            env:
            - name: MYSQL_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: mysql-secret
                  key: password

            # 💾 RESOURCE LIMITS
            resources:
              requests:
                memory: "256Mi"     🔹 Minimum memory needed
                cpu: "100m"         🔹 Minimum CPU needed
              limits:
                memory: "512Mi"     🔹 Maximum memory allowed
                cpu: "500m"         🔹 Maximum CPU allowed

            # 🔄 RESTART POLICY
          restartPolicy: OnFailure  🔹 Restart pod if it fails

```

---

## 🔑📚 UNDERSTANDING EACH FIELD 📚🔑

### 🔹 **apiVersion: batch/v1**

```
╔════════════════════════════════════════╗
║  API GROUP: batch/v1                   ║
├────────────────────────────────────────┤
║  • Kubernetes API Group: "batch"       ║
║  • Version: "v1" (stable)              ║
║  • Contains: Jobs, CronJobs            ║
║                                        ║
║  Other API Groups:                     ║
║  • core/v1 (Pods, Services)           ║
║  • apps/v1 (Deployments, StatefulSets)║
║  • storage.k8s.io/v1 (StorageClass)   ║
╚════════════════════════════════════════╝
```

---

### 🔹 **kind: CronJob**

```
╔════════════════════════════════════════╗
║  RESOURCE TYPE: CronJob                ║
├────────────────────────────────────────┤
║  Specifies that this is a CronJob      ║
║  resource, not a Job, Deployment, etc. ║
║                                        ║
║  Other kinds in batch/v1:              ║
║  • Job (one-time execution)           ║
║  • CronJob (scheduled execution)      ║
╚════════════════════════════════════════╝
```

---

### 🔹 **metadata.name: backup-job**

```
╔════════════════════════════════════════╗
║  CRONJOB NAME                          ║
├────────────────────────────────────────┤
║  • Unique identifier in namespace      ║
║  • Used with kubectl commands:         ║
║    kubectl get cronjobs backup-job     ║
║    kubectl describe cronjob backup-job ║
║    kubectl delete cronjob backup-job   ║
║                                        ║
║  🎯 Naming Rules:                      ║
║  • Lowercase alphanumeric & hyphens    ║
║  • Max 253 characters                  ║
║  • Must start with letter              ║
║  • Good: backup-job-v1 ✅              ║
║  • Bad: BACKUP_JOB ❌                  ║
╚════════════════════════════════════════╝
```

---

### 🔹 **schedule: "0 2 * * *"**

```
╔════════════════════════════════════════════════════════╗
║  CRON SCHEDULE EXPRESSION                             ║
╠════════════════════════════════════════════════════════╣
║                                                        ║
║  Format: ┌─────────────────────────────────┐         ║
║          │ * * * * *                       │         ║
║          │ │ │ │ │ │                       │         ║
║          │ │ │ │ │ └─ Day of Week (0-6)    │         ║
║          │ │ │ │ └─── Month (1-12)         │         ║
║          │ │ │ └───── Day of Month (1-31)  │         ║
║          │ │ └─────── Hour (0-23)          │         ║
║          │ └───────── Minute (0-59)        │         ║
║          └─────────────────────────────────┘         ║
║                                                        ║
║  Example: "0 2 * * *"                                ║
║           ↓ ↓ ↓ ↓ ↓                                  ║
║           │ │ │ │ │                                  ║
║           │ │ │ │ └─ Every day of week (*)           ║
║           │ │ │ └─── Every month (*)                 ║
║           │ │ └───── Every day of month (*)          ║
║           │ └─────── Hour = 2 (2 AM)                 ║
║           └───────── Minute = 0                      ║
║                                                        ║
║  🎯 MEANING: "Every day at 2:00 AM"                  ║
║                                                        ║
╚════════════════════════════════════════════════════════╝
```

**Visual Schedule Breakdown:**

```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CRON FIELD DEFINITIONS                  ┃
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                                         ┃
┃ Field 1: MINUTE (0-59)                  ┃
┃ • 0 = At the start of the hour         ┃
┃ • 15 = At 15 minutes past              ┃
┃ • 30 = At 30 minutes past              ┃
┃ • */15 = Every 15 minutes              ┃
┃ • * = Every minute                     ┃
┃                                         ┃
┃ Field 2: HOUR (0-23)                    ┃
┃ • 0 = Midnight (00:00)                 ┃
┃ • 2 = 2 AM                             ┃
┃ • 14 = 2 PM                            ┃
┃ • 23 = 11 PM                           ┃
┃ • * = Every hour                       ┃
┃                                         ┃
┃ Field 3: DAY OF MONTH (1-31)             ┃
┃ • 1 = First day of month               ┃
┃ • 15 = Fifteenth day                   ┃
┃ • * = Every day                        ┃
┃                                         ┃
┃ Field 4: MONTH (1-12)                   ┃
┃ • 1 = January                          ┃
┃ • 6 = June                             ┃
┃ • 12 = December                        ┃
┃ • * = Every month                      ┃
┃                                         ┃
┃ Field 5: DAY OF WEEK (0-6)               ┃
┃ • 0 = Sunday                           ┃
┃ • 1 = Monday                           ┃
┃ • 2 = Tuesday                          ┃
┃ • 6 = Saturday                         ┃
┃ • * = Every day                        ┃
┃                                         ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
```

---

### 🔹 **jobTemplate**

```
╔════════════════════════════════════════════════════════╗
║  JOB TEMPLATE - THE BLUEPRINT                          ║
╠════════════════════════════════════════════════════════╣
║                                                        ║
║  Purpose:                                             ║
║  └─ Defines HOW Jobs should be created               ║
║  └─ CronJob copies this template for each run        ║
║                                                        ║
║  Think of it like:                                    ║
║  ┌──────────────────────────────────────┐            ║
║  │ COOKIE TEMPLATE (jobTemplate)        │            ║
║  │                                      │            ║
║  │ • Shape: Circle                     │            ║
║  │ • Color: Brown                      │            ║
║  │ • Flavor: Chocolate                 │            ║
║  └──────────────────────────────────────┘            ║
║                    ⬇️                                  ║
║  Every day, CronJob "stamps out" new Cookie         ║
║  (creates new Job from template)                     ║
║                    ⬇️                                  ║
║  Each Job is identical: Circle, Brown, Chocolate    ║
║  (Each Job runs the same task)                      ║
║                                                       ║
╚════════════════════════════════════════════════════════╝
```

---

## 🕒⏰ CRON SCHEDULE EXAMPLES ⏰🕒

### 🔄 Common Schedules Reference:

```
╔═══════════════════════════════════════════════════════════════╗
║ SCHEDULE EXPRESSION | MEANING            | TIMEZONE          ║
╠═══════════════════════════════════════════════════════════════╣
║                                                               ║
║ * * * * *          │ Every Minute ⏱️    │ Every 60 seconds ║
║ 0 * * * *          │ Every Hour 🕐      │ At :00 minutes   ║
║ 0 0 * * *          │ Daily Midnight 🌙  │ 00:00 every day  ║
║ 0 6 * * *          │ Daily 6 AM 🌅      │ 06:00 every day  ║
║ 0 12 * * *         │ Daily Noon ☀️      │ 12:00 every day  ║
║ 0 2 * * *          │ Daily 2 AM 🌃      │ 02:00 every day  ║
║ 30 2 * * *         │ Daily 2:30 AM 🌃   │ 02:30 every day  ║
║ 0 0 * * 0          │ Every Sunday 🙏    │ Sun 00:00        ║
║ 0 0 * * 1          │ Every Monday 📅    │ Mon 00:00        ║
║ 0 9 * * 1-5        │ Weekdays 9 AM 📅   │ Mon-Fri 09:00    ║
║ 0 0 1 * *          │ 1st Day of Month 📆 │ 1st 00:00       ║
║ 0 0 1 1 *          │ New Year 🎉        │ Jan 1 00:00      ║
║ 0 0 15 * *         │ 15th Day 📅        │ 15th 00:00       ║
║ 0 0 * 1 *          │ Every January 1️⃣   │ Any day 00:00    ║
║ 0 */6 * * *        │ Every 6 Hours ⏰   │ 00:00, 06:00...  ║
║ 0 0 * * 6          │ Every Saturday 🎬  │ Sat 00:00        ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
```

---

## 🔄💫 CRONJOB COMPLETE LIFECYCLE 💫🔄

### ⏱️ Step-by-Step Execution Timeline:

```
╔════════════════════════════════════════════════════════════════╗
║                  CRONJOB EXECUTION CYCLE                       ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║ ⏰ SCHEDULED TIME (2:00 AM)                                    ║
║  └─ CronJob Controller checks schedule                        ║
║     🔍 "Is it 2:00 AM?" → YES!                               ║
║                                                                ║
║ 🕐 CRONJOB TRIGGERED                                          ║
║  └─ Controller activates                                      ║
║  └─ Reads jobTemplate from spec                              ║
║  └─ Checks concurrencyPolicy                                 ║
║  └─ Checks if previous job still running                     ║
║     ✅ All checks pass → PROCEED                             ║
║                                                                ║
║ 📦 JOB CREATED                                                ║
║  └─ New Job resource created                                 ║
║  └─ Named: backup-job-1704067200                             ║
║  └─ Status: PENDING (waiting for resources)                 ║
║  └─ Scheduler assigns to appropriate node                    ║
║                                                                ║
║ 🐳 POD CREATED                                                ║
║  └─ Kubernetes creates Pod                                   ║
║  └─ Named: backup-job-1704067200-abcde                       ║
║  └─ Container image downloaded                               ║
║  └─ Container starts                                         ║
║  └─ Status: RUNNING                                          ║
║                                                                ║
║ ⚙️ TASK EXECUTES                                              ║
║  └─ Container runs command/script                            ║
║  └─ Connects to database                                     ║
║  └─ Performs backup operation                                ║
║  └─ Writes logs to stdout/stderr                             ║
║  └─ Updates progress                                         ║
║                                                                ║
║ ✅ TASK COMPLETES                                             ║
║  └─ Script finishes successfully                             ║
║  └─ Exit code: 0 (success)                                   ║
║  └─ Container stops                                          ║
║  └─ Pod terminating...                                       ║
║                                                                ║
║ 📊 JOB STATUS UPDATE                                          ║
║  └─ Job marked as COMPLETED ✅                               ║
║  └─ Pod removed from running pods                            ║
║  └─ Job history updated                                      ║
║  └─ Old jobs cleaned up based on history limits             ║
║                                                                ║
║ 🔄 NEXT CYCLE WAITS                                           ║
║  └─ CronJob goes back to sleep                              ║
║  └─ Waits for next scheduled time                            ║
║  └─ 24 hours later... REPEAT! 🔁                             ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```

---

## 🎯🔧 MANAGING CRONJOB SETTINGS 🔧🎯

### ⏸️ **suspend: true/false** (Pause/Resume)

```
╔════════════════════════════════════════════════════════╗
║  SUSPEND - PAUSE CRONJOB EXECUTION                    ║
╠════════════════════════════════════════════════════════╣
║                                                        ║
║  suspend: false (Default - RUNNING) ▶️                 ║
║  ├─ CronJob actively monitors schedule               ║
║  ├─ Creates new Jobs at scheduled times              ║
║  ├─ Status: ACTIVE                                   ║
║  └─ 📊 Example:                                       ║
║     2024-01-01 02:00 AM → Job Created ✅             ║
║     2024-01-02 02:00 AM → Job Created ✅             ║
║     2024-01-03 02:00 AM → Job Created ✅             ║
║                                                        ║
║  ─────────────────────────────────────────────────   ║
║                                                        ║
║  suspend: true (PAUSED) ⏸️                            ║
║  ├─ CronJob ignores schedule                         ║
║  ├─ NO new Jobs created                              ║
║  ├─ Status: SUSPENDED                                ║
║  ├─ Existing Jobs still run                          ║
║  └─ 📊 Example:                                       ║
║     2024-01-01 02:00 AM → Job Created ✅ (before)    ║
║     2024-01-02 02:00 AM → Job SKIPPED ⏭️ (suspended) ║
║     2024-01-03 02:00 AM → Job SKIPPED ⏭️ (suspended) ║
║     2024-01-04 02:00 AM → Resume ▶️                   ║
║     2024-01-05 02:00 AM → Job Created ✅ (after)     ║
║                                                        ║
╚════════════════════════════════════════════════════════╝
```

**Suspend YAML Update:**

```yaml
spec:
  suspend: true  ⏸️ PAUSED
  # ... rest of config
```

---

### 📊 **successfulJobsHistoryLimit: N**

```
╔════════════════════════════════════════════════════════╗
║  HISTORY LIMIT - CLEANUP OLD SUCCESSFUL JOBS          ║
╠════════════════════════════════════════════════════════╣
║                                                        ║
║  successfulJobsHistoryLimit: 3                        ║
║                                                        ║
║  Kubernetes keeps ONLY the last 3 successful Jobs    ║
║                                                        ║
║  Example Timeline:                                    ║
║  ┌──────────────────────────────────────┐            ║
║  │ Job 1: 2024-01-01 ✅ (DELETED)       │            ║
║  │ Job 2: 2024-01-02 ✅ (DELETED)       │            ║
║  │ Job 3: 2024-01-03 ✅ (DELETED)       │            ║
║  │ Job 4: 2024-01-04 ✅ (KEPT) 👈       │            ║
║  │ Job 5: 2024-01-05 ✅ (KEPT) 👈       │            ║
║  │ Job 6: 2024-01-06 ✅ (KEPT) 👈       │            ║
║  │ Job 7: 2024-01-07 ✅ (NEW)           │            ║
║  └──────────────────────────────────────┘            ║
║                                                        ║
║  🎯 Benefits:                                         ║
║  ✅ Save storage space                               ║
║  ✅ Keep cluster clean                               ║
║  ✅ Still retain recent history                      ║
║                                                        ║
║  ⚠️ Note:                                             ║
║  If set to 0: ALL successful jobs deleted            ║
║  If not set: No cleanup happens                      ║
║                                                        ║
╚════════════════════════════════════════════════════════╝
```

---

### 🔴 **failedJobsHistoryLimit: N**

```
╔════════════════════════════════════════════════════════╗
║  FAILED JOB HISTORY - TRACK FAILURES FOR DEBUGGING    ║
╠════════════════════════════════════════════════════════╣
║                                                        ║
║  failedJobsHistoryLimit: 2                           ║
║                                                        ║
║  Kubernetes keeps ONLY the last 2 failed Jobs        ║
║                                                        ║
║  Example Timeline:                                    ║
║  ┌──────────────────────────────────────┐            ║
║  │ Job 1: 2024-01-01 ❌ (DELETED)       │            ║
║  │ Job 2: 2024-01-02 ❌ (DELETED)       │            ║
║  │ Job 3: 2024-01-03 ❌ (KEPT) 👈       │            ║
║  │ Job 4: 2024-01-04 ✅                 │            ║
║  │ Job 5: 2024-01-05 ❌ (KEPT) 👈       │            ║
║  └──────────────────────────────────────┘            ║
║                                                        ║
║  🎯 Use Cases:                                        ║
║  🔍 Debug failed backups                             ║
║  📊 Analyze failure patterns                         ║
║  ⚠️ Investigate data loss scenarios                  ║
║  🔧 Review error logs                                ║
║                                                        ║
╚════════════════════════════════════════════════════════╝
```

---

### 🔀 **concurrencyPolicy: [Allow|Forbid|Replace]**

```
╔═══════════════════════════════════════════════════════════════╗
║           CONCURRENCY POLICY - HANDLE JOB OVERLAP            ║
╠═══════════════════════════════════════════════════════════════╣
║                                                               ║
║  Scenario: Previous job still running when next job scheduled║
║                                                               ║
║  ┌──────────────────────────────────────────────────────┐   ║
║  │  POLICY 1: Allow (DEFAULT) ✅                       │   ║
║  ├──────────────────────────────────────────────────────┤   ║
║  │  concurrencyPolicy: Allow                            │   ║
║  │                                                       │   ║
║  │  Timeline:                                           │   ║
║  │  1:59 PM: Job 1 starts (long running) ▶️             │   ║
║  │  2:00 PM: Scheduled time for Job 2                  │   ║
║  │  2:00 PM: Job 1 STILL RUNNING ▶️                     │   ║
║  │  2:00 PM: Job 2 STARTS ANYWAY ▶️                     │   ║
║  │  → BOTH JOBS RUN SIMULTANEOUSLY!                    │   ║
║  │                                                       │   ║
║  │  ✅ When to use:                                    │   ║
║  │  • Non-conflicting tasks                            │   ║
║  │  • Can run in parallel                              │   ║
║  │  • Example: Log analysis (multiple analyses OK)    │   ║
║  └──────────────────────────────────────────────────────┘   ║
║                                                               ║
║  ┌──────────────────────────────────────────────────────┐   ║
║  │  POLICY 2: Forbid 🚫                                │   ║
║  ├──────────────────────────────────────────────────────┤   ║
║  │  concurrencyPolicy: Forbid                           │   ║
║  │                                                       │   ║
║  │  Timeline:                                           │   ║
║  │  1:59 PM: Job 1 starts (long running) ▶️             │   ║
║  │  2:00 PM: Scheduled time for Job 2                  │   ║
║  │  2:00 PM: Job 1 STILL RUNNING ▶️                     │   ║
║  │  2:00 PM: Job 2 SKIPPED ⏭️                           │   ║
║  │  → Job 2 misses its schedule                        │   ║
║  │                                                       │   ║
║  │  ✅ When to use:                                    │   ║
║  │  • Conflicting tasks                                │   ║
║  │  • Shared resources                                 │   ║
║  │  • Example: Database backup (can't run twice)      │   ║
║  └──────────────────────────────────────────────────────┘   ║
║                                                               ║
║  ┌──────────────────────────────────────────────────────┐   ║
║  │  POLICY 3: Replace 🔄                               │   ║
║  ├──────────────────────────────────────────────────────┤   ║
║  │  concurrencyPolicy: Replace                          │   ║
║  │                                                       │   ║
║  │  Timeline:                                           │   ║
║  │  1:59 PM: Job 1 starts (long running) ▶️             │   ║
║  │  2:00 PM: Scheduled time for Job 2                  │   ║
║  │  2:00 PM: Job 1 STILL RUNNING ▶️                     │   ║
║  │  2:00 PM: Job 1 KILLED 🛑                            │   ║
║  │  2:00 PM: Job 2 STARTS ▶️                            │   ║
║  │  → Job 1 replaced by Job 2                          │   ║
║  │                                                       │   ║
║  │  ✅ When to use:                                    │   ║
║  │  • Latest version always needed                     │   ║
║  │  • Can abandon old jobs                             │   ║
║  │  • Example: Health checks (old data not needed)    │   ║
║  └──────────────────────────────────────────────────────┘   ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
```

---

### ⏱️ **startingDeadlineSeconds**

```
╔═════════════════════════════════════════════════════════╗
║  STARTING DEADLINE SECONDS - GRACE PERIOD FOR DELAY    ║
╠═════════════════════════════════════════════════════════╣
║                                                         ║
║  startingDeadlineSeconds: 300  (5 minutes grace)      ║
║                                                         ║
║  What it means:                                        ║
║  "If a job misses its scheduled time, give it         ║
║   5 minutes to START. If it doesn't start within     ║
║   5 minutes, SKIP this run."                          ║
║                                                         ║
║  Example Timeline:                                     ║
║  ┌─────────────────────────────────────┐             ║
║  │ 2:00 PM: SCHEDULED TIME             │             ║
║  │ 2:01 PM: Cluster busy, can't start  │             ║
║  │ 2:02 PM: Still waiting...           │             ║
║  │ 2:03 PM: Still waiting...           │             ║
║  │ 2:04 PM: Almost out of time!        │             ║
║  │ 2:05 PM: DEADLINE REACHED! ⏰       │             ║
║  │                                     │             ║
║  │ 2:06 PM: ❌ JOB SKIPPED             │             ║
║  │ "Missed the deadline" ⏭️             │             ║
║  │                                     │             ║
║  │ 2:07 PM: Wait for next schedule     │             ║
║  │ 3:00 PM: Next run (if hourly)       │             ║
║  └─────────────────────────────────────┘             ║
║                                                         ║
║  🎯 Use Cases:                                         ║
║  • Prevent backlog of missed jobs                     ║
║  • Avoid cascading delays                            ║
║  • Better than running very late task                ║
║                                                         ║
║  🚫 If NOT set:                                        ║
║  • Jobs can run indefinitely late                     ║
║  • Backlog keeps growing                             ║
║  • Cluster gets overloaded                           ║
║                                                         ║
╚═════════════════════════════════════════════════════════╝
```

---

## 🌍💼 REAL-WORLD USE CASES 💼🌍

### 1️⃣ **Database Backup System** 💾

```
╔═══════════════════════════════════════════════════════════╗
║  DAILY DATABASE BACKUP CRONJOB                          ║
╠═══════════════════════════════════════════════════════════╣
║                                                           ║
║  Schedule: "0 2 * * *"  (2 AM Daily) 🌃                 ║
║                                                           ║
║  Workflow:                                               ║
║  ┌───────────────────────────────────────────────┐     ║
║  │ 🕐 2:00 AM                                    │     ║
║  │  ⬇️                                           │     ║
║  │ 📦 CronJob triggers                           │     ║
║  │  ⬇️                                           │     ║
║  │ 🐳 Container with mysqldump tool starts      │     ║
║  │  ⬇️                                           │     ║
║  │ 💾 Connects to production database           │     ║
║  │  ⬇️                                           │     ║
║  │ 📥 Exports all tables                         │     ║
║  │  ⬇️                                           │     ║
║  │ 📦 Compresses backup.sql.gz                  │     ║
║  │  ⬇️                                           │     ║
║  │ ☁️ Uploads to S3/Cloud Storage               │     ║
║  │  ⬇️                                           │     ║
║  │ ✅ Backup Complete                           │     ║
║  │  ⬇️                                           │     ║
║  │ 📧 Sends success email to admin              │     ║
║  └───────────────────────────────────────────────┘     ║
║                                                           ║
║  Benefits:                                               ║
║  ✅ Automated every single day                          ║
║  ✅ No human intervention needed                        ║
║  ✅ Data safely backed up offsite                       ║
║  ✅ Can restore from multiple daily backups             ║
║  ✅ Zero downtime                                       ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
```

---

### 2️⃣ **Daily Report Generation** 📊

```
╔═══════════════════════════════════════════════════════════╗
║  DAILY BUSINESS REPORT CRONJOB                          ║
╠═══════════════════════════════════════════════════════════╣
║                                                           ║
║  Schedule: "0 9 * * 1-5"  (9 AM Weekdays) 📅             ║
║                                                           ║
║  Workflow:                                               ║
║  ┌───────────────────────────────────────────────┐     ║
║  │ 📅 Monday-Friday 9:00 AM                      │     ║
║  │  ⬇️                                           │     ║
║  │ 📦 CronJob triggers                           │     ║
║  │  ⬇️                                           │     ║
║  │ 🔍 Collects data from analytics               │     ║
║  │  ⬇️                                           │     ║
║  │ 📊 Generates charts and graphs               │     ║
║  │  ⬇️                                           │     ║
║  │ 📄 Creates PDF report                         │     ║
║  │  ⬇️                                           │     ║
║  │ 📧 Sends to distribution list                │     ║
║  │  ⬇️                                           │     ║
║  │ 📁 Stores in archive                          │     ║
║  │  ⬇️                                           │     ║
║  │ ✅ Reports Ready for Team!                    │     ║
║  └───────────────────────────────────────────────┘     ║
║                                                           ║
║  Benefits:                                               ║
║  ✅ Consistent report generation                        ║
║  ✅ Reports before business hours                      ║
║  ✅ No manual compilation needed                       ║
║  ✅ Stakeholders always informed                       ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
```

---

### 3️⃣ **Log Cleanup & Maintenance** 🧹

```
╔═══════════════════════════════════════════════════════════╗
║  WEEKLY LOG CLEANUP CRONJOB                             ║
╠═══════════════════════════════════════════════════════════╣
║                                                           ║
║  Schedule: "0 3 * * 0"  (3 AM Sundays) 🙏               ║
║                                                           ║
║  Workflow:                                               ║
║  ┌───────────────────────────────────────────────┐     ║
║  │ 📅 Sunday 3:00 AM                             │     ║
║  │  ⬇️                                           │     ║
║  │ 📦 CronJob triggers                           │     ║
║  │  ⬇️                                           │     ║
║  │ 🔍 Finds logs older than 30 days             │     ║
║  │  ⬇️                                           │     ║
║  │ 📦 Compresses ancient logs                    │     ║
║  │  ⬇️                                           │     ║
║  │ 🗑️ Deletes really old ones                    │     ║
║  │  ⬇️                                           │     ║
║  │ 💾 Moves compressed logs to archive           │     ║
║  │  ⬇️                                           │     ║
║  │ 📊 Reports disk space freed                   │     ║
║  │  ⬇️                                           │     ║
║  │ ✅ Maintenance Complete!                      │     ║
║  └───────────────────────────────────────────────┘     ║
║                                                           ║
║  Benefits:                                               ║
║  ✅ Prevents disk space exhaustion                      ║
║  ✅ Runs during low-traffic hours                      ║
║  ✅ Keeps logs accessible for debugging                ║
║  ✅ Automatic archive retention policy                 ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
```

---

### 4️⃣ **Health Checks & Monitoring** 🏥

```
╔═══════════════════════════════════════════════════════════╗
║  HOURLY HEALTH CHECK CRONJOB                            ║
╠═══════════════════════════════════════════════════════════╣
║                                                           ║
║  Schedule: "0 * * * *"  (Every Hour) ⏰                  ║
║                                                           ║
║  Workflow:                                               ║
║  ┌───────────────────────────────────────────────┐     ║
║  │ ⏰ Every Hour (1 AM, 2 AM, 3 AM... 12 PM...   │     ║
║  │  ⬇️                                           │     ║
║  │ 📦 CronJob triggers                           │     ║
║  │  ⬇️                                           │     ║
║  │ 🔗 Pings all critical services                │     ║
║  │  ⬇️                                           │     ║
║  │ 📊 Checks database connections               │     ║
║  │  ⬇️                                           │     ║
║  │ 🌐 Verifies API endpoints                     │     ║
║  │  ⬇️                                           │     ║
║  │ 💾 Checks disk space                          │     ║
║  │  ⬇️                                           │     ║
║  │ 🧠 Monitors memory usage                      │     ║
║  │  ⬇️                                           │     ║
║  │ 📈 If all OK ✅: Log success                  │     ║
║  │  ⬇️                                           │     ║
║  │ 📧 If problem ❌: Alert ops team              │     ║
║  │  ⬇️                                           │     ║
║  │ ✅ Health Check Complete!                     │     ║
║  └───────────────────────────────────────────────┘     ║
║                                                           ║
║  Benefits:                                               ║
║  ✅ Early problem detection                            ║
║  ✅ Continuous monitoring 24/7                        ║
║  ✅ Alerting before outages                           ║
║  ✅ Historical health data collection                 ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
```

---

## 🎓📚 SUMMARY TABLE 📚🎓

```
╔═══════════════════════════════════════════════════════════════╗
║         JOB vs CRONJOB DETAILED COMPARISON                   ║
╠═════════════════════════════╦═════════════╦══════════════════╣
║ FEATURE                     ║    JOB 📦   ║  CRONJOB 🔄      ║
╠═════════════════════════════╬═════════════╬══════════════════╣
║ Execution Type              ║ One-time    ║ Scheduled/Repeat ║
║ Runs Once                   ║ ✅          ║ ❌               ║
║ Scheduled Execution         ║ ❌          ║ ✅               ║
║ Creates Pods Directly       ║ ✅          ║ ❌ (Indirect)    ║
║ Creates Jobs                ║ ❌          ║ ✅               ║
║ Repeated Execution          ║ ❌          ║ ✅               ║
║ Manual Trigger              ║ ✅          ║ ❌               ║
║ Auto Trigger on Schedule    ║ ❌          ║ ✅               ║
║ History Tracking            ║ Limited     ║ Configurable    ║
║ Resource Cleanup            ║ Manual      ║ Automatic        ║
║ Concurrency Control         ║ N/A         ║ ✅ (3 policies) ║
║ Suspend/Resume              ║ N/A         ║ ✅               ║
║ Automation Level            ║ Low         ║ High 🚀          ║
║ Use Case                    ║ One-time    ║ Repetitive       ║
║ Example                     ║ DB Migrate  ║ Daily Backup     ║
║ Timeline Pattern            ║ Linear      ║ Cyclical/Looped  ║
╚═════════════════════════════╩═════════════╩══════════════════╝
```

---

## 🎯💡 KEY TAKEAWAYS 💡🎯

```
╔═══════════════════════════════════════════════════════════════╗
║                   ⭐ GOLDEN INSIGHTS ⭐                      ║
╠═══════════════════════════════════════════════════════════════╣
║                                                               ║
║ 1️⃣ WHAT IS CRONJOB?                                         ║
║    └─ Scheduled Job Controller that creates Jobs            ║
║       automatically on a Cron schedule                       ║
║                                                               ║
║ 2️⃣ HOW DOES IT WORK?                                        ║
║    └─ CronJob → Creates Job → Creates Pod → Executes Task ║
║                                                               ║
║ 3️⃣ WHEN TO USE CRONJOB?                                     ║
║    └─ Repetitive tasks: backups, reports, cleanup, health   ║
║                                                               ║
║ 4️⃣ JOB vs CRONJOB RULE:                                     ║
║    └─ JOB = One-time ⏱️                                      ║
║    └─ CRONJOB = Scheduled & Repeating 🔄                    ║
║                                                               ║
║ 5️⃣ SCHEDULE EXPRESSION:                                     ║
║    └─ 5 fields: minute hour day month dayofweek            ║
║    └─ Example: "0 2 * * *" = 2 AM Daily                    ║
║                                                               ║
║ 6️⃣ CONCURRENCY POLICIES:                                    ║
║    └─ Allow: Both run (default)                             ║
║    └─ Forbid: Skip if still running                         ║
║    └─ Replace: Terminate old, start new                     ║
║                                                               ║
║ 7️⃣ HISTORY MANAGEMENT:                                      ║
║    └─ successfulJobsHistoryLimit: Keep recent successes    ║
║    └─ failedJobsHistoryLimit: Keep recent failures         ║
║                                                               ║
║ 8️⃣ SUSPEND/RESUME:                                          ║
║    └─ Temporarily pause without deleting                    ║
║                                                               ║
║ 9️⃣ BEST PRACTICES:                                          ║
║    └─ Use descriptive names 📛                              ║
║    └─ Set appropriate history limits 📊                     ║
║    └─ Choose right concurrency policy 🔀                    ║
║    └─ Monitor job execution 📈                              ║
║    └─ Handle failures gracefully ❌→✅                      ║
║                                                               ║
║ 🔟 COMMON USE CASES:                                        ║
║    └─ 💾 Backups                                            ║
║    └─ 📊 Reports                                            ║
║    └─ 🧹 Cleanup                                            ║
║    └─ 🏥 Health Checks                                      ║
║    └─ 📧 Notifications                                      ║
║    └─ 🔄 Sync Operations                                    ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
```

---

## 🚀🎊 MASTER SUMMARY 🎊🚀

```
╔═══════════════════════════════════════════════════════════════╗
║                  CRONJOB MASTERY CHECKLIST                   ║
╠═══════════════════════════════════════════════════════════════╣
║                                                               ║
║ ✅ Understand what CronJobs are & why they're needed        ║
║ ✅ Know the difference between Job & CronJob               ║
║ ✅ Can read & write Cron schedule expressions              ║
║ ✅ Understand CronJob architecture & lifecycle             ║
║ ✅ Can create basic CronJob YAML manifests                 ║
║ ✅ Know all important YAML fields & their purposes         ║
║ ✅ Understand concurrency policies & when to use them     ║
║ ✅ Can suspend & resume CronJobs when needed              ║
║ ✅ Know how to manage job history limits                   ║
║ ✅ Can troubleshoot common CronJob issues                  ║
║ ✅ Understand real-world use cases & best practices        ║
║ ✅ Ready for interviews & production deployments          ║
║                                                               ║
║         🎉 YOU'RE NOW A CRONJOB EXPERT! 🎉                ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
```

---

<div align="center">

## 🌟⭐ CREATED WITH ❤️ ⭐🌟

# 👨‍💻 KRISHNA PRAJAPAT 👨‍💻

### 🚀 DevOps | Cloud | Kubernetes Expert 🚀

**Master Kubernetes through detailed notes, real examples, and hands-on practice!**

---

### 🎯 Learning Journey:

```
Beginner 🟢 → Intermediate 🟡 → Advanced 🔴 → Expert 🏆
```

---

### 📚 Resources Created:

```
✅ Detailed Notes        🟢 Working Examples      ⭐ Best Practices
✅ Architecture Diagrams 🟢 Real-World Scenarios ⭐ Interview Q&A
✅ Complete Workflows    🟢 Troubleshooting      ⭐ Production Ready
```

---

### 💬 Community Contribution:

> **"Share knowledge, help others grow, elevate the tech community!"**

---

### 🏅 Achievements:

```
⭐ Kubernetes Certified
⭐ Cloud Native Architecture
⭐ Container Orchestration Expert
⭐ DevOps Best Practices
```

---

## 🎊 Special Thanks 🎊

To everyone learning Kubernetes and Container Orchestration!

Together we build better systems! 🌍

---

## 📞 Connect & Support

```
🔗 LinkedIn: kubernetes-experts
🐙 GitHub: devops-resources
📧 Email: learn@kubernetes.dev
💬 Community: #kubernetes-learning
```

---

# ⭐ **Happy Learning!** ⭐

# 🚀 **Keep Shipping!** 🚀

# 🎯 **Master Kubernetes!** 🎯

---

<div style="background: linear-gradient(45deg, #667eea 0%, #764ba2 100%); padding: 20px; border-radius: 10px;">

### 🌈 Remember:

**Every master was once a beginner.**
**Every expert started with the basics.**
**Your journey to Kubernetes mastery starts NOW!** 🚀

</div>

---

**Made with 💚 for the Kubernetes Community**

**Last Updated: 2024 | Version: 1.0 | Status: ✅ Complete**

</div>