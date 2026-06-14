<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content="Kubernetes ReplicaSet documentation — learn how ReplicaSets maintain desired Pod counts with self-healing and auto-scaling."/>
  <title>Kubernetes ReplicaSet — Documentation</title>
  <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;600;700&family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>
  <style>
    :root {
      --bg:       #0d1117;
      --surface:  #161b22;
      --surface2: #1c2330;
      --border:   #30363d;
      --accent:   #3b82f6;
      --accent2:  #8b5cf6;
      --green:    #22c55e;
      --red:      #ef4444;
      --yellow:   #f59e0b;
      --text:     #e6edf3;
      --muted:    #8b949e;
      --code-bg:  #131920;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    html { scroll-behavior: smooth; }

    body {
      background: var(--bg);
      color: var(--text);
      font-family: 'Inter', sans-serif;
      font-size: 15px;
      line-height: 1.7;
    }

    /* ── HERO ── */
    .hero {
      background: linear-gradient(135deg, #0d1117 0%, #1a1040 50%, #0d1117 100%);
      border-bottom: 1px solid var(--border);
      padding: 72px 24px 56px;
      text-align: center;
      position: relative;
      overflow: hidden;
    }
    .hero::before {
      content: '';
      position: absolute;
      inset: 0;
      background: radial-gradient(ellipse 80% 60% at 50% 0%, rgba(59,130,246,.18) 0%, transparent 70%);
      pointer-events: none;
    }
    .hero-badge {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      background: rgba(59,130,246,.12);
      border: 1px solid rgba(59,130,246,.35);
      border-radius: 99px;
      padding: 6px 16px;
      font-size: 12px;
      font-weight: 600;
      color: #93c5fd;
      letter-spacing: .06em;
      text-transform: uppercase;
      margin-bottom: 28px;
    }
    .hero h1 {
      font-size: clamp(2rem, 5vw, 3.4rem);
      font-weight: 800;
      letter-spacing: -.02em;
      line-height: 1.15;
      margin-bottom: 18px;
    }
    .hero h1 span {
      background: linear-gradient(90deg, #60a5fa, #a78bfa);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }
    .hero-sub {
      color: var(--muted);
      font-size: 1.05rem;
      max-width: 580px;
      margin: 0 auto 36px;
    }
    .badge-row {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
      justify-content: center;
    }
    .badge {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      padding: 5px 14px;
      border-radius: 6px;
      font-size: 12px;
      font-weight: 600;
    }
    .badge-blue   { background: rgba(59,130,246,.15);  border: 1px solid rgba(59,130,246,.4);  color: #93c5fd; }
    .badge-green  { background: rgba(34,197,94,.12);   border: 1px solid rgba(34,197,94,.35);  color: #86efac; }
    .badge-purple { background: rgba(139,92,246,.14);  border: 1px solid rgba(139,92,246,.4);  color: #c4b5fd; }
    .badge-yellow { background: rgba(245,158,11,.12);  border: 1px solid rgba(245,158,11,.35); color: #fcd34d; }

    /* ── LAYOUT ── */
    .container {
      max-width: 900px;
      margin: 0 auto;
      padding: 56px 24px 80px;
    }

    /* ── SECTION HEADERS ── */
    .section-label {
      display: flex;
      align-items: center;
      gap: 12px;
      margin-bottom: 22px;
      margin-top: 56px;
    }
    .section-label:first-child { margin-top: 0; }

    .section-icon {
      width: 38px;
      height: 38px;
      border-radius: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.1rem;
      flex-shrink: 0;
    }
    .icon-blue   { background: rgba(59,130,246,.18); border: 1px solid rgba(59,130,246,.3); }
    .icon-green  { background: rgba(34,197,94,.15);  border: 1px solid rgba(34,197,94,.3);  }
    .icon-purple { background: rgba(139,92,246,.18); border: 1px solid rgba(139,92,246,.3); }
    .icon-yellow { background: rgba(245,158,11,.15); border: 1px solid rgba(245,158,11,.3); }
    .icon-red    { background: rgba(239,68,68,.15);  border: 1px solid rgba(239,68,68,.3);  }

    .section-label h2 {
      font-size: 1.25rem;
      font-weight: 700;
      letter-spacing: -.01em;
    }

    /* ── CARDS ── */
    .card {
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 12px;
      padding: 28px;
      margin-bottom: 20px;
    }
    .card p {
      color: #c9d1d9;
      margin-bottom: 12px;
    }
    .card p:last-child { margin-bottom: 0; }

    /* ── CALLOUT ── */
    .callout {
      border-left: 3px solid var(--accent);
      background: rgba(59,130,246,.08);
      border-radius: 0 8px 8px 0;
      padding: 16px 20px;
      margin: 20px 0;
      font-size: .95rem;
      color: #93c5fd;
      font-style: italic;
    }
    .callout.green  { border-color: var(--green);  background: rgba(34,197,94,.07);  color: #86efac; }
    .callout.yellow { border-color: var(--yellow); background: rgba(245,158,11,.07); color: #fcd34d; }

    /* ── POD VISUALIZER ── */
    .pod-grid {
      display: flex;
      gap: 14px;
      flex-wrap: wrap;
      margin: 18px 0;
    }
    .pod-card {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 8px;
      background: var(--surface2);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 18px 24px;
      min-width: 100px;
      transition: border-color .2s;
    }
    .pod-card.ok   { border-color: rgba(34,197,94,.5); }
    .pod-card.fail { border-color: rgba(239,68,68,.5); }
    .pod-card .pod-icon { font-size: 1.6rem; }
    .pod-card .pod-name {
      font-size: .75rem;
      font-family: 'JetBrains Mono', monospace;
      color: var(--muted);
    }
    .status-dot {
      width: 8px;
      height: 8px;
      border-radius: 50%;
    }
    .status-dot.ok   { background: var(--green); box-shadow: 0 0 6px var(--green); }
    .status-dot.fail { background: var(--red);   box-shadow: 0 0 6px var(--red);   }

    .heal-arrow {
      text-align: center;
      font-size: 1.1rem;
      margin: 10px 0;
      color: var(--accent);
      font-weight: 600;
    }
    .state-chip {
      display: inline-block;
      font-family: 'JetBrains Mono', monospace;
      font-size: .8rem;
      background: var(--code-bg);
      border: 1px solid var(--border);
      border-radius: 6px;
      padding: 6px 14px;
      color: var(--yellow);
      margin: 6px 4px;
    }
    .state-chip.danger { color: #ef4444; }

    /* ── CODE BLOCK ── */
    .code-wrap {
      background: var(--code-bg);
      border: 1px solid var(--border);
      border-radius: 10px;
      overflow: hidden;
      margin: 16px 0;
    }
    .code-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 10px 16px;
      background: rgba(255,255,255,.03);
      border-bottom: 1px solid var(--border);
      font-size: .75rem;
      color: var(--muted);
      font-family: 'JetBrains Mono', monospace;
    }
    .code-dots { display: flex; gap: 6px; }
    .code-dots span { width: 10px; height: 10px; border-radius: 50%; }
    .code-dots .r { background: #ff5f57; }
    .code-dots .y { background: #ffbd2e; }
    .code-dots .g { background: #28ca41; }

    pre {
      padding: 20px;
      overflow-x: auto;
      font-family: 'JetBrains Mono', monospace;
      font-size: .82rem;
      line-height: 1.7;
      color: #c9d1d9;
    }
    .kw  { color: #f97316; }
    .str { color: #86efac; }
    .num { color: #a78bfa; }
    .cm  { color: #6e7681; }
    .key { color: #79c0ff; }
    .gr  { color: #22c55e; }
    .yl  { color: #f59e0b; }

    /* ── TABLES ── */
    table {
      width: 100%;
      border-collapse: collapse;
      font-size: .88rem;
      margin-top: 8px;
    }
    th {
      background: rgba(59,130,246,.1);
      border: 1px solid var(--border);
      padding: 11px 16px;
      text-align: left;
      font-weight: 600;
      color: #93c5fd;
    }
    td {
      border: 1px solid var(--border);
      padding: 10px 16px;
      color: #c9d1d9;
    }
    tr:nth-child(even) td { background: rgba(255,255,255,.02); }
    .check { color: var(--green);  font-size: 1rem; }
    .cross { color: var(--red);    font-size: 1rem; }
    .warn  { color: var(--yellow); font-size: .85rem; }

    /* ── WORKFLOW ── */
    .flow {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      gap: 0;
      margin: 18px 0;
    }
    .flow-step {
      display: flex;
      align-items: center;
      gap: 14px;
    }
    .flow-dot {
      width: 12px;
      height: 12px;
      border-radius: 50%;
      background: var(--accent);
      box-shadow: 0 0 8px rgba(59,130,246,.7);
      flex-shrink: 0;
    }
    .flow-line {
      width: 2px;
      height: 28px;
      background: linear-gradient(to bottom, var(--accent), var(--accent2));
      margin-left: 5px;
    }
    .flow-text {
      font-size: .9rem;
      color: #c9d1d9;
      padding: 8px 14px;
      background: var(--surface2);
      border: 1px solid var(--border);
      border-radius: 8px;
    }

    /* ── ARCHITECTURE ── */
    .arch {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 6px;
      padding: 28px;
      background: var(--surface2);
      border: 1px solid var(--border);
      border-radius: 12px;
      margin: 18px 0;
    }
    .arch-box {
      border-radius: 10px;
      padding: 12px 32px;
      font-weight: 700;
      font-size: .95rem;
      text-align: center;
    }
    .arch-box.deployment {
      background: linear-gradient(135deg, rgba(139,92,246,.2), rgba(139,92,246,.1));
      border: 1px solid rgba(139,92,246,.5);
      color: #c4b5fd;
    }
    .arch-box.replicaset {
      background: linear-gradient(135deg, rgba(59,130,246,.2), rgba(139,92,246,.2));
      border: 1px solid rgba(59,130,246,.5);
      color: #93c5fd;
    }
    .arch-arrow {
      color: var(--muted);
      font-size: .9rem;
      margin: 2px 0;
    }
    .arch-pods {
      display: flex;
      gap: 14px;
      margin-top: 6px;
      flex-wrap: wrap;
      justify-content: center;
    }
    .arch-pod {
      background: rgba(34,197,94,.1);
      border: 1px solid rgba(34,197,94,.3);
      border-radius: 8px;
      padding: 10px 20px;
      font-family: 'JetBrains Mono', monospace;
      font-size: .8rem;
      color: #86efac;
      text-align: center;
    }

    /* ── COMMANDS ── */
    .cmd-list { display: flex; flex-direction: column; gap: 12px; margin-top: 4px; }
    .cmd-item {
      background: var(--code-bg);
      border: 1px solid var(--border);
      border-radius: 8px;
      padding: 14px 18px;
      font-family: 'JetBrains Mono', monospace;
      font-size: .82rem;
      color: #86efac;
      display: flex;
      align-items: center;
      gap: 12px;
      transition: border-color .2s;
    }
    .cmd-item:hover { border-color: rgba(59,130,246,.5); }
    .cmd-prefix { color: var(--accent); font-weight: 700; flex-shrink: 0; }
    .cmd-text   { flex: 1; }
    .cmd-label  { font-family: 'Inter', sans-serif; font-size: .72rem; color: var(--muted); white-space: nowrap; }

    /* ── LABELS SECTION ── */
    .label-pair {
      display: flex;
      gap: 14px;
      flex-wrap: wrap;
      margin-top: 12px;
      align-items: center;
    }
    .label-box {
      flex: 1;
      min-width: 160px;
      background: var(--code-bg);
      border-radius: 8px;
      padding: 16px;
    }
    .label-box.blue  { border: 1px solid rgba(59,130,246,.4); }
    .label-box.green { border: 1px solid rgba(34,197,94,.4);  }
    .label-box-title {
      font-size: .72rem;
      font-weight: 600;
      text-transform: uppercase;
      margin-bottom: 8px;
    }
    .label-box.blue  .label-box-title { color: #93c5fd; }
    .label-box.green .label-box-title { color: #86efac; }
    .label-box code {
      font-family: 'JetBrains Mono', monospace;
      font-size: .82rem;
    }
    .label-box.blue  code { color: #c4b5fd; }
    .label-box.green code { color: #86efac; }
    .label-connector { font-size: 1.4rem; flex-shrink: 0; }

    /* ── QA SECTION ── */
    .qa-item {
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 10px;
      margin-bottom: 14px;
      overflow: hidden;
    }
    .qa-q {
      padding: 16px 20px;
      font-weight: 600;
      font-size: .93rem;
      color: #93c5fd;
      background: rgba(59,130,246,.06);
      border-bottom: 1px solid var(--border);
    }
    .qa-a {
      padding: 16px 20px;
      color: #c9d1d9;
      font-size: .9rem;
      line-height: 1.7;
    }

    /* ── OUTCOMES ── */
    .outcomes-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 14px;
      margin-top: 8px;
    }
    .outcome-item {
      background: var(--surface2);
      border: 1px solid rgba(34,197,94,.25);
      border-radius: 10px;
      padding: 16px 18px;
      display: flex;
      align-items: flex-start;
      gap: 12px;
      font-size: .88rem;
      color: #c9d1d9;
    }
    .outcome-icon { font-size: 1.1rem; flex-shrink: 0; }

    /* ── GOLDEN RULE ── */
    .golden {
      background: linear-gradient(135deg, rgba(245,158,11,.08), rgba(139,92,246,.08));
      border: 1px solid rgba(245,158,11,.3);
      border-radius: 14px;
      padding: 32px;
      text-align: center;
      margin-top: 56px;
    }
    .golden h3 {
      font-size: 1rem;
      text-transform: uppercase;
      letter-spacing: .1em;
      color: var(--yellow);
      margin-bottom: 24px;
    }
    .rule-row {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 14px;
      flex-wrap: wrap;
      font-size: .9rem;
      color: #c9d1d9;
    }
    .rule-chip {
      background: var(--surface2);
      border: 1px solid var(--border);
      border-radius: 8px;
      padding: 10px 20px;
      font-weight: 600;
      line-height: 1.6;
    }
    .rule-chip small {
      display: block;
      font-weight: 400;
      color: var(--muted);
    }
    .rule-arrow { color: var(--muted); font-size: 1.1rem; }

    /* ── DIVIDER ── */
    .divider {
      border: none;
      border-top: 1px solid var(--border);
      margin: 48px 0 0;
    }

    /* ── FOOTER ── */
    footer {
      text-align: center;
      padding: 32px 24px;
      color: var(--muted);
      font-size: .8rem;
      border-top: 1px solid var(--border);
    }

    /* ── RESPONSIVE ── */
    @media (max-width: 600px) {
      .hero { padding: 48px 20px 40px; }
      .pod-grid { gap: 8px; }
      .pod-card { min-width: 85px; padding: 14px 16px; }
      .arch-pods { flex-wrap: wrap; }
      .rule-row { flex-direction: column; gap: 8px; }
      .label-pair { flex-direction: column; }
      .label-connector { transform: rotate(90deg); text-align: center; }
      .cmd-label { display: none; }
    }
  </style>
</head>
<body>

<!-- ═══════════════════ HERO ═══════════════════ -->
<header class="hero">
  <div class="hero-badge">☸️ Kubernetes Controller</div>
  <h1>🔄 <span>ReplicaSet</span></h1>
  <p class="hero-sub">Ensure the right number of Pods are always running — automatically, reliably, and without manual intervention.</p>
  <div class="badge-row">
    <span class="badge badge-blue">⚙️ Controller</span>
    <span class="badge badge-green">🛡️ Self-Healing</span>
    <span class="badge badge-purple">📈 Auto-Scaling</span>
    <span class="badge badge-yellow">🏷️ Label-Driven</span>
  </div>
</header>

<!-- ═══════════════════ MAIN CONTENT ═══════════════════ -->
<main class="container">

  <!-- 1. OVERVIEW -->
  <div class="section-label">
    <div class="section-icon icon-blue">📖</div>
    <h2>Overview</h2>
  </div>
  <div class="card">
    <p>A <strong>ReplicaSet</strong> is a Kubernetes controller whose single, laser-focused job is to maintain a stable set of identical Pods at all times. If a Pod crashes, disappears, or becomes unhealthy, the ReplicaSet immediately spins up a replacement — no human intervention needed.</p>
    <p>It acts as the guardian of your desired Pod count, continuously watching and reconciling actual state against desired state.</p>
    <div class="callout">💡 Core mission — keep the desired number of Pod replicas running, always.</div>
  </div>

  <!-- 2. SELF-HEALING -->
  <div class="section-label">
    <div class="section-icon icon-green">🛡️</div>
    <h2>Self-Healing in Action</h2>
  </div>
  <div class="card">
    <p><strong>Step 1:</strong> All three Pods are healthy and serving traffic.</p>
    <div class="pod-grid">
      <div class="pod-card ok">
        <div class="pod-icon">🟢</div>
        <div class="pod-name">Pod-1</div>
        <div class="status-dot ok"></div>
      </div>
      <div class="pod-card ok">
        <div class="pod-icon">🟢</div>
        <div class="pod-name">Pod-2</div>
        <div class="status-dot ok"></div>
      </div>
      <div class="pod-card ok">
        <div class="pod-icon">🟢</div>
        <div class="pod-name">Pod-3</div>
        <div class="status-dot ok"></div>
      </div>
    </div>

    <p><strong>Step 2:</strong> Pod-2 crashes unexpectedly.</p>
    <div class="pod-grid">
      <div class="pod-card ok">
        <div class="pod-icon">🟢</div>
        <div class="pod-name">Pod-1</div>
        <div class="status-dot ok"></div>
      </div>
      <div class="pod-card fail">
        <div class="pod-icon">🔴</div>
        <div class="pod-name">Pod-2</div>
        <div class="status-dot fail"></div>
      </div>
      <div class="pod-card ok">
        <div class="pod-icon">🟢</div>
        <div class="pod-name">Pod-3</div>
        <div class="status-dot ok"></div>
      </div>
    </div>
    <div>
      <span class="state-chip">Desired: 3</span>
      <span class="state-chip">Current: 2</span>
      <span class="state-chip danger">⚠️ Mismatch Detected</span>
    </div>

    <div class="heal-arrow">⬇️ ReplicaSet detects mismatch → creates a replacement Pod</div>

    <p><strong>Step 3:</strong> ReplicaSet restores desired state automatically.</p>
    <div class="pod-grid">
      <div class="pod-card ok">
        <div class="pod-icon">🟢</div>
        <div class="pod-name">Pod-1</div>
        <div class="status-dot ok"></div>
      </div>
      <div class="pod-card ok">
        <div class="pod-icon">🟢</div>
        <div class="pod-name">Pod-2 ✨</div>
        <div class="status-dot ok"></div>
      </div>
      <div class="pod-card ok">
        <div class="pod-icon">🟢</div>
        <div class="pod-name">Pod-3</div>
        <div class="status-dot ok"></div>
      </div>
    </div>
    <div class="callout green">✅ Desired state restored — zero manual action required.</div>
  </div>

  <!-- 3. ARCHITECTURE -->
  <div class="section-label">
    <div class="section-icon icon-purple">🏗️</div>
    <h2>Architecture</h2>
  </div>
  <div class="arch">
    <div class="arch-box replicaset">🔄 ReplicaSet</div>
    <div class="arch-arrow">⬇️ watches &amp; manages</div>
    <div class="arch-pods">
      <div class="arch-pod">🟢 Pod 1</div>
      <div class="arch-pod">🟢 Pod 2</div>
      <div class="arch-pod">🟢 Pod 3</div>
    </div>
  </div>
  <p style="color:var(--muted);font-size:.88rem;margin-top:8px;">The ReplicaSet continuously reconciles the actual Pod count against the desired count, creating or deleting Pods as needed to match the spec.</p>

  <!-- 4. MANIFEST -->
  <div class="section-label">
    <div class="section-icon icon-yellow">📝</div>
    <h2>ReplicaSet Manifest</h2>
  </div>
  <div class="code-wrap">
    <div class="code-header">
      <div class="code-dots">
        <span class="r"></span>
        <span class="y"></span>
        <span class="g"></span>
      </div>
      <span>replicaset.yml</span>
    </div>
    <pre><span class="key">apiVersion</span>: <span class="str">apps/v1</span>
<span class="key">kind</span>: <span class="str">ReplicaSet</span>

<span class="key">metadata</span>:
  <span class="key">name</span>: <span class="str">nginx-rs</span>          <span class="cm"># name of the ReplicaSet</span>

<span class="key">spec</span>:
  <span class="key">replicas</span>: <span class="num">3</span>             <span class="cm"># 👈 desired Pod count</span>

  <span class="key">selector</span>:
    <span class="key">matchLabels</span>:
      <span class="key">app</span>: <span class="str">nginx</span>         <span class="cm"># selects Pods with this label</span>

  <span class="key">template</span>:             <span class="cm"># Pod blueprint</span>
    <span class="key">metadata</span>:
      <span class="key">labels</span>:
        <span class="key">app</span>: <span class="str">nginx</span>       <span class="cm"># must match selector above ☝️</span>

    <span class="key">spec</span>:
      <span class="key">containers</span>:
        - <span class="key">name</span>: <span class="str">nginx</span>
          <span class="key">image</span>: <span class="str">nginx:latest</span>
          <span class="key">ports</span>:
            - <span class="key">containerPort</span>: <span class="num">80</span></pre>
  </div>

  <!-- 5. WORKFLOW -->
  <div class="section-label">
    <div class="section-icon icon-blue">🔍</div>
    <h2>Reconciliation Workflow</h2>
  </div>
  <div class="card">
    <p>The ReplicaSet continuously runs a control loop to enforce the desired state:</p>
    <div class="flow">
      <div class="flow-step">
        <div class="flow-dot"></div>
        <div class="flow-text">🚀 ReplicaSet is created with <code>replicas: 3</code></div>
      </div>
      <div class="flow-line"></div>
      <div class="flow-step">
        <div class="flow-dot"></div>
        <div class="flow-text">🏗️ Kubernetes creates 3 Pods matching the template</div>
      </div>
      <div class="flow-line"></div>
      <div class="flow-step">
        <div class="flow-dot"></div>
        <div class="flow-text">👁️ ReplicaSet continuously monitors Pod health &amp; count</div>
      </div>
      <div class="flow-line"></div>
      <div class="flow-step">
        <div class="flow-dot"></div>
        <div class="flow-text">❓ Pod failure detected — current count drops below desired</div>
      </div>
      <div class="flow-line"></div>
      <div class="flow-step">
        <div class="flow-dot"></div>
        <div class="flow-text">✨ Creates a replacement Pod to restore desired count</div>
      </div>
      <div class="flow-line"></div>
      <div class="flow-step">
        <div class="flow-dot"></div>
        <div class="flow-text">✅ Desired state restored — loop continues watching</div>
      </div>
    </div>
  </div>

  <!-- 6. COMMANDS -->
  <div class="section-label">
    <div class="section-icon icon-green">⚡</div>
    <h2>Essential Commands</h2>
  </div>
  <div class="cmd-list">
    <div class="cmd-item">
      <span class="cmd-prefix">$</span>
      <span class="cmd-text">kubectl apply -f replicaset.yml</span>
      <span class="cmd-label">📦 Create / Update</span>
    </div>
    <div class="cmd-item">
      <span class="cmd-prefix">$</span>
      <span class="cmd-text">kubectl get rs</span>
      <span class="cmd-label">📋 List ReplicaSets</span>
    </div>
    <div class="cmd-item">
      <span class="cmd-prefix">$</span>
      <span class="cmd-text">kubectl get pods</span>
      <span class="cmd-label">🔍 View Pods</span>
    </div>
    <div class="cmd-item">
      <span class="cmd-prefix">$</span>
      <span class="cmd-text">kubectl describe rs nginx-rs</span>
      <span class="cmd-label">🔬 Inspect Details</span>
    </div>
    <div class="cmd-item">
      <span class="cmd-prefix">$</span>
      <span class="cmd-text">kubectl delete pod &lt;pod-name&gt;</span>
      <span class="cmd-label">🛡️ Test Self-Healing</span>
    </div>
    <div class="cmd-item">
      <span class="cmd-prefix">$</span>
      <span class="cmd-text">kubectl scale rs nginx-rs --replicas=5</span>
      <span class="cmd-label">📈 Scale Up</span>
    </div>
    <div class="cmd-item">
      <span class="cmd-prefix">$</span>
      <span class="cmd-text">kubectl scale rs nginx-rs --replicas=2</span>
      <span class="cmd-label">📉 Scale Down</span>
    </div>
    <div class="cmd-item">
      <span class="cmd-prefix">$</span>
      <span class="cmd-text">kubectl delete rs nginx-rs</span>
      <span class="cmd-label">🗑️ Delete</span>
    </div>
  </div>

  <!-- 7. LABELS & SELECTORS -->
  <div class="section-label">
    <div class="section-icon icon-purple">🏷️</div>
    <h2>Labels &amp; Selectors</h2>
  </div>
  <div class="card">
    <p>ReplicaSets use label selectors to discover and manage Pods. The selector in the ReplicaSet spec <strong>must exactly match</strong> the labels on the Pod template — otherwise the ReplicaSet cannot manage those Pods.</p>
    <div class="label-pair">
      <div class="label-box blue">
        <div class="label-box-title">ReplicaSet Selector</div>
        <code>app: nginx</code>
      </div>
      <div class="label-connector">🔗</div>
      <div class="label-box green">
        <div class="label-box-title">Pod Label</div>
        <code>app: nginx</code>
      </div>
    </div>
    <div class="callout green" style="margin-top:16px;">✅ Labels match → ReplicaSet manages the Pod &nbsp;|&nbsp; ❌ No match → Pod is ignored</div>
  </div>

  <!-- 8. COMPARISON: RS vs Pod -->
  <div class="section-label">
    <div class="section-icon icon-yellow">⚔️</div>
    <h2>ReplicaSet vs Pod</h2>
  </div>
  <div class="card" style="padding:0;overflow:hidden;">
    <table>
      <thead>
        <tr>
          <th>Feature</th>
          <th>🫙 Pod (alone)</th>
          <th>🔄 ReplicaSet</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Runs Containers</td>
          <td class="check">✅</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Self-Healing</td>
          <td class="cross">❌</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Maintains Desired Count</td>
          <td class="cross">❌</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Scaling Support</td>
          <td class="cross">❌</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Automatic Recovery</td>
          <td class="cross">❌</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Production Suitable</td>
          <td class="cross">❌</td>
          <td class="warn">⚠️ Use Deployment instead</td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- 9. COMPARISON: RS vs Deployment -->
  <div class="section-label">
    <div class="section-icon icon-blue">🚀</div>
    <h2>ReplicaSet vs Deployment</h2>
  </div>
  <div class="card" style="padding:0;overflow:hidden;">
    <table>
      <thead>
        <tr>
          <th>Feature</th>
          <th>🔄 ReplicaSet</th>
          <th>🚀 Deployment</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Pod Management</td>
          <td class="check">✅</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Self-Healing</td>
          <td class="check">✅</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Scaling</td>
          <td class="check">✅</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Rolling Updates</td>
          <td class="cross">❌</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Rollbacks</td>
          <td class="cross">❌</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Update History</td>
          <td class="cross">❌</td>
          <td class="check">✅</td>
        </tr>
        <tr>
          <td>Production Ready</td>
          <td class="warn">⚠️ Limited</td>
          <td class="check">✅ Recommended</td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- 10. RELATIONSHIP WITH DEPLOYMENT -->
  <div class="section-label">
    <div class="section-icon icon-purple">🔗</div>
    <h2>Relationship with Deployments</h2>
  </div>
  <div class="card">
    <p>In production, engineers rarely create ReplicaSets directly. A <strong>Deployment</strong> creates and manages ReplicaSets under the hood, adding rolling updates and rollback capabilities on top of everything a ReplicaSet provides.</p>
    <div class="arch">
      <div class="arch-box deployment">🚀 Deployment</div>
      <div class="arch-arrow">⬇️ creates &amp; owns</div>
      <div class="arch-box replicaset">🔄 ReplicaSet</div>
      <div class="arch-arrow">⬇️ watches &amp; manages</div>
      <div class="arch-pods">
        <div class="arch-pod">🟢 Pod 1</div>
        <div class="arch-pod">🟢 Pod 2</div>
        <div class="arch-pod">🟢 Pod 3</div>
      </div>
    </div>
    <div class="callout yellow">⚠️ You will rarely write a ReplicaSet YAML directly. Deployments create them automatically — and manage them for you.</div>
  </div>

  <!-- 11. INTERVIEW Q&A -->
  <div class="section-label">
    <div class="section-icon icon-yellow">🧠</div>
    <h2>Interview Questions</h2>
  </div>

  <div class="qa-item">
    <div class="qa-q">❓ What is a ReplicaSet in Kubernetes?</div>
    <div class="qa-a">A ReplicaSet is a Kubernetes controller that ensures a specified number of identical Pod replicas are running at all times. If any Pod fails or is deleted, the ReplicaSet automatically creates a replacement to maintain the desired count.</div>
  </div>

  <div class="qa-item">
    <div class="qa-q">❓ What is the difference between a ReplicaSet and a Pod?</div>
    <div class="qa-a">A standalone Pod has no self-healing capability — if it crashes, it stays dead. A ReplicaSet wraps Pods with a controller that monitors their health and automatically replaces any that fail, maintaining the desired replica count at all times.</div>
  </div>

  <div class="qa-item">
    <div class="qa-q">❓ Why do we use Deployments instead of ReplicaSets directly?</div>
    <div class="qa-a">A Deployment manages ReplicaSets and adds critical production features on top: rolling updates (update Pods gradually with zero downtime), rollback (revert to a previous version instantly), and update history tracking. For production workloads, always use a Deployment.</div>
  </div>

  <div class="qa-item">
    <div class="qa-q">❓ What happens when you delete a Pod managed by a ReplicaSet?</div>
    <div class="qa-a">The ReplicaSet detects that the actual Pod count (e.g. 2) has dropped below the desired count (e.g. 3). It immediately schedules a new Pod to restore the desired state. This is exactly how you can manually test self-healing behavior.</div>
  </div>

  <div class="qa-item">
    <div class="qa-q">❓ How does a ReplicaSet identify which Pods it manages?</div>
    <div class="qa-a">Through label selectors. The ReplicaSet's <code>spec.selector.matchLabels</code> must match the labels defined in the Pod template (<code>spec.template.metadata.labels</code>). Any Pod with matching labels is considered managed by that ReplicaSet.</div>
  </div>

  <!-- 12. LEARNING OUTCOMES -->
  <div class="section-label">
    <div class="section-icon icon-green">🎓</div>
    <h2>Learning Outcomes</h2>
  </div>
  <div class="outcomes-grid">
    <div class="outcome-item">
      <span class="outcome-icon">✅</span>
      <span>Understand what a ReplicaSet is and why it exists</span>
    </div>
    <div class="outcome-item">
      <span class="outcome-icon">✅</span>
      <span>Write a ReplicaSet YAML manifest from scratch</span>
    </div>
    <div class="outcome-item">
      <span class="outcome-icon">✅</span>
      <span>Explain self-healing and how it works internally</span>
    </div>
    <div class="outcome-item">
      <span class="outcome-icon">✅</span>
      <span>Use label selectors to connect ReplicaSets to Pods</span>
    </div>
    <div class="outcome-item">
      <span class="outcome-icon">✅</span>
      <span>Scale ReplicaSets up and down using kubectl</span>
    </div>
    <div class="outcome-item">
      <span class="outcome-icon">✅</span>
      <span>Explain why Deployments are preferred over raw ReplicaSets</span>
    </div>
    <div class="outcome-item">
      <span class="outcome-icon">✅</span>
      <span>Describe the Deployment → ReplicaSet → Pod hierarchy</span>
    </div>
    <div class="outcome-item">
      <span class="outcome-icon">✅</span>
      <span>Confidently answer ReplicaSet interview questions</span>
    </div>
  </div>

  <!-- GOLDEN RULE -->
  <div class="golden">
    <h3>⭐ The Golden Rule</h3>
    <div class="rule-row">
      <div class="rule-chip">
        🫙 Pod
        <small>runs the app</small>
      </div>
      <div class="rule-arrow">→</div>
      <div class="rule-chip">
        🔄 ReplicaSet
        <small>keeps it running</small>
      </div>
      <div class="rule-arrow">→</div>
      <div class="rule-chip">
        🚀 Deployment
        <small>manages the ReplicaSet</small>
      </div>
    </div>
  </div>

</main>

<!-- ═══════════════════ FOOTER ═══════════════════ -->
<footer>
  <p>☸️ Kubernetes ReplicaSet Documentation &nbsp;·&nbsp; Built for learning and reference &nbsp;·&nbsp; 2025</p>
</footer>

</body>
</html>
