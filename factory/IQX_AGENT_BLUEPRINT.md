# IQX Agent Blueprint
# Version 1.2
# Master Specification for IQX Offering Definition

---

## 1. Purpose

This document is the canonical, industry-agnostic blueprint for defining any IQX offering instance. It specifies every agent, their file structures, sequencing, gates, governance, and the complete directory template.

The IQX Factory agent reads this document, accepts an industry input, and produces a fully scaffolded project directory with every agent's files populated with industry-specific context.

---

## 2. What an IQX Instance Is

An IQX offering is a semi-productized "customer intelligence and activation platform" tailored to a specific industry or slice of an industry. The strategy, use cases, KPIs, data model, and activation workflows are conceptually designed at the offering level, but each client engagement requires tailoring to that client's specific systems, data environment, and ways of working. IQX is not a SaaS product; it is a repeatable consulting offering with a defined starting point that accelerates delivery.

### 2.1 Core Premise

The primary business entity in a given industry has customer data scattered across many disconnected systems. This fragmentation prevents the business from seeing the complete picture of its customers efficiently, causing it to miss timely or critical opportunities to convert prospects, serve and delight existing customers, foster loyalty, or retain customers at risk of leaving.

### 2.2 Three Layers

**Unified data layer (Customer 360).** Customer data from multiple source systems is unified to create full-view customer profiles.

**Intelligence layer.** Synthesis of whole customer profiles to uncover net-new insights or better-quality insights previously too difficult or time-consuming to perform at scale. Examples: new segmentations, cross-sell opportunities, churn predictions, health scores, upward or declining trends, or whatever insights and KPIs are important to managing the business.

**Activation layer.** New or better insights are provided to IQX end users with the means to take action, often powered by AI or agentic tools. For each activation use case, the following must be defined: who acts, what trigger causes action, what recommendation appears, what system or action channel is used, what the user can approve/edit/reject, what gets logged, how success is measured, what feedback improves the intelligence, and what compliance guardrails apply.

### 2.3 Technology Stack

Snowflake's cloud data platform and Cortex agentic/AI features for the back-end data layer. Sigma's cloud-native dashboard, data visualization, and application development tools for the front-end user-facing layer.

**Note on Sigma workbook-as-code:** As of this blueprint version, Sigma's workbook-as-code feature is in beta. Several element types are not yet supported via workbook-as-code (including buttons, input tables, action sequences, modals, tabs, and forms). Agents must not present unsupported workbook-as-code features as canonical generated workbook behavior. See `shared/sigma-workbook-as-code-rules.md` for the current supported element list and feasibility classification guidance. Recheck official Sigma documentation before any implementation-ready API payload work.

### 2.4 Product Doctrine: Sigma-First, Snowflake-Backed

The canonical IQX application layer is Sigma.

Snowflake is the canonical layer for data, metrics, intelligence, semantic definitions, activation state, audit logging, and AI-enabled data workflows.

React is optional and non-canonical. It may be used only as a visualization sketchpad, not as the source of truth for the product experience.

Every prototype workflow must first be expressed using Sigma-native or Sigma-approximate primitives. Any React-only idea must be explicitly labeled aspirational and excluded from the canonical Sigma prototype unless there is a documented Sigma approximation.

The prototype is a sales conversation instrument, but it must be technically honest: the interface, data model, metrics, activation flows, and AI moments must be reproducible in Snowflake and Sigma.

This doctrine is referenced by the project-level shared context (CLAUDE.md) and governs all agents involved in use case design, data modeling, prototype specification, synthetic data generation, launch readiness, and offering updates.

### 2.5 What an "Instance" Is

An instance (e.g., BankIQX, FanIQX, StudentIQX) is the complete definition of what an IQX offering looks like when applied to a specific industry. An instance is not a built product. It is the research, specification, GTM materials, and prototype needed to market and sell it to prospects in that industry.

---

## 3. System Design

### 3.1 Two Components

**This Blueprint.** The canonical, industry-agnostic specification of every agent needed to define any IQX offering instance. Designed once.

**The IQX Factory agent.** A single Claude Code agent that reads this Blueprint, takes an industry name (plus optional industry context notes) as input, and instantiates a fully scaffolded project directory with all agent files populated with industry-specific context. The Factory does not redesign the agent army per industry. It populates a fixed template.

### 3.2 Factory Inputs

**Required:** Industry name (e.g., "commercial banking," "sports and entertainment," "higher education").

**Optional but recommended:** An industry context note of 3-5 sentences flagging known structural oddities. Example: "Auto dealership groups have multiple constituent types per LOB and a group-level aggregation layer above the individual dealership."

**Optional:** Known Verndale relationships in the industry, known Snowflake/Sigma relevance, initial hypothesis, explicit constraints.

### 3.3 Factory Context Labeling

When populating industry-specific context into agent files, the Factory must label every claim with one of the **canonical inline context labels** below. Agents must **not invent new inline labels** (no `LOCAL-CHECK`, `RISK`, `CONSTRAINT`, `GATING CONSTRAINT`, `STRATEGY FIT`, etc.). Use structured sections (Risk Register tables, Caveats, Open Questions) for severity and blocking semantics instead of extra tags.

**Canonical inline labels (closed set):**

| Label | Meaning |
|-------|---------|
| `USER-PROVIDED` | Supplied in factory intake or user context; directional, not verified. |
| `HYPOTHESIS` | Assumed from reasoning or training knowledge; requires validation; non-blocking refinement uncertainty. |
| `VERIFY` | External or factual claim requiring research; must have an `EVIDENCE-LEDGER.md` row before downstream agents treat it as fact. |
| `GATING VERIFY` | Uncertainty that materially weakens or blocks proceed/kill judgment until resolved (Gate 1 or informal Agent 3 gate). |
| `GATING HYPOTHESIS` | Strategic assumption that must be validated before Gate 1 but is not yet kill-blocking. |

**Not inline tags:**

- **`CONFIRMED`** — evidence-ledger **row status only**; only Agent 27 (`research-verifier`) may assign it after sourcing.
- **Standing constraints** — persistent rules (e.g., "ICP is not settled") live in the offering's `AGENTS.md` and `OFFERING-DECISIONS.md` as prose; do not re-tag them inline on every mention.

Cursor execution details: `factory/BLUEPRINT-ADDENDUM.md` §11.

### 3.4 Factory Outputs

- A complete project directory structure (see Section 8).
- All agent files populated per agent (see Section 7).
- A CLAUDE.md project-level shared context file (must include the Section 2.4 product doctrine and references to all shared/ files).
- A populated `shared/` directory. The Factory must copy all 10 master knowledge pack files from the master templates location into `<Industry>IQX/shared/`. It must not scaffold empty placeholders. See Section 3.5 for the master templates location and file list.
- Initialized UPDATES-INBOX.md, UPDATES-LOG.md, OFFERING-DECISIONS.md, EVIDENCE-LEDGER.md, and SALES-LEARNINGS.md.
- Initialized git repo with an initial commit of the entire scaffold, establishing a clean baseline before any agent has run. From this point forward, git serves the governance loop: every approved artifact change is committed with a message referencing the relevant UPDATES-LOG entry or gate decision. Claude Code handles all git commands; the user does not need to interact with git directly.
- An optional gap check report flagging agents that may be low-value or gaps not covered for this specific industry.
- References to the relevant `shared/` files injected into INPUTS.md for Agents 12, 13, 15, 21, 22, 23, and 26 per Section 3.6.

