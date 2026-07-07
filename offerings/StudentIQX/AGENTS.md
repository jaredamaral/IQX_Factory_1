# StudentIQX — Offering Project Context

> Cursor port of the Claude `CLAUDE.md`. This is the shared context every agent
> in this offering reads first. Keep claims labeled. (A `CLAUDE.md` alias is
> written alongside this file for Claude parity.)

## 1. What this offering is

`StudentIQX` is Verndale's industry-specific customer intelligence and activation offering for **higher education / the student lifecycle**. It follows the IQX product model (Customer 360 → Intelligence → Activation), is Sigma-first and Snowflake-backed, and is produced by the 27-agent IQX army across 5 stages.

- Canonical spec: `factory/IQX_AGENT_BLUEPRINT.md` + `factory/BLUEPRINT-ADDENDUM.md`
- Phase graph: `factory/phases.yaml`
- State: `manifest.yaml`

> **Canonical product name is `StudentIQX`.** `VERIFY:` source material
> (Confluence) drifts across "StudentIQ", "SIQ", and "Student360". Standardize
> every deliverable on **StudentIQX** and treat the source-naming drift as an
> open verification item (see `EVIDENCE-LEDGER.md` and `gap-check-report.md`).



## 2. Industry context (labeled)

> Filled from context intake. **Inline tags (closed set):** `USER-PROVIDED`,
> `HYPOTHESIS`, `VERIFY`, `GATING VERIFY`, `GATING HYPOTHESIS` — see
> `factory/IQX_AGENT_BLUEPRINT.md` §3.3. **Standing constraints** (below) are
> prose rules, not inline tags. **Locked decisions** are in `OFFERING-DECISIONS.md`.



### Industry

- **Industry (USER-PROVIDED):** Higher education / student lifecycle intelligence
— universities, colleges, and the departments/units within them.



### Problem thesis (USER-PROVIDED, framed as HYPOTHESIS requiring research)

- Higher-ed institutions run different, disconnected/siloed information systems
to execute and manage different stages of the **student lifecycle**.
- **Student lifecycle stages (USER-PROVIDED):** recruiting / pre-enrollment → application → enrollment → active student (member of the student body taking classes) → graduation → alumni community membership.
- Siloed systems prohibit or hinder the institution's ability to have real
intelligence about students individually and collectively; this weakens
decision-making, obscures risks/issues, slows response and risk mitigation,
and causes lost opportunities — with real negative (including financial)
impact.
- **Sector pressures (HYPOTHESIS):** demographic shifts, over-indexed cost
increases, changing attitudes about the value of a university degree,
drop-out / stop-out risk, and alumni engagement.
- **StudentIQX functional concept (USER-PROVIDED):** (a) unified student data at
each lifecycle stage AND across stages; (b) new views/models conveying new
insights, trends, risks, and predictions; (c) AI-enabled workflows that help
users do their jobs better.
- **Platform shape (USER-PROVIDED):** StudentIQX is **not plug-and-play**. It is a
platform with **reusable components** (data model patterns, semantic metrics,
Sigma experiences, activation patterns) plus **flexibility** for each institution
or school/college to define its own metrics, processes, and governance rules.
Conflicting KPI definitions across offices are expected; the offering must
accommodate them via governed semantic definitions (Agents 6, 13), not assume
one universal dictionary.
- **User base (HYPOTHESIS):** a wide set of users across the student lifecycle
with different jobs-to-be-done.
- **EXPLICIT RESEARCH MANDATE (USER-PROVIDED):** research is needed to
understand this space, the true nature of the problem, and to position
StudentIQX as a compelling solution. Validate the problem framing; raise
inconsistencies (`GATING VERIFY` if kill-blocking).



### Structural oddities / constituent types / LOB equivalents

