<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Data Warehouse & Analytics Project</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Syne:wght@400;600;700;800&display=swap" rel="stylesheet"/>
<style>
  :root {
    --bg: #0a0c10;
    --surface: #111419;
    --surface2: #181c24;
    --border: #1e2530;
    --accent: #00e5ff;
    --accent2: #7b61ff;
    --accent3: #ff6b35;
    --gold: #ffd166;
    --silver: #94a3b8;
    --bronze: #cd7c3e;
    --text: #e2e8f0;
    --muted: #64748b;
    --mono: 'Space Mono', monospace;
    --sans: 'Syne', sans-serif;
  }

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: var(--sans);
    line-height: 1.7;
    overflow-x: hidden;
  }

  /* ── GRID BACKGROUND ── */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image:
      linear-gradient(rgba(0,229,255,0.03) 1px, transparent 1px),
      linear-gradient(90deg, rgba(0,229,255,0.03) 1px, transparent 1px);
    background-size: 40px 40px;
    pointer-events: none;
    z-index: 0;
  }

  /* ── HERO ── */
  .hero {
    position: relative;
    min-height: 420px;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    padding: 60px 64px 52px;
    overflow: hidden;
    border-bottom: 1px solid var(--border);
  }

  .hero::after {
    content: '';
    position: absolute;
    top: -120px; right: -120px;
    width: 600px; height: 600px;
    background: radial-gradient(ellipse at center, rgba(0,229,255,0.10) 0%, transparent 65%);
    pointer-events: none;
  }

  .hero-tag {
    font-family: var(--mono);
    font-size: 11px;
    letter-spacing: 3px;
    text-transform: uppercase;
    color: var(--accent);
    margin-bottom: 18px;
    opacity: 0;
    animation: fadeUp .6s .1s forwards;
  }

  .hero h1 {
    font-size: clamp(2.4rem, 5vw, 4.2rem);
    font-weight: 800;
    line-height: 1.08;
    letter-spacing: -1.5px;
    opacity: 0;
    animation: fadeUp .6s .2s forwards;
  }

  .hero h1 span { color: var(--accent); }

  .hero-sub {
    margin-top: 20px;
    font-family: var(--mono);
    font-size: 13px;
    color: var(--muted);
    max-width: 560px;
    opacity: 0;
    animation: fadeUp .6s .35s forwards;
  }

  .badges {
    display: flex; flex-wrap: wrap; gap: 10px;
    margin-top: 32px;
    opacity: 0;
    animation: fadeUp .6s .5s forwards;
  }

  .badge {
    font-family: var(--mono);
    font-size: 10px;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    padding: 5px 14px;
    border-radius: 2px;
    border: 1px solid;
  }
  .badge-cyan  { color: var(--accent);  border-color: rgba(0,229,255,.35);  background: rgba(0,229,255,.05); }
  .badge-purple{ color: var(--accent2); border-color: rgba(123,97,255,.35); background: rgba(123,97,255,.05); }
  .badge-orange{ color: var(--accent3); border-color: rgba(255,107,53,.35); background: rgba(255,107,53,.05); }
  .badge-gold  { color: var(--gold);    border-color: rgba(255,209,102,.35);background: rgba(255,209,102,.05); }

  /* ── LAYOUT ── */
  .container { max-width: 1000px; margin: 0 auto; padding: 0 64px; position: relative; z-index: 1; }

  section { padding: 64px 0; border-bottom: 1px solid var(--border); }
  section:last-child { border-bottom: none; }

  .section-label {
    font-family: var(--mono);
    font-size: 10px;
    letter-spacing: 3px;
    text-transform: uppercase;
    color: var(--accent);
    margin-bottom: 28px;
    display: flex;
    align-items: center;
    gap: 12px;
  }
  .section-label::after {
    content: '';
    flex: 1;
    height: 1px;
    background: linear-gradient(90deg, var(--border), transparent);
  }

  h2 {
    font-size: 2rem;
    font-weight: 800;
    letter-spacing: -0.5px;
    margin-bottom: 32px;
    line-height: 1.2;
  }

  p { color: #94a3b8; font-size: 15px; max-width: 680px; }

  /* ── MEDALLION LAYERS ── */
  .layers { display: flex; flex-direction: column; gap: 2px; margin-top: 8px; }

  .layer {
    display: grid;
    grid-template-columns: 180px 1fr;
    align-items: stretch;
    border: 1px solid var(--border);
    background: var(--surface);
    overflow: hidden;
    transition: transform .2s, border-color .2s;
  }
  .layer:hover { transform: translateX(6px); border-color: var(--border); }

  .layer-label {
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 24px 28px;
    position: relative;
  }
  .layer-label::after {
    content: '';
    position: absolute;
    right: 0; top: 16px; bottom: 16px;
    width: 1px;
    background: var(--border);
  }

  .layer-icon {
    font-size: 22px;
    margin-bottom: 6px;
  }

  .layer-name {
    font-family: var(--mono);
    font-size: 11px;
    letter-spacing: 2px;
    text-transform: uppercase;
    font-weight: 700;
  }

  .layer-badge {
    display: inline-block;
    margin-top: 6px;
    font-family: var(--mono);
    font-size: 9px;
    letter-spacing: 1px;
    text-transform: uppercase;
    padding: 2px 8px;
    border-radius: 1px;
    border: 1px solid;
    width: fit-content;
  }

  .layer-bronze .layer-name { color: var(--bronze); }
  .layer-bronze .layer-badge { color: var(--bronze); border-color: rgba(205,124,62,.4); background: rgba(205,124,62,.08); }
  .layer-bronze:hover { border-color: rgba(205,124,62,.4); }

  .layer-silver .layer-name { color: var(--silver); }
  .layer-silver .layer-badge { color: var(--silver); border-color: rgba(148,163,184,.4); background: rgba(148,163,184,.08); }
  .layer-silver:hover { border-color: rgba(148,163,184,.4); }

  .layer-gold .layer-name { color: var(--gold); }
  .layer-gold .layer-badge { color: var(--gold); border-color: rgba(255,209,102,.4); background: rgba(255,209,102,.08); }
  .layer-gold:hover { border-color: rgba(255,209,102,.4); }

  .layer-body {
    padding: 24px 28px;
  }

  .layer-body p {
    color: var(--silver);
    font-size: 14px;
    max-width: none;
  }

  /* ── OVERVIEW CARDS ── */
  .cards { display: grid; grid-template-columns: repeat(2, 1fr); gap: 2px; margin-top: 8px; }

  .card {
    background: var(--surface);
    border: 1px solid var(--border);
    padding: 28px 28px 24px;
    transition: border-color .2s, background .2s;
    position: relative;
    overflow: hidden;
  }
  .card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 2px;
    opacity: 0;
    transition: opacity .2s;
  }
  .card:hover { background: var(--surface2); }
  .card:hover::before { opacity: 1; }

  .card.c1::before { background: var(--accent); }
  .card.c2::before { background: var(--accent2); }
  .card.c3::before { background: var(--accent3); }
  .card.c4::before { background: var(--gold); }

  .card-num {
    font-family: var(--mono);
    font-size: 11px;
    color: var(--muted);
    margin-bottom: 14px;
    letter-spacing: 1px;
  }

  .card h3 {
    font-size: 15px;
    font-weight: 700;
    margin-bottom: 10px;
    letter-spacing: -0.2px;
  }

  .card p { font-size: 13px; color: var(--muted); max-width: none; }

  /* ── SKILLS GRID ── */
  .skills { display: grid; grid-template-columns: repeat(3, 1fr); gap: 2px; margin-top: 8px; }

  .skill-item {
    background: var(--surface);
    border: 1px solid var(--border);
    padding: 20px 22px;
    display: flex;
    align-items: center;
    gap: 14px;
    cursor: default;
    transition: background .15s, border-color .15s;
  }
  .skill-item:hover {
    background: var(--surface2);
    border-color: rgba(0,229,255,.2);
  }

  .skill-dot {
    width: 6px; height: 6px;
    border-radius: 50%;
    background: var(--accent);
    flex-shrink: 0;
    box-shadow: 0 0 8px var(--accent);
  }

  .skill-item span {
    font-family: var(--mono);
    font-size: 11px;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--text);
  }

  /* ── PIPELINE DIAGRAM ── */
  .pipeline {
    display: flex;
    align-items: center;
    gap: 0;
    margin-top: 36px;
    overflow-x: auto;
    padding-bottom: 8px;
  }

  .pipe-node {
    background: var(--surface);
    border: 1px solid var(--border);
    padding: 18px 22px;
    text-align: center;
    min-width: 130px;
    flex-shrink: 0;
  }

  .pipe-node .pipe-icon { font-size: 20px; margin-bottom: 8px; }
  .pipe-node .pipe-title {
    font-family: var(--mono);
    font-size: 10px;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: var(--accent);
  }
  .pipe-node .pipe-sub {
    font-size: 11px;
    color: var(--muted);
    margin-top: 4px;
  }

  .pipe-arrow {
    color: var(--muted);
    font-size: 18px;
    padding: 0 6px;
    flex-shrink: 0;
  }

  /* ── REQUIREMENTS ── */
  .req-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 2px; margin-top: 36px; }

  .req-item {
    background: var(--surface);
    border: 1px solid var(--border);
    padding: 22px 24px;
    display: flex;
    gap: 16px;
    align-items: flex-start;
    transition: background .15s, border-color .15s;
  }
  .req-item:hover { background: var(--surface2); border-color: rgba(0,229,255,.18); }

  .req-icon {
    font-size: 18px;
    flex-shrink: 0;
    margin-top: 2px;
  }

  .req-item h4 {
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 5px;
    letter-spacing: -0.1px;
  }

  .req-item p { font-size: 12px; color: var(--muted); max-width: none; }

  /* ── BI INSIGHTS ── */
  .bi-row {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 2px;
    margin-top: 36px;
  }

  .bi-card {
    background: var(--surface);
    border: 1px solid var(--border);
    padding: 26px 24px;
    position: relative;
    overflow: hidden;
    transition: background .15s;
  }
  .bi-card:hover { background: var(--surface2); }

  .bi-card::before {
    content: '';
    position: absolute;
    bottom: 0; left: 0; right: 0;
    height: 2px;
  }
  .bi-card.b1::before { background: var(--accent); }
  .bi-card.b2::before { background: var(--accent2); }
  .bi-card.b3::before { background: var(--accent3); }

  .bi-icon { font-size: 26px; margin-bottom: 14px; }
  .bi-card h3 { font-size: 15px; font-weight: 700; margin-bottom: 8px; }
  .bi-card p { font-size: 12px; color: var(--muted); max-width: none; }

  /* ── REPO STRUCTURE ── */
  .repo-tree {
    background: var(--surface);
    border: 1px solid var(--border);
    padding: 32px 36px;
    margin-top: 36px;
    font-family: var(--mono);
    font-size: 12.5px;
    line-height: 2;
    overflow-x: auto;
  }

  .tree-root { color: var(--accent); font-weight: 700; }
  .tree-dir  { color: var(--gold); }
  .tree-file { color: var(--text); }
  .tree-comment { color: var(--muted); }
  .tree-indent { color: var(--border); }

  .tree-row {
    display: flex;
    gap: 10px;
    align-items: baseline;
    padding: 1px 0;
  }
  .tree-row:hover { background: rgba(255,255,255,.02); }

  .tree-path { white-space: nowrap; }
  .tree-desc {
    color: var(--muted);
    font-size: 11px;
    white-space: nowrap;
  }

  /* ── FOOTER ── */
  .footer {
    padding: 40px 0 48px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 16px;
  }

  .footer-left {
    font-family: var(--mono);
    font-size: 11px;
    color: var(--muted);
    letter-spacing: 1px;
  }

  .footer-right {
    font-family: var(--mono);
    font-size: 10px;
    color: var(--muted);
    letter-spacing: 2px;
    text-transform: uppercase;
  }

  /* ── ANIMATIONS ── */
  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(18px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  .reveal { opacity: 0; animation: fadeUp .5s forwards; }

  @media (max-width: 700px) {
    .hero, .container { padding-left: 24px; padding-right: 24px; }
    .cards { grid-template-columns: 1fr; }
    .skills { grid-template-columns: repeat(2, 1fr); }
    .layer { grid-template-columns: 1fr; }
    .layer-label::after { display: none; }
  }
</style>
</head>
<body>

<!-- HERO -->
<div class="hero">
  <div class="hero-tag">Portfolio Project · Data Engineering</div>
  <h1>Data Warehouse &amp;<br><span>Analytics</span> Project</h1>
  <p class="hero-sub">
    A comprehensive data warehousing solution — from raw ingestion through transformation to business-ready insights, built on medallion architecture.
  </p>
  <div class="badges">
    <span class="badge badge-cyan">SQL Development</span>
    <span class="badge badge-purple">Data Modeling</span>
    <span class="badge badge-orange">ETL Pipelines</span>
    <span class="badge badge-gold">Analytics & Reporting</span>
    <span class="badge badge-cyan">Data Architecture</span>
  </div>
</div>

<div class="container">

  <!-- ARCHITECTURE -->
  <section>
    <div class="section-label">01 — Architecture</div>
    <h2>Medallion Data Architecture</h2>
    <p>The project follows a three-layer Medallion Architecture, progressing data from raw ingestion through cleansing to business-ready analytical models.</p>

    <div class="layers" style="margin-top: 36px;">

      <div class="layer layer-bronze reveal" style="animation-delay:.1s">
        <div class="layer-label">
          <div class="layer-icon">🥉</div>
          <div class="layer-name">Bronze</div>
          <span class="layer-badge">Raw Layer</span>
        </div>
        <div class="layer-body">
          <p>Stores raw data exactly as received from source systems. Data is ingested directly from CSV files into the SQL Server database with no transformations applied — preserving full fidelity of the original records.</p>
        </div>
      </div>

      <div class="layer layer-silver reveal" style="animation-delay:.2s">
        <div class="layer-label">
          <div class="layer-icon">🥈</div>
          <div class="layer-name">Silver</div>
          <span class="layer-badge">Clean Layer</span>
        </div>
        <div class="layer-body">
          <p>Applies data cleansing, standardization, and normalization processes. This layer resolves inconsistencies, enforces data types, and prepares structured, reliable data for downstream analytical use.</p>
        </div>
      </div>

      <div class="layer layer-gold reveal" style="animation-delay:.3s">
        <div class="layer-label">
          <div class="layer-icon">🥇</div>
          <div class="layer-name">Gold</div>
          <span class="layer-badge">Business Layer</span>
        </div>
        <div class="layer-body">
          <p>Houses business-ready data modeled into a star schema. Optimized for reporting and analytics workloads, this layer powers dashboards and supports fast, reliable analytical queries.</p>
        </div>
      </div>

    </div>
  </section>

  <!-- PIPELINE -->
  <section>
    <div class="section-label">02 — Pipeline</div>
    <h2>ETL Data Flow</h2>
    <p>Data moves through an automated pipeline — extracted from source files, transformed across medallion layers, and loaded into the analytical model.</p>

    <div class="pipeline">
      <div class="pipe-node">
        <div class="pipe-icon">📂</div>
        <div class="pipe-title">Source</div>
        <div class="pipe-sub">CSV Files</div>
      </div>
      <div class="pipe-arrow">→</div>
      <div class="pipe-node">
        <div class="pipe-icon">⬇️</div>
        <div class="pipe-title">Ingest</div>
        <div class="pipe-sub">Bronze Layer</div>
      </div>
      <div class="pipe-arrow">→</div>
      <div class="pipe-node">
        <div class="pipe-icon">🔧</div>
        <div class="pipe-title">Transform</div>
        <div class="pipe-sub">Silver Layer</div>
      </div>
      <div class="pipe-arrow">→</div>
      <div class="pipe-node">
        <div class="pipe-icon">⭐</div>
        <div class="pipe-title">Model</div>
        <div class="pipe-sub">Gold / Star Schema</div>
      </div>
      <div class="pipe-arrow">→</div>
      <div class="pipe-node">
        <div class="pipe-icon">📊</div>
        <div class="pipe-title">Report</div>
        <div class="pipe-sub">Dashboards</div>
      </div>
    </div>
  </section>

  <!-- PROJECT OVERVIEW -->
  <section>
    <div class="section-label">03 — Overview</div>
    <h2>What This Project Covers</h2>
    <p>An end-to-end data engineering pipeline demonstrating four core competencies of modern data warehouse development.</p>

    <div class="cards" style="margin-top: 36px;">
      <div class="card c1 reveal" style="animation-delay:.1s">
        <div class="card-num">01</div>
        <h3>Data Architecture</h3>
        <p>Designing a modern data warehouse using the Medallion Architecture pattern across Bronze, Silver, and Gold layers.</p>
      </div>
      <div class="card c2 reveal" style="animation-delay:.2s">
        <div class="card-num">02</div>
        <h3>ETL Pipelines</h3>
        <p>Extracting, transforming, and loading data from source systems into the warehouse through structured pipeline stages.</p>
      </div>
      <div class="card c3 reveal" style="animation-delay:.3s">
        <div class="card-num">03</div>
        <h3>Data Modeling</h3>
        <p>Developing fact and dimension tables using a star schema, optimized for high-performance analytical queries.</p>
      </div>
      <div class="card c4 reveal" style="animation-delay:.4s">
        <div class="card-num">04</div>
        <h3>Analytics & Reporting</h3>
        <p>Creating SQL-based reports and dashboards that surface actionable business insights from the modeled data.</p>
      </div>
    </div>
  </section>

  <!-- REQUIREMENTS: DATA ENGINEERING -->
  <section>
    <div class="section-label">04 — Requirements</div>
    <h2>Building the Data Warehouse</h2>
    <p>Develop a modern data warehouse using SQL Server to consolidate sales data from ERP and CRM systems, enabling analytical reporting and informed decision-making.</p>

    <div class="req-grid" style="margin-top:36px;">
      <div class="req-item reveal" style="animation-delay:.05s">
        <div class="req-icon">🗄️</div>
        <div>
          <h4>Data Sources</h4>
          <p>Import data from two source systems — ERP and CRM — both provided as CSV files for ingestion into the warehouse.</p>
        </div>
      </div>
      <div class="req-item reveal" style="animation-delay:.1s">
        <div class="req-icon">🧹</div>
        <div>
          <h4>Data Quality</h4>
          <p>Cleanse and resolve data quality issues prior to analysis, ensuring reliable and consistent records throughout the pipeline.</p>
        </div>
      </div>
      <div class="req-item reveal" style="animation-delay:.15s">
        <div class="req-icon">🔗</div>
        <div>
          <h4>Integration</h4>
          <p>Combine both sources into a single, user-friendly data model designed for analytical queries and cross-system reporting.</p>
        </div>
      </div>
      <div class="req-item reveal" style="animation-delay:.2s">
        <div class="req-icon">🎯</div>
        <div>
          <h4>Scope</h4>
          <p>Focus on the latest dataset only. Historization of data is not required for this implementation.</p>
        </div>
      </div>
      <div class="req-item reveal" style="animation-delay:.25s" style="grid-column: 1 / -1;">
        <div class="req-icon">📄</div>
        <div>
          <h4>Documentation</h4>
          <p>Provide clear documentation of the data model to support both business stakeholders and analytics teams.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- BI ANALYTICS -->
  <section>
    <div class="section-label">05 — Analytics & Reporting</div>
    <h2>BI Insights & Reporting</h2>
    <p>Develop SQL-based analytics to deliver detailed insights that empower stakeholders with key business metrics, enabling strategic decision-making.</p>

    <div class="bi-row">
      <div class="bi-card b1 reveal" style="animation-delay:.1s">
        <div class="bi-icon">👥</div>
        <h3>Customer Behavior</h3>
        <p>Analyse purchasing patterns, customer segmentation, retention metrics, and lifetime value across the customer base.</p>
      </div>
      <div class="bi-card b2 reveal" style="animation-delay:.2s">
        <div class="bi-icon">📦</div>
        <h3>Product Performance</h3>
        <p>Track revenue contribution, top-selling SKUs, category performance, and product-level profitability over time.</p>
      </div>
      <div class="bi-card b3 reveal" style="animation-delay:.3s">
        <div class="bi-icon">📈</div>
        <h3>Sales Trends</h3>
        <p>Surface period-over-period growth, seasonal patterns, regional performance, and pipeline velocity metrics.</p>
      </div>
    </div>
  </section>

  <!-- REPO STRUCTURE -->
  <section>
    <div class="section-label">06 — Repository</div>
    <h2>Repository Structure</h2>
    <p>Organized into clearly separated concerns — datasets, documentation, SQL scripts, and tests — for easy navigation and collaboration.</p>

    <div class="repo-tree reveal" style="animation-delay:.1s">
      <div class="tree-row"><span class="tree-root">data-warehouse-project/</span></div>
      <div class="tree-row"><span class="tree-indent">│</span></div>

      <div class="tree-row"><span class="tree-indent">├──</span><span class="tree-dir">datasets/</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Raw datasets — ERP and CRM source files</span></div>
      <div class="tree-row"><span class="tree-indent">│</span></div>

      <div class="tree-row"><span class="tree-indent">├──</span><span class="tree-dir">docs/</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Project documentation and architecture details</span></div>
      <div class="tree-row"><span class="tree-indent">│&nbsp;&nbsp;&nbsp;├──</span><span class="tree-file">etl.drawio</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# ETL techniques and methods diagram</span></div>
      <div class="tree-row"><span class="tree-indent">│&nbsp;&nbsp;&nbsp;├──</span><span class="tree-file">data_architecture.drawio</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Full project architecture diagram</span></div>
      <div class="tree-row"><span class="tree-indent">│&nbsp;&nbsp;&nbsp;├──</span><span class="tree-file">data_catalog.md</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Dataset catalog with field descriptions & metadata</span></div>
      <div class="tree-row"><span class="tree-indent">│&nbsp;&nbsp;&nbsp;├──</span><span class="tree-file">data_flow.drawio</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Data flow diagram</span></div>
      <div class="tree-row"><span class="tree-indent">│&nbsp;&nbsp;&nbsp;├──</span><span class="tree-file">data_models.drawio</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Star schema data models</span></div>
      <div class="tree-row"><span class="tree-indent">│&nbsp;&nbsp;&nbsp;└──</span><span class="tree-file">naming-conventions.md</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Naming guidelines for tables, columns & files</span></div>
      <div class="tree-row"><span class="tree-indent">│</span></div>

      <div class="tree-row"><span class="tree-indent">├──</span><span class="tree-dir">scripts/</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# SQL scripts for ETL and transformations</span></div>
      <div class="tree-row"><span class="tree-indent">│&nbsp;&nbsp;&nbsp;├──</span><span class="tree-dir">bronze/</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Extract and load raw data</span></div>
      <div class="tree-row"><span class="tree-indent">│&nbsp;&nbsp;&nbsp;├──</span><span class="tree-dir">silver/</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Cleansing and transformation scripts</span></div>
      <div class="tree-row"><span class="tree-indent">│&nbsp;&nbsp;&nbsp;└──</span><span class="tree-dir">gold/</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Analytical model creation scripts</span></div>
      <div class="tree-row"><span class="tree-indent">│</span></div>

      <div class="tree-row"><span class="tree-indent">├──</span><span class="tree-dir">tests/</span><span class="tree-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Test scripts and data quality checks</span></div>
      <div class="tree-row"><span class="tree-indent">│</span></div>
      <div class="tree-row"><span class="tree-indent">└──</span><span class="tree-file">README.md</span></div>
    </div>
  </section>

  <!-- SKILLS -->
  <section>
    <div class="section-label">07 — Skills Demonstrated</div>
    <h2>Technical Competencies</h2>
    <p>This repository is a showcase for professionals and students demonstrating expertise across the full data engineering stack.</p>

    <div class="skills" style="margin-top: 36px;">
      <div class="skill-item reveal" style="animation-delay:.05s">
        <div class="skill-dot"></div>
        <span>SQL Development</span>
      </div>
      <div class="skill-item reveal" style="animation-delay:.1s">
        <div class="skill-dot" style="background:var(--accent2);box-shadow:0 0 8px var(--accent2)"></div>
        <span>Data Architecture</span>
      </div>
      <div class="skill-item reveal" style="animation-delay:.15s">
        <div class="skill-dot" style="background:var(--accent3);box-shadow:0 0 8px var(--accent3)"></div>
        <span>Data Engineering</span>
      </div>
      <div class="skill-item reveal" style="animation-delay:.2s">
        <div class="skill-dot" style="background:var(--gold);box-shadow:0 0 8px var(--gold)"></div>
        <span>ETL Pipeline Dev</span>
      </div>
      <div class="skill-item reveal" style="animation-delay:.25s">
        <div class="skill-dot"></div>
        <span>Data Modeling</span>
      </div>
      <div class="skill-item reveal" style="animation-delay:.3s">
        <div class="skill-dot" style="background:var(--accent2);box-shadow:0 0 8px var(--accent2)"></div>
        <span>Data Analytics</span>
      </div>
    </div>
  </section>

  <!-- FOOTER -->
  <div class="footer">
    <div class="footer-left">Data Warehouse &amp; Analytics Project · Portfolio Edition</div>
    <div class="footer-right">Built with SQL &amp; Medallion Architecture</div>
  </div>

</div>

<script>
  // Intersection observer for scroll reveals
  const els = document.querySelectorAll('.reveal');
  const obs = new IntersectionObserver((entries) => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.style.animationPlayState = 'running';
        obs.unobserve(e.target);
      }
    });
  }, { threshold: 0.1 });

  els.forEach(el => {
    el.style.animationPlayState = 'paused';
    obs.observe(el);
  });
</script>
</body>
</html>