### 3.5 Shared Knowledge Pack: Master Templates

The 10 master knowledge pack files are maintained at this location on the local machine:

```
C:\Users\jared.amaral\OneDrive - Verndale\IQX\shared-templates\
```

These files are industry-agnostic. They are not outputs of any single IQX instance. They are master templates that the Factory copies into every generated instance.

The Factory must copy all 10 files from this location into `<Industry>IQX\shared\` during scaffolding:

```
shared-templates\                              ->   <Industry>IQX\shared\
  product-doctrine.md
  sigma-first-design-rules.md
  sigma-capability-matrix.yaml
  sigma-workbook-as-code-rules.md
  snowflake-platform-rules.md
  snowflake-data-modeling-patterns.md
  activation-data-patterns.md
  react-sketchpad-constraints.md
  quality-gates.md
  docs-ledger.md
```

The generated `<Industry>IQX\` project directories should also be created inside the `IQX\` root:

```
C:\Users\jared.amaral\OneDrive - Verndale\IQX\<Industry>IQX\
```

**Important:** The IQX Factory agent lives at `C:\Users\jared.amaral\.claude\agents\iqx-factory.md`, outside the `IQX\` root. All file paths in the Factory agent's instructions must use the full absolute paths above. Do not use relative paths in the Factory agent.

**OneDrive note:** Ensure the `IQX\` folder and `shared-templates\` are set to "Always keep on this device" in OneDrive settings so files are physically present when the Factory reads them.

### 3.6 Shared Knowledge Pack: Agent Input Wiring

The Factory must inject references to the following `shared/` files into each agent's `INPUTS.md` during scaffolding.

**Agent 12: use-case-architect**
```
shared/product-doctrine.md
shared/sigma-capability-matrix.yaml
shared/sigma-first-design-rules.md
shared/snowflake-platform-rules.md
shared/activation-data-patterns.md
shared/quality-gates.md
```

**Agent 13: customer-360-data-modeler**
```
shared/product-doctrine.md
shared/snowflake-platform-rules.md
shared/snowflake-data-modeling-patterns.md
shared/activation-data-patterns.md
shared/quality-gates.md
```

**Agent 15: delivery-architecture-and-implementation-planner**
```
shared/product-doctrine.md
shared/snowflake-platform-rules.md
shared/snowflake-data-modeling-patterns.md
shared/activation-data-patterns.md
```

**Agent 21: prototype-experience-spec-builder**
```
shared/product-doctrine.md
shared/sigma-workbook-as-code-rules.md
shared/sigma-capability-matrix.yaml
shared/sigma-first-design-rules.md
shared/snowflake-platform-rules.md
shared/activation-data-patterns.md
shared/react-sketchpad-constraints.md
shared/quality-gates.md
```

**Agent 22: synthetic-data-generator**
```
shared/product-doctrine.md
shared/snowflake-platform-rules.md
shared/snowflake-data-modeling-patterns.md
shared/activation-data-patterns.md
shared/quality-gates.md
```

**Agent 23: launch-readiness-assessor**
```
shared/product-doctrine.md
shared/sigma-workbook-as-code-rules.md
shared/sigma-capability-matrix.yaml
shared/sigma-first-design-rules.md
shared/snowflake-platform-rules.md
shared/snowflake-data-modeling-patterns.md
shared/activation-data-patterns.md
shared/react-sketchpad-constraints.md
shared/quality-gates.md
```

**Agent 26: offering-updater**
```
shared/product-doctrine.md
shared/sigma-capability-matrix.yaml
shared/quality-gates.md
```

---

## 4. Agent Army

### 4.1 Overview

The army consists of agents organized across five stages, plus a supporting agent group. Each stage ends with a human-controlled gate.

**Stage 1: Commercial Scan** (8 agents). Fast research, strategic fitness check, and commercial validation. Gate: proceed, revise, or kill.

**Stage 2: Offering Spine** (7 agents). Differentiation, market sizing, ICP, use case architecture, data model, value case, and delivery model. Gate: approve offering brief.

**Stage 3: GTM and Sales Enablement** (5 agents). Competitive positioning, packaging, pricing, objections, red team critique, and GTM collateral. Gate: approve sales readiness.

**Stage 4: Prototype** (3 agents). Prototype specification, synthetic data generation, and launch readiness assessment. Informed by the sales narrative and commercial framing from Stage 3. Gate: launch readiness review.

**Stage 5: Learning Loop** (4 agents). Ongoing intake, updates, verification, and sales learning synthesis. Gate: approve changes into canonical offering.

**Total: 27 agents.**

---

### 4.2 Stage 1: Commercial Scan

Purpose: Rapidly assess whether a painful, budget-backed, executive-relevant wedge exists in this industry, and whether Verndale is strategically fit to pursue it, before committing to full offering definition.

#### Agent 1: industry-landscape-analyst

**Purpose.** Maps the industry structure, actors, interactions, dynamics, forces, and trends. Classifies which actor categories would benefit from an IQX offering and why.

**Model.** Opus 4.

**Web research required.** Yes.

**Inputs.** Industry name, Factory-provided context.

**Outputs.** Structured industry brief including actor classification with IQX-fit rationale.

**Sequencing.** Runs first. No dependencies.

---

#### Agent 2: business-deep-dive-analyst

**Purpose.** For the target actor category, documents lines of business, go-to-market motions, constituent types per LOB, operating departments, teams, business metrics/KPIs used to measure performance, and key business workflows.

**Model.** Opus 4.

**Web research required.** Optional; recommended for niche industries where training knowledge may be thin.

**Inputs.** Industry brief (Agent 1 output).

**Outputs.** Comprehensive business profile.

**Sequencing.** Runs after Agent 1.

---

#### Agent 3: strategic-fitness-assessor

**Purpose.** Overlays Verndale's firm strategy and Data & Analytics practice strategy onto the industry and business research. Assesses whether Verndale's D&A practice is strategically fit to pursue an IQX offering in this industry. This is a go/no-go checkpoint before investing in detailed research.

**Model.** Sonnet 4.

**Web research required.** No.

**Inputs.** Industry brief (Agent 1), business profile (Agent 2), Verndale firm strategy and D&A practice strategy (provided in CLAUDE.md).

**Outputs.** Strategic fitness assessment: one of the **closed-set recommendations** (see `factory/BLUEPRINT-ADDENDUM.md` §12), rationale, caveats documented in structured sections (not ad hoc inline tags), strategic risks in a Risk Register table, and capability gaps that would need to be addressed.

**Sequencing.** Runs after Agent 2. If the assessment is **No-Go**, the user may kill the instance before proceeding further. **Revise Before Go** blocks Agent 4 until the user logs an override or resolves gating items in `OFFERING-DECISIONS.md`. **Go** and **Conditional Go** allow Agent 4 to proceed (Conditional Go carries GATING VERIFY items forward to Gate 1). This is an informal gate; the formal gate remains at the end of Stage 1.

---

#### Agent 4: constituent-journey-mapper

**Purpose.** Maps the constituent lifecycle and journey for each LOB and constituent type, from acquisition through retention or churn.

**Model.** Sonnet 4.

**Web research required.** No.

**Inputs.** Business profile (Agent 2).

**Outputs.** Journey maps per LOB and constituent type.

**Sequencing.** Runs after Agent 3 (proceeds only if Agent 3 recommendation is **Go** or **Conditional Go**, or the user has logged an explicit override for **Revise Before Go** in `OFFERING-DECISIONS.md`).

---

#### Agent 5: persona-and-pain-analyst

**Purpose.** Identifies the personas (the actual people doing the work at the target business), their roles, and their jobs to be done. Then identifies the pain points and challenges those personas experience as a result of disconnected customer data, and articulates the business impact of each pain point. This is research into the current state, not offering design.

**Model.** Sonnet 4.

**Web research required.** No.

**Inputs.** Business profile (Agent 2), journey maps (Agent 4).

**Outputs.** Persona inventory (role, department, responsibilities, daily workflow, tools used). Per persona: jobs to be done, pain points caused by data fragmentation, business impact of each pain point, and which journey stages are affected.

**Sequencing.** Runs after Agent 4.

---

#### Agent 6: systems-and-data-analyst

**Purpose.** Inventories the information systems in use across the business, the data each system holds, and the fragmentation problem those systems create collectively.

**Model.** Sonnet 4.

**Web research required.** Optional spot-check.

**Inputs.** Business profile (Agent 2), journey maps (Agent 4), persona and pain inventory (Agent 5).

**Outputs.** Systems and data inventory, fragmentation narrative.

**Sequencing.** Runs after Agent 5. Can run in parallel with Agent 5 if needed, but benefits from pain point context.

---

#### Agent 7: industry-evidence-researcher

**Purpose.** Finds statistics, studies, and third-party data substantiating the fragmentation problem, the cost of poor customer data, and the value of unified customer intelligence in this industry. Also finds case studies, vendor ROI claims, and competitive proof points for commercial use.

**Model.** Opus 4.

**Web research required.** Yes.

**Inputs.** All prior Stage 1 outputs (Agents 1-6).

**Outputs.** Two outputs: (1) inline evidence annotations for Stage 1 documents, written to the Evidence Ledger; (2) a standalone proof point library for downstream agent consumption.

**Evidence Ledger format per entry.** Claim, source, source type, date, confidence (high/medium/low), artifact(s) using it, evergreen or time-sensitive, expiration/recheck date, approved wording.

**Sequencing.** Runs after Agents 5 and 6 complete.

---

#### Agent 8: commercial-wedge-validator

**Purpose.** Synthesizes all Stage 1 research into a commercial viability assessment. Forces a proceed/revise/kill decision.

**Model.** Opus 4.

**Web research required.** No.

**Inputs.** All Stage 1 outputs (Agents 1-7), including strategic fitness assessment (Agent 3).

**Outputs.** Commercial wedge assessment containing: top 3 buyer pains, named economic buyer, likely budget source, urgency trigger, business consequence of inaction, "why now" argument, "why Verndale" argument, minimum viable IQX wedge, top 10 reasons this will not sell, top 10 reasons delivery may fail, assumptions most likely to be false, evidence needed to proceed, and a proceed/revise/kill recommendation. Also includes lightweight packaging hypothesis: diagnostic, accelerator, full build, or managed service.

**Sequencing.** Runs last in Stage 1, after Agent 7.

---

#### Stage 1 Gate

**Type.** Human decision gate. Proceed, revise, or kill.

**How to execute.** Review the commercial wedge assessment and strategic fitness assessment. In Claude Code, state: "proceed to Stage 2," "revise [specific items]," or "kill this industry." Decision is logged to OFFERING-DECISIONS.md.

---

### 4.3 Stage 2: Offering Spine

Purpose: Define the strategic, analytical, and data foundations of the IQX offering.

#### Agent 9: regulatory-compliance-researcher

**Purpose.** Identifies applicable regulations and compliance requirements relevant to customer data, data sharing, analytics, and AI in this industry. Produces structured, machine-readable output that downstream agents consume as constraints.

**Model.** Opus 4.

**Web research required.** Yes.

**Inputs.** Industry brief (Agent 1), business profile (Agent 2).

**Outputs.** Regulatory landscape with structured constraint entries. Per regulation/risk: affected data types, affected workflows, prohibited uses, consent requirements, explainability requirements, audit/logging requirements, retention/deletion considerations, impact on prototype, impact on real implementation, sales-language restrictions.

**Sequencing.** Can run immediately when Stage 2 begins. No Stage 2 internal dependencies.

---

#### Agent 10: strategy-alignment-analyst

**Purpose.** Given that Verndale has committed to pursuing this industry (validated at Stage 1 gate), identifies where the IQX offering creates the most differentiated value and defines Verndale's positioning within the industry. This agent focuses on differentiation and positioning, not the basic strategic fitness question (which was resolved by Agent 3).

**Model.** Opus 4.

**Web research required.** No.

**Inputs.** All Stage 1 outputs, Verndale strategy context (provided in CLAUDE.md).

**Outputs.** Differentiation and positioning brief: where Verndale's IQX offering is most differentiated, positioning recommendations, strategic misalignment flags if any.

**Sequencing.** Can run immediately when Stage 2 begins. No Stage 2 internal dependencies.

---

#### Agent 11: market-and-icp-analyst

**Purpose.** Builds TAM, SAM, SOM, and segment definitions with documented assumptions. Also defines the Ideal Customer Profile. Also produces a "pursuable account universe" analysis: current Verndale clients that fit, warm prospects, partner-sourced prospects, likely deal size, likely sales cycle, buyer titles, budget source, and a top-25 target account list. Second output: a pre-formatted ChatGPT system prompt for a custom ICP evaluator GPT with explicit scoring logic.

**Model.** Opus 4.

**Web research required.** Yes. Needs firm counts, revenue distributions, technology adoption rates. Must include fallback assumption brackets where live data is unavailable.

**Inputs.** Industry brief (Agent 1), business profile (Agent 2), differentiation brief (Agent 10), commercial wedge assessment (Agent 8).

**ICP evaluator scoring dimensions.** Firmographic fit, pain fit, data readiness, platform fit (Snowflake/Sigma), budget fit, urgency fit, relationship/access fit, delivery complexity, strategic value, disqualifiers. Outputs: fit score, confidence score, missing information, recommended discovery questions, pursue/nurture/disqualify recommendation.

**Outputs.** (1) Market sizing model with assumptions. (2) ICP definition with scoring criteria. (3) Pursuable account universe. (4) ChatGPT ICP evaluator system prompt.

**Sequencing.** Runs after Agent 10.

---

#### Agent 12: use-case-architect

**Purpose.** Defines how the IQX offering remedies the pain points identified in Stage 1, in the context of the personas and their jobs to be done. This is the bridge between research (what hurts today) and offering design (what IQX does about it). For each use case, specifies the metrics and KPIs the platform will surface, the intelligence (scores, predictions, models) that powers the use case, and the Sigma experience and Snowflake data contract required to deliver it.

**Model.** Opus 4.

**Web research required.** No.

**Inputs.** Persona and pain inventory (Agent 5), journey maps (Agent 4), systems and data inventory (Agent 6), regulatory constraints (Agent 9), differentiation brief (Agent 10), commercial wedge assessment (Agent 8). Also reads: `shared/product-doctrine.md`, `shared/sigma-capability-matrix.yaml`, `shared/sigma-first-design-rules.md`, `shared/snowflake-platform-rules.md`, `shared/activation-data-patterns.md`, `shared/quality-gates.md`.

**Outputs per use case.** User persona, job to be done being addressed, pain point being remedied, insight or action enabled, data required, success definition. For activation use cases: who acts, trigger, recommendation, action channel, user approve/edit/reject options, logging, success measurement, feedback loop, compliance guardrails.

Each use case must also include a structured Sigma and Snowflake contract:

```yaml
sigma_experience:
  canonical_pages:
  sigma_native_elements:
  sigma_approximate_elements:
  unsupported_or_aspirational_elements:
  required_controls:
  required_tables:
  required_charts:
  activation_surface:

snowflake_contract:
  required_entities:
  required_marts:
  required_metrics:
  semantic_definitions:
  activation_tables:
  pii_and_consent_constraints:
```

**Outputs for metrics.** Metric taxonomy: business metrics, health scores, composite scores, segmentations, KPIs. Each mapped to the consuming persona and the use case it supports.

**Outputs for intelligence layer.** Net-new insights, scoring and propensity models needed, AI and agentic capabilities required, activation connections.

**Quality rule.** No use case is complete unless it maps persona, job to be done, pain point, product remedy, required data, required metric, Sigma experience, Snowflake data contract, activation behavior, and measurable business outcome.

**Sequencing.** Runs after Agents 9 and 10 complete. Can run in parallel with Agent 11 (market-and-icp-analyst).

---

#### Agent 13: customer-360-data-modeler

**Purpose.** Designs the logical Customer 360 data model and its Snowflake implementation shape to support the use cases defined by Agent 12. The data model serves the use cases, not the other way around. This ensures the model is focused on what the offering actually needs rather than becoming an exhaustive "unify everything" exercise.

**Model.** Opus 4.

**Web research required.** No.

**Inputs.** Use case library (Agent 12), systems and data inventory (Agent 6), regulatory constraints (Agent 9). Also reads: `shared/product-doctrine.md`, `shared/snowflake-platform-rules.md`, `shared/snowflake-data-modeling-patterns.md`, `shared/activation-data-patterns.md`, `shared/quality-gates.md`.

**Outputs.** The data model must address both the logical model and the following Snowflake implementation layers:

```
RAW_SYNTHETIC    # Staged synthetic source data for prototype use
CORE             # Cleaned, conformed, identity-resolved customer entities
MART_SIGMA       # Sigma-ready views optimized for each dashboard page or workflow
SEMANTIC         # Governed metric definitions, unified business vocabulary
ACTIVATION       # Activation request tables, recommendation outputs, action logs
GOVERNANCE       # Consent records, PII classifications, audit trail
```

Required outputs per layer: entity grains, keys and identity resolution assumptions, source-to-target mappings, PII and consent classifications, data quality risks and checks, Sigma-ready mart views, semantic definitions for governed metrics, activation and audit tables, minimum viable dataset for prototype, minimum viable dataset for real implementation, implementation complexity score by source system.

**Quality rule.** Every Sigma page or workflow proposed downstream must trace back to one or more MART_SIGMA views, SEMANTIC definitions, or ACTIVATION tables.

**Sequencing.** Runs after Agent 12.

---

#### Agent 14: value-case-modeler

**Purpose.** Quantifies client-side business value. Produces the economic model that executive buyers need to justify the investment.

**Model.** Opus 4.

**Web research required.** Yes. Needs industry benchmark data for retention rates, conversion rates, cost-to-serve, revenue-per-customer, and similar metrics to ground assumptions.

**Inputs.** Use case library (Agent 12), persona and pain inventory (Agent 5), evidence ledger (Agent 7 output), commercial wedge assessment (Agent 8), ICP definition (Agent 11).

**Outputs.** Value levers, formula library, assumptions, conservative/base/aggressive scenarios, required client inputs, ROI calculator structure, proof-point mapping, sensitivity analysis, CFO-safe claims.

**Sequencing.** Runs after Agent 12. Can run in parallel with Agent 13.

---

#### Agent 15: delivery-architecture-and-implementation-planner

**Purpose.** Defines how the IQX offering would be implemented for a real client. Makes the offering sellable without overpromising delivery.

**Model.** Sonnet 4.

**Web research required.** No.

**Inputs.** Customer 360 data model (Agent 13), use case library (Agent 12), systems and data inventory (Agent 6), regulatory constraints (Agent 9), commercial wedge assessment (Agent 8). Also reads: `shared/product-doctrine.md`, `shared/snowflake-platform-rules.md`, `shared/snowflake-data-modeling-patterns.md`, `shared/activation-data-patterns.md`.

**Outputs.** Reference architecture, delivery phases, staffing model (Verndale and client), client responsibilities, Verndale responsibilities, dependency map, technical assumptions, common blockers, implementation timeline ranges, risk register, data readiness checklist, integration complexity tiers, delivery estimation model, post-launch operating model.

**Sequencing.** Runs after Agent 13.

---

#### Stage 2 Gate

**Type.** Human decision gate. Approve offering brief.

**How to execute.** Review all Stage 2 outputs. Write or approve the OFFERING-BRIEF.md (canonical summary). In Claude Code, state: "approve offering brief and proceed to Stage 3," or "revise [specific items]." Decision is logged to OFFERING-DECISIONS.md.

---

### 4.4 Stage 3: GTM and Sales Enablement

Purpose: Build the competitive positioning, commercial packaging, objection handling, and sales collateral needed to take the IQX offering to market.

#### Agent 16: competitive-positioning-analyst

**Purpose.** Identifies competing or adjacent solutions in the market, assesses their positioning, and defines Verndale's differentiation. Defines the "pointed enemy" for this IQX instance: the specific framing of what is broken that IQX solves.

**Model.** Opus 4.

**Web research required.** Yes.

**Inputs.** Industry brief (Agent 1), use case library (Agent 12), ICP (Agent 11), commercial wedge assessment (Agent 8).

**Outputs.** Competitive analysis, differentiation thesis, pointed enemy statement. The pointed enemy must be a specific business outcome framing, not "Customer 360." Examples: "Your teams are managing relationships from partial truths." "You know who is at risk only after they leave."

**Sequencing.** Runs immediately when Stage 3 begins. No Stage 3 internal dependencies.

---

#### Agent 17: packaging-pricing-and-delivery-modeler

**Purpose.** Defines how the IQX offering is packaged and priced, informed by the delivery model. Refines the lightweight packaging hypothesis from Stage 1 into a full recommendation.

**Model.** Sonnet 4.

**Web research required.** No.

**Inputs.** Commercial wedge assessment (Agent 8), use case library (Agent 12), ICP (Agent 11), delivery model (Agent 15), value case (Agent 14), competitive analysis (Agent 16).

**Outputs.** Package tiers (e.g., diagnostic/assessment, prototype/pilot, implementation accelerator, managed optimization, full platform build), modules, implementation scope per tier, pricing structure, ongoing operating model options.

**Sequencing.** Runs after Agent 16.

---

#### Agent 18: sales-objection-architect

**Purpose.** Produces a structured objection library mapped to ICP profiles with recommended responses grounded in the evidence ledger and proof point library.

**Model.** Sonnet 4.

**Web research required.** No.

**Inputs.** ICP (Agent 11), evidence ledger (Agent 7 output), competitive analysis (Agent 16), commercial wedge assessment (Agent 8), delivery model (Agent 15), value case (Agent 14).

**Outputs.** Objection library organized by objection category. Per objection: the objection, which ICP segments raise it, recommended response, supporting evidence, what to concede, what to redirect to.

**Sequencing.** Runs after Agent 16.

---

#### Agent 19: red-team-commercial-skeptic

**Purpose.** "Red team" is a term for a group whose job is to deliberately attack your own plan before an adversary does. This agent plays the role of a skeptical buyer, a competitor, and an honest internal critic. It identifies the strongest reasons the offering will fail commercially or in delivery, so weaknesses can be fixed before a prospect exposes them in a live conversation.

**Model.** Opus 4.

**Web research required.** No.

**Inputs.** All Stage 2 and Stage 3 outputs produced so far.

**Outputs.** Top 10 reasons this will not sell, top 10 reasons delivery may fail, assumptions most likely to be false, evidence gaps, differentiation weaknesses, kill/revise/proceed recommendation.

**Sequencing.** Runs after Agents 16, 17, and 18 complete.

---

#### Agent 20: gtm-collateral-generator

**Purpose.** Builds the master sales narrative (the messaging spine), then generates all derivative GTM collateral from that spine.

**Model.** Opus 4 for narrative spine. Sonnet 4 for derivative collateral.

**Web research required.** No.

**Inputs.** Persona and pain inventory (Agent 5), evidence ledger (Agent 7 output), use case library (Agent 12), ICP (Agent 11), competitive analysis (Agent 16), value case (Agent 14), packaging (Agent 17), objection library (Agent 18), delivery model (Agent 15), red team report (Agent 19).

**Outputs.** (1) Sales narrative: problem, consequence of inaction, solution, proof, call to action, tailored to ICP. This is the master messaging spine. (2) Prospect-facing one-pager. (3) Slide-by-slide content spec for explanatory overview deck. (4) Articles, blog posts, and LinkedIn posts for demand generation. (5) Structured discovery question bank organized by persona and job to be done.

**Sequencing.** Runs after Agent 19.

---

#### Stage 3 Gate

**Type.** Human decision gate. Approve sales readiness.

**How to execute.** Review the sales narrative, collateral, red team report, and objection library. In Claude Code, state: "approve sales readiness and proceed to Stage 4," "revise [specific items]," or "hold for [reason]." Decision is logged to OFFERING-DECISIONS.md.

---

### 4.5 Stage 4: Prototype

Purpose: Produce a Sigma-first prototype specification, Snowflake-backed synthetic data model, and launch readiness assessment. The prototype is a sales conversation instrument informed by the sales narrative, competitive positioning, and commercial framing from Stage 3. React may be used only as an optional, non-canonical visualization sketchpad. The canonical prototype is the Sigma workbook/application experience backed by Snowflake data, metrics, semantic definitions, and activation state. Agent 21 produces the Sigma-first spec before any optional React sketch spec.

#### Agent 21: prototype-experience-spec-builder

**Purpose.** Defines the canonical Sigma prototype experience backed by Snowflake, then optionally creates a constrained React sketch spec for visual exploration. This is the primary specification agent for Stage 4. React is subordinate: it may help explore visual ideas, but the canonical prototype specification is Sigma-first.

**Model.** Opus 4.

**Web research required.** No.

**Inputs.** Use case library (Agent 12), Customer 360 data model (Agent 13), persona information from business profile (Agent 2) and persona/pain inventory (Agent 5), metric taxonomy (Agent 12 output), value case (Agent 14), regulatory constraints (Agent 9), sales narrative and pointed enemy (Agent 20 and Agent 16 outputs), packaging tiers (Agent 17 output). Also reads: `shared/product-doctrine.md`, `shared/sigma-workbook-as-code-rules.md`, `shared/sigma-capability-matrix.yaml`, `shared/sigma-first-design-rules.md`, `shared/snowflake-platform-rules.md`, `shared/activation-data-patterns.md`, `shared/react-sketchpad-constraints.md`, `shared/quality-gates.md`.

**Prototype principles.** 2-3 killer workflows only. One executive view. One manager/operator view. One AI-assisted activation moment. One clear before/after data-fragmentation story. One measurable business outcome. Explicit "synthetic demo data" labeling. No excessive navigation. No generic dashboards. No vanity KPIs. The prototype is a sales conversation instrument, not a product mock.

**Required outputs:**

1. Persona workflow maps
2. Sigma-native page and screen inventory
3. Sigma feasibility matrix (see format below)
4. Sigma workbook build spec
5. Snowflake data dependency map
6. Activation workflow spec
7. Optional React visualization sketch spec (only if React adds exploratory value not yet achievable in Sigma)
8. React divergence register (documents every React behavior that is not Sigma-realizable)

**Sigma feasibility matrix.** Every proposed interface pattern must be classified as one of:

```
Sigma-native
Sigma-approximate
Requires manual Sigma build
Currently unsupported / aspirational
React-only, not allowed in canonical prototype
```

Example entry format:

```yaml
interaction: approve recommended retention audience
classification: sigma_approximate
sigma_implementation: table + controls + activation request output table
manual_sigma_work_required: possible action/button behavior
react_allowed: yes, if visually equivalent
canonical: Sigma approximation
```

**Hard rule.** React may not introduce net-new canonical behavior. Anything React adds must either be Sigma-realizable, Sigma-approximate, or explicitly labeled aspirational and excluded from the canonical prototype.

**Sequencing.** Runs when Stage 4 begins. Sigma-first spec is produced before any optional React sketch spec.

---

#### Agent 22: synthetic-data-generator

**Purpose.** Produces Snowflake-ready synthetic data assets and demo data files that support the exact prototype experience defined by Agent 21. Outputs must enable the demo storyline to run end-to-end in Sigma against Snowflake.

**Model.** Sonnet 4.

**Web research required.** No.

**Inputs.** Customer 360 data model (Agent 13), use case library (Agent 12), systems and data inventory (Agent 6), prototype spec (Agent 21). Also reads: `shared/product-doctrine.md`, `shared/snowflake-platform-rules.md`, `shared/snowflake-data-modeling-patterns.md`, `shared/activation-data-patterns.md`, `shared/quality-gates.md`.

**Required outputs:**

- CSV or Parquet demo files (optimized for narrative clarity, clean enough for demo flow, includes realistic edge cases)
- Snowflake DDL (table definitions matching the Agent 13 layer structure)
- Snowflake load instructions
- Seeded data generation logic (reproducible; supports specific "aha" moments)
- Data dictionary
- Data quality checks
- MART_SIGMA views (Sigma-ready views matching the Agent 21 page inventory)
- Activation sample records (pre-populated activation request and output tables)
- Demo storyline fixtures (named personas, scenario scripts, before/after states)

**Quality rule.** Synthetic data must support the exact aha moments, Sigma pages, metrics, activation scenarios, and demo storyline defined by Agent 21.

**Sequencing.** Runs after Agent 21.

---

#### Agent 23: launch-readiness-assessor

**Purpose.** Evaluates whether the IQX instance is ready to market and sell against a defined checklist. Includes a technical honesty gate ensuring the prototype is faithfully representable in Snowflake and Sigma before the instance is presented to prospects.

**Model.** Sonnet 4.

**Web research required.** No.

**Inputs.** All Stage 2, Stage 3, and Stage 4 outputs. Also reads: `shared/product-doctrine.md`, `shared/sigma-workbook-as-code-rules.md`, `shared/sigma-capability-matrix.yaml`, `shared/sigma-first-design-rules.md`, `shared/snowflake-platform-rules.md`, `shared/snowflake-data-modeling-patterns.md`, `shared/activation-data-patterns.md`, `shared/react-sketchpad-constraints.md`, `shared/quality-gates.md`.

**Launch readiness checklist.** ICP approved. Named buyer personas approved. Top 3 use cases approved. Customer 360 data model drafted. Demo scenario built. Sales narrative tested internally. Discovery framework complete. Proof points sourced. Objection handling complete. Delivery model drafted. Pricing/package assumptions approved. Value model complete. At least 3 target accounts identified. Known risks documented.

**Technical honesty gate.** Agent 23 must fail launch readiness if any of the following are true:

- The prototype depends on React-only behavior not labeled aspirational.
- The Sigma feasibility matrix is missing or incomplete.
- Sigma pages do not map to Snowflake MART_SIGMA views, SEMANTIC definitions, or ACTIVATION tables.
- Metrics are inconsistent across use case library, data model, and prototype spec.
- Activation actions lack Snowflake logging or audit tables.
- Unsupported Sigma features are presented as canonical.
- Synthetic data does not support the demo storyline defined by Agent 21.

**Outputs.** (1) Readiness assessment with pass/fail per criterion, gaps identified, recommended actions before launch. (2) Sigma/Snowflake Prototype Integrity Assessment with explicit pass/fail on: Sigma feasibility, Snowflake data model traceability, metric consistency, activation auditability, React divergence risk, synthetic data completeness.

**Sequencing.** Runs last in Stage 4, after Agent 22.

---

#### Stage 4 Gate

**Type.** Human decision gate. Launch readiness review.

**How to execute.** Review the launch readiness assessment, the Sigma/Snowflake Prototype Integrity Assessment (including Sigma feasibility matrix and React divergence register), and the red team report. In Claude Code, state: "approve for launch," "revise [specific items]," or "hold for [reason]." Decision is logged to OFFERING-DECISIONS.md.

---

### 4.6 Stage 5: Learning Loop

Purpose: Ongoing intake of new information, sales learnings, and managed updates to the canonical offering. Stage 5 will be refined in a future deep-dive session.

#### Agent 24: slack-intake-monitor

**Purpose.** Monitors the #[industry]iqx-updates Slack channel. Picks up new items (comments, URLs, PDFs, observations), fetches content, analyzes implications for the current IQX definition, rates significance (low/medium/high), classifies impact category, and writes a structured entry to UPDATES-INBOX.md.

**Impact categories.** Factual update, proof point update, positioning update, ICP update, data model update, pricing/package update, delivery feasibility update, kill/reconsider trigger. High-severity items in the "kill/reconsider trigger" category route to OFFERING-DECISIONS.md.

**Model.** Haiku 4.5.

**Web research required.** No.

**MCP connections.** Slack MCP.

**Inputs.** Slack channel messages.

**Outputs.** Structured entries in UPDATES-INBOX.md.

**Sequencing.** Runs on demand or on a scheduled cadence via Cowork.

**Escalation.** High-significance items unprocessed for 7+ days trigger a re-post to the Slack channel as a reminder.

---

#### Agent 25: sales-learning-synthesizer

**Purpose.** Processes structured sales learning entries and synthesizes them into proposed offering changes. Sales interactions are the highest-value input to the update loop.

**Model.** Sonnet 4.

**Web research required.** No.

**Inputs.** SALES-LEARNINGS.md entries.

**SALES-LEARNINGS.md entry format.** Account type, buyer persona, meeting type, what resonated, what did not resonate, objections raised, missing proof, budget signal, urgency signal, data readiness signal, competitive mentions, follow-up needed, implications for offering.

**Outputs.** Proposed offering changes written to UPDATES-INBOX.md for the same governance flow.

**Sequencing.** Runs on demand.

---

#### Agent 26: offering-updater

**Purpose.** Revises affected artifacts based on approved inbox entries. Writes proposed changes to the PROPOSED/ folder. Never directly modifies live artifacts. Also outputs a downstream impact assessment identifying which other artifacts may now be inconsistent.

**Model.** Sonnet 4.

**Web research required.** Situational. If an update requires re-verification of claims, the affected claims should be flagged for web research.

**Inputs.** Specific UPDATES-INBOX.md entry (user-selected), current state of affected artifacts. Also reads: `shared/product-doctrine.md`, `shared/sigma-capability-matrix.yaml`, `shared/quality-gates.md`.

**Outputs.** (1) Revised artifact(s) in PROPOSED/ folder. (2) Downstream impact assessment listing potentially affected artifacts. (3) On approval: git commit with UPDATES-LOG.md entry.

**Sequencing.** Triggered manually by user against specific inbox entries.

---

#### Agent 27: research-verifier

**Purpose.** Ingests web-researched content and produces final sourced versions of documents with VERIFY flags. Slots verified claims into the Evidence Ledger.

**Model.** Haiku 4.5.

**Web research required.** No. Consumes already-researched content.

**Inputs.** Draft documents with VERIFY flags, web research results (provided by user from claude.ai or ChatGPT sessions).

**Outputs.** Finalized documents with verified claims. Updated Evidence Ledger entries.

**Sequencing.** Runs after user completes web research for flagged claims.

---

#### Stage 5 Gate

**Type.** Human decision gate. Approve changes into canonical offering.

**How to execute.** Two sub-gates per update cycle. Gate 5A: review UPDATES-INBOX.md, trigger offering-updater on entries to act on, or mark entries as deferred/rejected. Gate 5B: review diffs in PROPOSED/ folder. In Claude Code, state "approve" (moves to live artifact, git commits, writes UPDATES-LOG.md entry) or "reject this change" (discards PROPOSED/ file).

---

## 5. Sequencing Summary

### Stage 1: Commercial Scan

```
Agent 1 (industry-landscape-analyst)
  |