- **Constituent (student) lifecycle stages** double as the "customer journey":
prospect → applicant → enrolled/matriculated → active student → graduate →
alumnus/donor. (USER-PROVIDED lifecycle; stage-to-department mapping is
`HYPOTHESIS`.)
- **School/college autonomy within universities (USER-PROVIDED):** At larger
universities, **schools or colleges may operate like distinct businesses** —
different systems, processes, roles, and jobs-to-be-done on the **business side**
(e.g., Harvard GSE vs Harvard Business School vs Law School). **Technology
governance may not mirror business autonomy** — `GATING HYPOTHESIS`: some
services (e.g., infrastructure) may be university-provided while application
support may be school/college-owned; Agents 6 and 8 must validate per account.
- **Public vs private control (USER-PROVIDED + `HYPOTHESIS`, advisor-sourced,
  `VERIFY`):** Public universities may have **more board-level technology
  governance and slower buying cycles**; private institutions may have **less
  bureaucratic layering**. A higher-ed advisor suggested **small liberal arts
  colleges** as a segment with **fewer buying-decision layers** — treat as an
  **ICP hypothesis** for Agent 11, not settled ICP (E-040).
- **LOB equivalents / functional areas (HYPOTHESIS, from Confluence source):**
Admissions & Enrollment; Student Success & Retention; Advancement & Alumni;
Operations / Compliance / Platform Health (IT & data).
- **Institution-type heterogeneity (USER-PROVIDED):** higher-ed institutions
differ by size, cost, prestige, selectivity, number of colleges/departments,
educational focus (academic / research / professional), and control
(public / private nonprofit / for-profit). Multi-campus and multi-school systems,
extension schools, and online programs add structure (`HYPOTHESIS`).



### Known incumbents (HYPOTHESIS — from Confluence source, VERIFY)

