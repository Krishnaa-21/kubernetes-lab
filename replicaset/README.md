<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Kubernetes ReplicaSet — Documentation</title>
  <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;600;700&family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>
  <style>
    :root {
      --bg:        #0d1117;
      --surface:   #161b22;
      --surface2:  #1c2330;
      --border:    #30363d;
      --accent:    #3b82f6;
      --accent2:   #8b5cf6;
      --green:     #22c55e;
      --red:       #ef4444;
      --yellow:    #f59e0b;
      --text:      #e6edf3;
      --muted:     #8b949e;
      --code-bg:   #131920;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

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
    .badge-blue   { background: rgba(59,130,246,.15); border: 1px solid rgba(59,130,246,.4); color: #93c5fd; }
    .badge-green  { background: rgba(34,197,94,.12);  border: 1px solid rgba(34,197,94,.35);  color: #86efac; }
    .badge-purple { background: rgba(139,92,246,.14); border: 1px solid rgba(139,92,246,.4);  color: #c4b5fd; }
    .badge-yellow { background: rgba(245,158,11,.12); border: 1px solid rgba(245,158,11,.35); color: #fcd34d; }

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
    .icon-blue   { background: rgba(59,130,246,.18);  border: 1px solid rgba(59,130,246,.3); }
    .icon-green  { background: rgba(34,197,94,.15);   border: 1px solid rgba(34,197,94,.3); }
    .icon-purple { background: rgba(139,92,246,.18);  border: 1px solid rgba(139,92,246,.3); }
    .icon-yellow { background: rgba(245,158,11,.15);  border: 1px solid rgba(245,158,11,.3); }
    .icon-red    { background: rgba(239,68,68,.15);   border: 1px solid rgba(239,68,68,.3); }

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
    .card p { color: #c9d1d9; margin-bottom: 12px; }
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
      min-width: 110px;
      transition: border-color .2s;
    }
    .pod-card.ok   { border-color: rgba(34,197,94,.5);  }
    .pod-card.fail { border-color: rgba(239,68,68,.5);  }
    .pod-card .pod-icon { font-size: 1.6rem; }
    .pod-card .pod-name { font-size: .75rem; font-family: 'JetBrains Mono', monospace; color: var(--muted); }
    .pod-card .status-dot {
      width: 8px; height: 8px; border-radius: 50%;
    }
    .status-dot.ok   { background: var(--green);  box-shadow: 0 0 6px var(--green); }
    .status-dot.fail { background: var(--red);    box-shadow: 0 0 6px var(--red); }

    .heal-arrow {
      text-align: center;
      font-size: 1.5rem;
      margin: 10px 0;
      color: var(--accent);
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
    .kw   { color: #f97316; }
    .str  { color: #86efac; }
    .num  { color: #a78bfa; }
    .cm   { color: #6e7681; }
    .key  { color: #79c0ff; }

    /* ── COMPARISON TABLES ── */
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
    .check  { color: var(--green);  font-size: 1rem; }
    .cross  { color: var(--red);    font-size: 1rem; }
    .warn   { color: var(--yellow); font-size: .8rem; }

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
      width: 12px; height: 12px; border-radius: 50%;
      background: var(--accent);
      box-shadow: 0 0 8px rgba(59,130,246,.7);
      flex-shrink: 0;
    }
    .flow-line {
      width: 2px; height: 28px;
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
    .arch-rs {
      background: linear-gradient(135deg, rgba(59,130,246,.2), rgba(139,92,246,.2));
      border: 1px solid rgba(59,130,246,.5);
      border-radius: 10px;
      padding: 12px 32px;
      font-weight: 700;
      font-size: .95rem;
      color: #93c5fd;
      margin-bottom: 10px;
    }
    .arch-arrow { color: var(--muted); font-size: .9rem; }
    .arch-pods {
      display: flex;
      gap: 14px;
      margin-top: 6px;
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
    }
    .cmd-item::before { content: '$'; color: var(--accent); font-weight: 700; }
    .cmd-label { margin-left: auto; font-family: 'Inter', sans-serif; font-size: .72rem; color: var(--muted); }

    /* ── GOLDEN RULE ── */
    .golden {
      background: linear-gradient(135deg, rgba(245,158,11,.08), rgba(139,92,246,.08));
      border: 1px solid rgba(245,158,11,.3);
      border-radius: 14px;
      padding: 32px;
      text-align: center;
      margin-top: 56px;
    }
    .golden h3 { font-size: 1rem; text-transform: uppercase; letter-spacing: .1em; color: var(--yellow); margin-bottom: 20px; }
    .golden .rule-row {
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
      padding: 8px 18px;
      font-weight: 600;
    }
    .rule-arrow { color: var(--muted); font-size: 1.1rem; }

    /* ── FOOTER ── */
    footer {
      text-align: center;
      padding: 32px 24px;
      color: var(--muted);
      font-size: .8rem;
      border-top: 1px solid var(--border);
    }

    /* ── DIVIDER ── */
    .divider {
      border: none;
      border-top: 1px solid var(--border);
      margin: 48px 0 0;
    }

    @media (max-width: 600px) {
      .pod-grid { gap: 10px; }
      .arch-pods { flex-wrap: wrap; }
      .rule-row  { flex-direction: column; gap: 8px; }
    }
  </style>
</head>
<body>

<!-- ═══════════════ HERO ═══════════════ -->
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

<!-- ═══════════════ CONTENT ═══════════════ -->
<main class="container">

  <!-- OVERVIEW -->
  <div class="section-label">
    <div class="section-icon icon-blue">📖</div>
    <h2>Overview</h2>
  </div>
  <div class="card">
    <p>A <strong>ReplicaSet</strong> is a Kubernetes controller whose single, laser-focused job is to maintain a stable set of identical Pods at all times. If a Pod crashes, disappears, or becomes unhealthy, the ReplicaSet immediately spins up a replacement — no human intervention needed.</p>
    <div class="callout">💡 Keep the desired number of Pod replicas running — always.</div>
  </div>

  <!-- SELF-HEALING -->
  <div class="section-label" style="margin-top:48px;">
    <div class="section-icon icon-green">🛡️</div>
    <h2>Self-Healing in Action</h2>
  </div>
  <div class="card">
    <p>All three Pods are healthy and serving traffic:</p>
    <div class="pod-grid">
      <div class="pod-card ok"><div class="pod-icon">🟢</div><div class="pod-name">Pod-1</div><div class="status-dot ok"></div></div>
      <div class="pod-card ok"><div class="pod-icon">🟢</div><div class="pod-name">Pod-2</div><div class="status-dot ok"></div></div>
      <div class="pod-card ok"><div class="pod-icon">🟢</div><div class="pod-name">Pod-3</div><div class="status-dot ok"></div></div>
    </div>
    <p>Pod-2 crashes unexpectedly:</p>
    <div class="pod-grid">
      <div class="pod-card ok"><div class="pod-icon">🟢</div><div class="pod-name">Pod-1</div><div class="status-dot ok"></div></div>
      <div class="pod-card fail"><div class="pod-icon">🔴</div><div class="pod-name">Pod-2</div><div class="status-dot fail"></div></div>
      <div class="pod-card ok"><div class="pod-icon">🟢</div><div class="pod-name">Pod-3</div><div class="status-dot ok"></div></div>
    </div>
    <div>
      <span class="state-chip">Desired: 3</span>
      <span class="state-chip">Current: 2</span>
      <span class="state-chip" style="color:#ef4444">⚠️ Mismatch Detected</span>
    </div>
    <div class="heal-arrow">⬇️ ReplicaSet creates a replacement</div>
    <div class="pod-grid">
      <div class="pod-card ok"><div class="pod-icon">🟢</div><div class="pod-name">Pod-1</div><div class="status-dot ok"></div></div>
      <div class="pod-card ok"><div class="pod-icon">🟢</div><div class="pod-name">Pod-2 ✨</div><div class="status-dot ok"></div></div>
      <div class="pod-card ok"><div class="pod-icon">🟢</div><div class="pod-name">Pod-3</div><div class="status-dot ok"></div></div>
    </div>
    <div class="callout green">✅ Desired state restored — zero manual action required.</div>
  </div>

  <!-- ARCHITECTURE -->
  <div class="section-label">
    <div class="section-icon icon-purple">🏗️</div>
    <h2>Architecture</h2>
  </div>
  <div class="arch">
    <div class="arch-rs">☸️ ReplicaSet</div>
    <div class="arch-arrow">⬇️ watches &amp; manages</div>
    <div class="arch-pods">
      <div class="arch-pod">🟢 Pod 1</div>
      <div class="arch-pod">🟢 Pod 2</div>
      <div class="arch-pod">🟢 Pod 3</div>
    </div>
  </div>
  <p style="color:var(--muted);font-size:.88rem;">The ReplicaSet continuously reconciles the actual Pod count against the desired count, creating or deleting Pods as needed.</p>

  <!-- MANIFEST -->
  <div class="section-label">
    <div class="section-icon icon-yellow">📝</div>
    <h2>ReplicaSet Manifest</h2>
  </div>
  <div class="code-wrap">
    <div class="code-header">
      <div class="code-dots"><span class="r"></span><span class="y"></span><span class="g"></span></div>
      <span>replicaset.yml</span>
    </div>
    <pre><span class="key">apiVersion</span>: <span class="str">apps/v1</span>
<span class="key">kind</span>: <span class="str">ReplicaSet</span>

<span class="key">metadata</span>:
  <span class="key">name</span>: <span class="str">nginx-rs</span>

<span class="key">spec</span>:
  <span class="key">replicas</span>: <span class="num">3</span>   <span class="cm"># 👈 desired Pod count</span>

  <span class="key">selector</span>:
    <span class="key">matchLabels</span>:
      <span class="key">app</span>: <span class="str">nginx</span>

  <span class="key">template</span>:
    <span class="key">metadata</span>:
      <span class="key">labels</span>:
        <span class="key">app</span>: <span class="str">nginx</span>  <span class="cm"># must match selector ☝️</span>

    <span class="key">spec</span>:
      <span class="key">containers</span>:
        - <span class="key">name</span>: <span class="str">nginx</span>
          <span class="key">image</span>: <span class="str">nginx:latest</span></pre>
  </div>

  <!-- WORKFLOW -->
  <div class="section-label">
    <div class="section-icon icon-blue">🔍</div>
    <h2>Reconciliation Workflow</h2>
  </div>
  <div class="card">
    <div class="flow">
      <div class="flow-step"><div class="flow-dot"></div><div class="flow-text">🚀 ReplicaSet Created</div></div>
      <div class="flow-line"></div>
      <div class="flow-step"><div class="flow-dot"></div><div class="flow-text">🏗️ Creates 3 Pods</div></div>
      <div class="flow-line"></div>
      <div class="flow-step"><div class="flow-dot"></div><div class="flow-text">👁️ Continuously monitors Pod health</div></div>
      <div class="flow-line"></div>
      <div class="flow-step"><div class="flow-dot"></div><div class="flow-text">❓ Pod failure detected?</div></div>
      <div class="flow-line"></div>
      <div class="flow-step"><div class="flow-dot"></div><div class="flow-text">✨ Creates replacement Pod</div></div>
      <div class="flow-line"></div>
      <div class="flow-step"><div class="flow-dot"></div><div class="flow-text">✅ Desired state restored</div></div>
    </div>
  </div>

  <!-- COMMANDS -->
  <div class="section-label">
    <div class="section-icon icon-green">⚡</div>
    <h2>Essential Commands</h2>
  </div>
  <div class="cmd-list">
    <div class="cmd-item">kubectl apply -f replicaset.yml<span class="cmd-label">📦 Create</span></div>
    <div class="cmd-item">kubectl get rs<span class="cmd-label">📋 List ReplicaSets</span></div>
    <div class="cmd-item">kubectl get pods<span class="cmd-label">🔍 View Pods</span></div>
    <div class="cmd-item">kubectl describe rs nginx-rs<span class="cmd-label">🔬 Inspect</span></div>
    <div class="cmd-item">kubectl delete pod &lt;pod-name&gt;<span class="cmd-label">🛡️ Test self-healing</span></div>
    <div class="cmd-item">kubectl scale rs nginx-rs --replicas=5<span class="cmd-label">📈 Scale up</span></div>
    <div class="cmd-item">kubectl scale rs nginx-rs --replicas=2<span class="cmd-label">📉 Scale down</span></div>
  </div>

  <!-- LABELS -->
  <div class="section-label">
    <div class="section-icon icon-purple">🏷️</div>
    <h2>Labels &amp; Selectors</h2>
  </div>
  <div class="card">
    <p>ReplicaSets use label selectors to discover and manage Pods. The selector in the ReplicaSet spec must match the labels on the Pod template.</p>
    <div style="display:flex;gap:14px;flex-wrap:wrap;margin-top:12px;">
      <div style="flex:1;min-width:180px;background:var(--code-bg);border:1px solid rgba(59,130,246,.4);border-radius:8px;padding:16px;">
        <div style="font-size:.72rem;color:#93c5fd;margin-bottom:8px;font-weight:600;text-transform:uppercase;">Selector</div>
        <code style="font-family:'JetBrains Mono',monospace;font-size:.82rem;color:#c4b5fd;">app: nginx</code>
      </div>
      <div style="display:flex;align-items:center;font-size:1.4rem;">🔗</div>
      <div style="flex:1;min-width:180px;background:var(--code-bg);border:1px solid rgba(34,197,94,.4);border-radius:8px;padding:16px;">
        <div style="font-size:.72rem;color:#86efac;margin-bottom:8px;font-weight:600;text-transform:uppercase;">Pod Label</div>
        <code style="font-family:'JetBrains Mono',monospace;font-size:.82rem;color:#86efac;">app: nginx</code>
      </div>
    </div>
    <div class="callout green" style="margin-top:16px;">✅ Match → ReplicaSet manages the Pod &nbsp;|&nbsp; ❌ No match → Pod is ignored</div>
  </div>

  <!-- COMPARISON TABLES -->
  <div class="section-label">
    <div class="section-icon icon-yellow">⚔️</div>
    <h2>ReplicaSet vs Pod</h2>
  </div>
  <div class="card" style="padding:0;overflow:hidden;">
    <table>
      <thead>
        <tr><th>Feature</th><th>🫙 Pod</th><th>🔄 ReplicaSet</th></tr>
      </thead>
      <tbody>
        <tr><td>Runs Containers</td><td class="check">✅</td><td class="check">✅</td></tr>
        <tr><td>Self-Healing</td><td class="cross">❌</td><td class="check">✅</td></tr>
        <tr><td>Maintains Desired Count</td><td class="cross">❌</td><td class="check">✅</td></tr>
        <tr><td>Scaling</td><td class="cross">❌</td><td class="check">✅</td></tr>
        <tr><td>Automatic Recovery</td><td class="cross">❌</td><td class="check">✅</td></tr>
      </tbody>
    </table>
  </div>

  <div class="section-label">
    <div class="section-icon icon-blue">🚀</div>
    <h2>ReplicaSet vs Deployment</h2>
  </div>
  <div class="card" style="padding:0;overflow:hidden;">
    <table>
      <thead>
        <tr><th>Feature</th><th>🔄 ReplicaSet</th><th>🚀 Deployment</th></tr>
      </thead>
      <tbody>
        <tr><td>Pod Management</td><td class="check">✅</td><td class="check">✅</td></tr>
        <tr><td>Self-Healing</td><td class="check">✅</td><td class="check">✅</td></tr>
        <tr><td>Scaling</td><td class="check">✅</td><td class="check">✅</td></tr>
        <tr><td>Rolling Updates</td><td class="cross">❌</td><td class="check">✅</td></tr>
        <tr><td>Rollbacks</td><td class="cross">❌</td><td class="check">✅</td></tr>
        <tr><td>Production Ready</td><td class="warn">⚠️ Limited</td><td class="check">✅ Yes</td></tr>
      </tbody>
    </table>
  </div>

  <!-- RELATIONSHIP -->
  <div class="section-label">
    <div class="section-icon icon-purple">🔗</div>
    <h2>Relationship with Deployments</h2>
  </div>
  <div class="card">
    <p>In production, engineers rarely create ReplicaSets directly. A <strong>Deployment</strong> creates and manages ReplicaSets under the hood, adding rolling updates and rollback capabilities on top.</p>
    <div class="arch" style="margin-top:18px;">
      <div class="arch-rs" style="background:rgba(139,92,246,.2);border-color:rgba(139,92,246,.5);color:#c4b5fd;">🚀 Deployment</div>
      <div class="arch-arrow">⬇️ creates &amp; owns</div>
      <div class="arch-rs">🔄 ReplicaSet</div>
      <div class="arch-arrow">⬇️ manages</div>
      <div class="arch-pods">
        <div class="arch-pod">🟢 Pod 1</div>
        <div class="arch-pod">🟢 Pod 2</div>
        <div class="arch-pod">🟢 Pod 3</div>
      </div>
    </div>
  </div>

  <!-- GOLDEN RULE -->
  <div class="golden">
    <h3>⭐ The Golden Rule</h3>
    <div class="rule-row">
      <div class="rule-chip">🫙 Pod<br/><small style="font-weight:400;color:var(--muted)">runs the app</small></div>
      <div class="rule-arrow">→</div>
      <div class="rule-chip">🔄 ReplicaSet<br/><small style="font-weight:400;color:var(--muted)">keeps it running</small></div>
      <div class="rule-arrow">→</div>
      <div class="rule-chip">🚀 Deployment<br/><small style="font-weight:400;color:var(--muted)">manages the ReplicaSet</small></div>
    </div>
  </div>

</main>

<footer>
  <p>☸️ Kubernetes ReplicaSet Documentation &nbsp;·&nbsp; Built for learning and reference &nbsp;·&nbsp; 2024</p>
</footer>

</body>
</html>