Agent 2 (business-deep-dive-analyst)
  |
Agent 3 (strategic-fitness-assessor)
  |  [informal go/no-go; user may kill here]
  |
Agent 4 (constituent-journey-mapper)
  |
Agent 5 (persona-and-pain-analyst)
  |
  +---> Agent 6 (systems-and-data-analyst) [can parallel with 5, benefits from 5]
  |
  +---> Agent 7 (industry-evidence-researcher) [after 5 AND 6]
           |
        Agent 8 (commercial-wedge-validator)

>>> GATE: Proceed / Revise / Kill <<<
```

### Stage 2: Offering Spine

```
Agent 9 (regulatory-compliance-researcher) ----+
                                                |
Agent 10 (strategy-alignment-analyst) ---------+---> Agent 11 (market-and-icp-analyst)
                                                |
                                                +---> Agent 12 (use-case-architect) [after 9 AND 10]
                                                        |
                                                        +---> Agent 13 (customer-360-data-modeler)
                                                        |       |
                                                        |       +---> Agent 15 (delivery-architecture-and-implementation-planner)
                                                        |
                                                        +---> Agent 14 (value-case-modeler) [parallel with 13]

Note: Agents 9 and 10 can run in parallel at Stage 2 start.
Agent 11 waits for Agent 10.
Agent 12 waits for Agents 9 and 10. Can run in parallel with Agent 11.
Agent 13 waits for Agent 12. Use cases drive the data model.
Agents 14 and 15 wait for their respective dependencies.