- **Student-success / analytics incumbents:** EAB Navigate / Navigate+, Civitas
Learning, Ellucian Illuminate.
- **SIS / LMS / advising systems:** Banner (Ellucian), Colleague, PeopleSoft,
Workday Student, Canvas, Blackboard, Starfish.
- Incumbent **complementarity vs. displacement** — **locked:** complementary
  governed intelligence layer alongside incumbents (see `OFFERING-DECISIONS.md`
  Decision #2). Agent 8 still validates market acceptance of that posture.



### Budget dynamics / buyer vs. user

- **Buyer ≠ user (HYPOTHESIS).** Likely economic buyers by function (Confluence
source): VP Enrollment Management / Admissions; Dean of Student Affairs / VP
Student Success / Provost; VP Advancement / Chief Advancement Officer; CIO /
CDO / VP IT (co-buyer, FERPA-activated). Users are front-line advisors,
enrollment/ops staff, gift officers, and analysts.
- **Budget holder (USER-PROVIDED):** **Unknown** for StudentIQX wedges today.
Must be discovered through market-facing conversations (`GATING VERIFY`, E-029).
Do not assume Enrollment, Student Success, IT/Data, or Finance owns budget
without account validation.
- Budget authority, procurement language, and buying committees vary by function,
institution type, and **school/college vs university level** (`HYPOTHESIS`, `VERIFY`).



### Regulatory regime

- **FERPA** (student education records) is the anchor regulatory constraint for
student data, sharing, analytics, and AI (`HYPOTHESIS` pending Agent 9
research). Additional considerations may include GLBA (financial aid), state
privacy laws, Title IV/IX contexts, and accreditation data requirements
(`VERIFY`).



### Commercial wedge hypothesis

- **USER-PROVIDED wedge instinct (`HYPOTHESIS` — validate at Agent 8):** First
  motion = **pre-enrollment / enrollment through matriculation**, coupled with
  **first-year matriculant retention or general retention**. Aligns with Agent 2
  provisional ranking (Enrollment #1, Student Success #2).
- **HYPOTHESIS (Confluence / Agent 2):** A strong **entry signal** may still be a
  failed/stalled Student 360 / data-warehouse / student-success initiative at an
  institution with 3+ disconnected systems and enrollment or retention pressure
  (E-011). User wedge instinct and this signal are **both hypotheses** until Agent 8
  reconciles them — do not treat either as settled.



### Standing constraints (prose — not inline tags)

These persist across Stage 1. Do not re-tag them inline on every mention; read
this section and `OFFERING-DECISIONS.md`.

- **ICP is not settled.** Defining the ICP is an explicit research objective.
  Confluence ICP/TAM/segmentation material is `HYPOTHESIS` to validate — not truth.
- The 8 named agentic workflows / 4 pillars from source material are `HYPOTHESIS`
  until Agent 12 rebuilds use cases from validated pains.
- **Do not silently resolve** the ICP enrollment-band conflict (2,000–15,000 vs
  3,000–15,000) — carry as `GATING VERIFY` until resolved.
- Coalesce and generic "Snowflake Intelligence" are ADJACENT/`VERIFY`, not
  canonical scope (see §3 and Decision #1).



## 3. Verndale context

- **IQX positioning doctrine (USER-PROVIDED):** Verndale expects **every IQX
  offering**, including StudentIQX, to be a **separate governed layer** — Student
  360, intelligence/insights, and AI-enabled activation — **alongside** incumbent
  operational systems (SIS, CRM, LMS, domain platforms). Reinforces Decision #2
  (E-035).
- **Known relationships / clients in this industry (USER-PROVIDED):**
  - Harvard University, Graduate School of Education (GSE). `VERIFY:` nature of
  relationship and decision-makers. **School/college-level account** inside a large
  university — see structural oddities above (E-034, E-037).
  - Some contacts at Quinnipiac University. `VERIFY:` contacts and relationship
  strength.
  - "That's about it" — no other known higher-ed relationships.
  - **USER-PROVIDED (2026-07-07):** No near-term discovery planned on existing
  relationships; proceed with Stage 1 and treat access as opportunistic.
- **Higher-ed proof (USER-PROVIDED):** No Verndale higher-ed analytics case studies
  or credentials available at intake. Proof gap is acknowledged; prototype and
  first-customer motion must build credibility.
- **First-customer commercial posture (USER-PROVIDED):** Verndale is willing to
  **co-invest** in POC, data-readiness discovery, or similar to win a first
  higher-ed customer (E-042).
- **Partner posture (USER-PROVIDED):** Snowflake and Sigma are **aware** of
  StudentIQX direction; partner support is **opportunistic**, not a dedicated
  co-sell program (E-043).
- **Technology scope — canonical prototype stack (USER-PROVIDED + doctrine):**
  - **Snowflake = data layer.**
  - **Sigma = user / experience layer.**
  - **Snowflake Cortex = the AI toolkit** (in scope).
- **Strategy source = Strategy_Execution_Bridge.md, present in research-inputs folder**



## 4. Operating rules (all agents)

1. **Sigma-first, Snowflake-backed.** React is a non-canonical sketchpad only.
  See `shared/product-doctrine.md`. Snowflake Cortex is the canonical AI toolkit.
2. **Evidence discipline.** No external claim without an `EVIDENCE-LEDGER.md`
  row. Draft research with inline `VERIFY:` flags; Agent 27 finalizes. The
   Confluence sources are seeded as **unverified** — validate before use.
3. **Context labels (closed set).** On industry facts use only: `USER-PROVIDED`,
   `HYPOTHESIS`, `VERIFY`, `GATING VERIFY`, `GATING HYPOTHESIS` (Blueprint §3.3).
   Do **not** invent inline tags (`RISK`, `LOCAL-CHECK`, `CONSTRAINT`, etc.).
   Use Risk Register tables and structured sections instead. `CONFIRMED` is
   evidence-ledger row status only (Agent 27).
4. **Locked decisions.** Read `OFFERING-DECISIONS.md` before assuming positioning,
   surface scope, or stack. Do not re-derive locked items as provisional caveats.
5. **Write only inside your own** `agent-outputs/<agent-name>/` folder (Stage 4
   builders also write to `prototype/`).
6. **Never silently mutate canonical artifacts** — propose changes in `PROPOSED/`.
7. **Respect dependencies and gates** in `factory/phases.yaml` + `manifest.yaml`.
8. **Git discipline.** Commit after each agent completes and after revisions
   (Blueprint addendum §13).
9. **Standardize naming on `StudentIQX`** across all deliverables; flag source
   drift (StudentIQ / SIQ / Student360) as `VERIFY`.



## 5. Shared knowledge pack

The 10 files in `shared/` are the canonical Sigma/Snowflake doctrine. Agents
read the specific files listed for them in `factory/phases.yaml` (`shared_files`).

## 6. Model tiers

Each agent declares a `model_tier` (tier1/tier2/tier3). Map tiers to your
provider's models per root `AGENTS.md`. Stage 4 (Agents 21–23) biases to tier1.