>>> GATE: Approve Offering Brief <<<
```

### Stage 3: GTM and Sales Enablement

```
Agent 16 (competitive-positioning-analyst) ---+---> Agent 17 (packaging-pricing-and-delivery-modeler)
                                              |
                                              +---> Agent 18 (sales-objection-architect)
                                                       |
                                              Agent 19 (red-team-commercial-skeptic) [after 16, 17, 18]
                                                       |
                                              Agent 20 (gtm-collateral-generator)

Note: Agents 17 and 18 can run in parallel after Agent 16.

>>> GATE: Approve Sales Readiness <<<
```

### Stage 4: Prototype

```
Agent 21 (prototype-experience-spec-builder)
  |
Agent 22 (synthetic-data-generator)
  |
Agent 23 (launch-readiness-assessor)

Note: Agent 21 consumes Stage 3 outputs (sales narrative, pointed enemy,
packaging) as inputs, ensuring the prototype reflects the sales motion.

>>> GATE: Launch Readiness Review <<<
```

### Stage 5: Learning Loop

```
#[industry]iqx-updates Slack channel
  |
Agent 24 (slack-intake-monitor)
  |
UPDATES-INBOX.md
  |
>>> GATE 5A: User reviews, triggers or defers <<<
  |
Agent 26 (offering-updater) ---> PROPOSED/ folder
  |
>>> GATE 5B: User reviews diff, approves or rejects <<<
  |
Git commit + UPDATES-LOG.md

SALES-LEARNINGS.md ---> Agent 25 (sales-learning-synthesizer) ---> UPDATES-INBOX.md
                                                                     (same flow)

Agent 27 (research-verifier): runs on demand after web research sessions.
```

---

## 6. Web Research Architecture

Web research is handled outside Claude Code. Agents that require web research produce draft outputs with inline `VERIFY` flags. The user runs targeted research sessions in claude.ai (with web search enabled) or ChatGPT (with browsing enabled), then drops the verified content back into the project directory. Agent 27 (research-verifier) finalizes the documents.

### Agents Requiring Web Research

| Agent | What needs live sourcing |
|---|---|
| 1. industry-landscape-analyst | Industry structure, trends, current dynamics |
| 7. industry-evidence-researcher | Statistics, studies, third-party data, case studies |
| 9. regulatory-compliance-researcher | Current regulations, recent enforcement actions |
| 11. market-and-icp-analyst | Firm counts, revenue distributions, technology adoption rates |
| 14. value-case-modeler | Industry benchmark data for retention, conversion, cost-to-serve |
| 16. competitive-positioning-analyst | Current competitor offerings, positioning, pricing |

### Web Research Workflow

1. Run the agent in Claude Code. It produces a draft with VERIFY flags.
2. Open claude.ai or ChatGPT with web search. Run targeted queries against the flagged claims.
3. Save research results as a markdown file in the project's `research-inputs/` directory.
4. Run Agent 27 (research-verifier) to finalize the document and update the Evidence Ledger.

---

## 7. Agent File Structure

Each agent is instantiated as a directory with the following files:

```
agents/
  <agent-name>/
    AGENT.md          # System prompt: identity, role, persona, constraints, behavior rules
    INSTRUCTIONS.md   # Step-by-step execution instructions: what to do, in what order
    SKILL.md          # Domain knowledge, frameworks, reference material, industry context
    OUTPUT-SPEC.md    # Exact output schema: sections, format, quality criteria, length targets
    INPUTS.md         # What files/artifacts this agent reads, with exact relative paths
    DEPENDENCIES.md   # Which agents must complete before this one runs, and how to verify
    MCP.md            # MCP connections needed (Slack, Atlassian, etc.), if any
    output/           # Directory where this agent writes its deliverables
```

**AGENT.md** contains the agent's system prompt. It defines who the agent is, what it does, what it must not do, what model it runs on, and any behavioral constraints. Industry-specific context from the Factory is baked in here.

**INSTRUCTIONS.md** contains the step-by-step execution playbook. It tells the agent (or the user invoking it) exactly what to do: read these files, analyze in this order, produce this output, write to this location.

**SKILL.md** contains domain knowledge the agent needs. For research agents, this includes industry-specific context, relevant frameworks, and reference data. For GTM agents, this includes messaging frameworks, collateral templates, and style guidelines. The Factory populates this with industry-specific material.

**OUTPUT-SPEC.md** defines exactly what the agent must produce. Sections, headings, required fields, format (markdown, JSON, etc.), quality criteria, length targets, and what "done" looks like. This is the contract downstream agents rely on.

**INPUTS.md** lists every file the agent must read before executing, with relative paths within the project directory. This ensures agents consume the correct upstream artifacts.

**DEPENDENCIES.md** states which agents must complete before this one can run, and how to verify completion (e.g., "Agent 13 output exists at `agents/customer-360-data-modeler/output/data-model.md`").

**MCP.md** lists any MCP server connections the agent needs. Most agents need none. Agent 24 (slack-intake-monitor) needs the Slack MCP. Agents producing Confluence documentation need the Atlassian MCP.

---

## 8. Project Directory Structure

The IQX Factory generates the following directory structure:

```
<Industry>IQX/
  CLAUDE.md                          # Project-level shared context (Verndale strategy, IQX overview, industry context, product doctrine)
  OFFERING-BRIEF.md                  # Canonical offering summary (written at Stage 2 gate)
  OFFERING-DECISIONS.md              # Strategic decision log
  EVIDENCE-LEDGER.md                 # Canonical evidence/proof point library
  SALES-LEARNINGS.md                 # Structured sales conversation learnings
  UPDATES-INBOX.md                   # Incoming update items, unprocessed
  UPDATES-LOG.md                     # Processed update items with audit trail
  PROPOSED/                          # Proposed artifact changes awaiting approval
  research-inputs/                   # Web research results dropped in by user
  shared/                            # Platform knowledge pack (created by Factory, consumed by relevant agents)
    product-doctrine.md              # Section 2.4 doctrine: Sigma-first, Snowflake-backed, React non-canonical
    sigma-first-design-rules.md      # Rules for designing Sigma-realizable experiences
    sigma-capability-matrix.yaml     # Feature-by-feature Sigma capability tracking (see Section 13)
    sigma-workbook-as-code-rules.md  # Workbook-as-code conventions and constraints
    snowflake-platform-rules.md      # Snowflake layer conventions, naming, governance rules
    snowflake-data-modeling-patterns.md  # Reusable data modeling patterns for IQX instances
    activation-data-patterns.md      # Patterns for activation request, output, logging, and audit tables
    react-sketchpad-constraints.md   # Rules constraining React to non-canonical visual exploration only
    quality-gates.md                 # Quality criteria across all stages
    docs-ledger.md                   # Documentation source tracking (see Section 13)
  agents/
    industry-landscape-analyst/
      AGENT.md
      INSTRUCTIONS.md
      SKILL.md
      OUTPUT-SPEC.md
      INPUTS.md
      DEPENDENCIES.md
      MCP.md
      output/
    business-deep-dive-analyst/
      ...
    strategic-fitness-assessor/
      ...
    constituent-journey-mapper/
      ...
    persona-and-pain-analyst/
      ...
    systems-and-data-analyst/
      ...
    industry-evidence-researcher/
      ...
    commercial-wedge-validator/
      ...
    regulatory-compliance-researcher/
      ...
    strategy-alignment-analyst/
      ...
    market-and-icp-analyst/
      ...
    use-case-architect/
      ...
    customer-360-data-modeler/
      ...
    value-case-modeler/
      ...
    delivery-architecture-and-implementation-planner/
      ...
    competitive-positioning-analyst/
      ...
    packaging-pricing-and-delivery-modeler/
      ...
    sales-objection-architect/
      ...
    red-team-commercial-skeptic/
      ...
    gtm-collateral-generator/
      ...
    prototype-experience-spec-builder/
      ...
    synthetic-data-generator/
      ...
    launch-readiness-assessor/
      ...
    slack-intake-monitor/
      ...
    sales-learning-synthesizer/
      ...
    offering-updater/
      ...
    research-verifier/
      ...
  .git/
```

---

## 9. Canonical Project Files

### OFFERING-BRIEF.md

Written or approved by the user at the Stage 2 gate. This is the single source of truth for what the IQX offering is, who it serves, and why it exists. All downstream collateral derives from this document.

### OFFERING-DECISIONS.md

Logs every major strategic decision. Per entry: decision, date, rationale, alternatives considered, evidence, owner, downstream artifacts affected, status (active/superseded).

### EVIDENCE-LEDGER.md

Single source of truth for all external claims used in any artifact. Per entry: claim, source, source type, date, confidence (high/medium/low), artifact(s) using it, evergreen or time-sensitive, expiration/recheck date, approved wording. All GTM artifacts pull from this ledger. No agent may introduce an external claim that is not in the ledger.

### SALES-LEARNINGS.md

Structured entries from sales conversations. Per entry: account type, buyer persona, meeting type, what resonated, what did not, objections raised, missing proof, budget signal, urgency signal, data readiness signal, competitive mentions, follow-up needed, implications for offering.

### UPDATES-INBOX.md

Raw incoming update items. Per entry: date, source, content summary, phase impact, significance (low/medium/high), impact category (factual/proof point/positioning/ICP/data model/pricing/delivery feasibility/kill-reconsider), status (pending/deferred/rejected/processed).

### UPDATES-LOG.md

Processed update items. Per entry: inbox reference, agent outputs affected, the change made, approval status (approved/rejected), git commit hash.

---

## 10. Governance and Version Control

### Git

The project directory is a git repo from day one. Every approved artifact change is committed with a message referencing the UPDATES-LOG entry or the gate decision. Full history, diffs, and rollback are available.

### PROPOSED/ Folder

All agent-proposed changes to existing artifacts are written to the PROPOSED/ folder. Nothing in PROPOSED/ is canonical. The user reviews, approves (move to live location, commit), or rejects (discard).

### Human Gates

There are five explicit human gates. No automation runs past these without user approval.

| Gate | Location | Decision | How to Execute |
|---|---|---|---|
| Stage 1 Gate | After Agent 8 | Proceed / Revise / Kill | State decision in Claude Code; logged to OFFERING-DECISIONS.md |
| Stage 2 Gate | After Agent 15 | Approve offering brief | Review outputs, write/approve OFFERING-BRIEF.md; logged to OFFERING-DECISIONS.md |
| Stage 3 Gate | After Agent 20 | Approve sales readiness | Review narrative, collateral, red team report; state decision; logged to OFFERING-DECISIONS.md |
| Stage 4 Gate | After Agent 23 | Launch readiness review | Review readiness assessment, Sigma feasibility matrix, React divergence register, and red team report; state decision; logged to OFFERING-DECISIONS.md |
| Stage 5 Gates | Ongoing | Approve/reject updates | Gate 5A: review inbox, trigger or defer. Gate 5B: review PROPOSED/ diff, approve or reject |

### Quality Principles

Technical honesty matters as much as sales clarity. No agent may present an experience, metric, activation behavior, or AI capability as canonical unless it can be represented in the Snowflake/Sigma target architecture or is explicitly labeled as aspirational.

### Delegation Model

**Can delegate to other D&A team members.** Source gathering, evidence ledger updates, competitor scans, initial systems inventory, draft market sizing, synthetic data creation, collateral variants, Slack intake triage, citation verification.

**Should not fully delegate.** ICP approval, wedge selection, sales narrative approval, pricing/package approval, prototype storyline approval, decision to proceed/kill, claims used in executive sales materials, final offering positioning.

Principle: delegate research and production. Retain decision rights over strategy and commercial framing.

---

## 11. Tooling

| Tool | Role |
|---|---|
| Claude Code | Primary harness: orchestration, agent execution, file I/O, git operations |
| claude.ai (web search) | Web research for agents with VERIFY flags |
| ChatGPT (browsing) | Alternative web research harness; also hosts ICP evaluator custom GPT |
| Sigma | Stage 4: canonical front-end/application layer for prototype build |
| Snowflake | Stage 4: canonical data, metric, intelligence, activation, and audit layer for prototype |
| React | Stage 4 optional only: non-canonical visualization sketchpad; any React idea not Sigma-realizable must be labeled aspirational and excluded from the canonical prototype |
| Cowork | Optional: schedule periodic Claude Code sessions for slack-intake-monitor |
| Slack | #[industry]iqx-updates channel for ongoing input capture |
| Atlassian Confluence | Documentation and deliverable publishing (via MCP) |

---

## 12. Model Assignments Summary

| Model | Agents |
|---|---|
| Opus 4 | 1 (industry-landscape-analyst), 2 (business-deep-dive-analyst), 7 (industry-evidence-researcher), 8 (commercial-wedge-validator), 9 (regulatory-compliance-researcher), 10 (strategy-alignment-analyst), 11 (market-and-icp-analyst), 12 (use-case-architect), 13 (customer-360-data-modeler), 14 (value-case-modeler), 16 (competitive-positioning-analyst), 19 (red-team-commercial-skeptic), 20 (gtm-collateral-generator, narrative spine), 21 (prototype-experience-spec-builder) |
| Sonnet 4 | 3 (strategic-fitness-assessor), 4 (constituent-journey-mapper), 5 (persona-and-pain-analyst), 6 (systems-and-data-analyst), 15 (delivery-architecture-and-implementation-planner), 17 (packaging-pricing-and-delivery-modeler), 18 (sales-objection-architect), 20 (gtm-collateral-generator, derivative collateral), 22 (synthetic-data-generator), 23 (launch-readiness-assessor), 25 (sales-learning-synthesizer), 26 (offering-updater) |
| Haiku 4.5 | 24 (slack-intake-monitor), 27 (research-verifier) |

---

## 13. Documentation Knowledge Pack

Sigma and Snowflake documentation should be distilled into the `shared/` knowledge pack rather than pasted raw into agent prompts. Agents read the distilled files; raw documentation is never part of agent context.

### docs-ledger.md

Tracks all external documentation sources used to populate the shared knowledge pack.

Per entry:

```
Source name
Source URL or location
Date reviewed
Capabilities covered
Distilled rules created
Known limitations
Owner/reviewer
Recheck cadence
```

### sigma-capability-matrix.yaml

Tracks Sigma feature support for prototype planning and feasibility assessment.

Per entry:

```yaml
feature:
sigma_ui_supported:
workbook_as_code_supported:
manual_build_supported:
react_equivalent:
prototype_guidance:
canonical_allowed:
notes:
source:
date_reviewed:
```

The Factory initializes both files with placeholder structure. The user or a designated D&A team member populates them before Stage 4 runs. Agent 23 (launch-readiness-assessor) reads `sigma-capability-matrix.yaml` as part of the technical honesty gate.

---

## End of Blueprint
