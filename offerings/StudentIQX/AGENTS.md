# StudentIQX — Offering Project Context

> Cursor port of the Claude `CLAUDE.md`. This is the shared context every agent
> in this offering reads first. Keep claims labeled. (A `CLAUDE.md` alias is
> written alongside this file for Claude parity.)

## 1. What this offering is

`StudentIQX` is Verndale's industry-specific customer intelligence and
activation offering for **higher education / the student lifecycle**. It follows
the IQX product model (Customer 360 → Intelligence → Activation), is Sigma-first
and Snowflake-backed, and is produced by the 27-agent IQX army across 5 stages.

- Canonical spec: `factory/IQX_AGENT_BLUEPRINT.md` + `factory/BLUEPRINT-ADDENDUM.md`
- Phase graph: `factory/phases.yaml`
- State: `manifest.yaml`

> **Canonical product name is `StudentIQX`.** `VERIFY:` source material
> (Confluence) drifts across "StudentIQ", "SIQ", and "Student360". Standardize
> every deliverable on **StudentIQX** and treat the source-naming drift as an
> open verification item (see `EVIDENCE-LEDGER.md` and `gap-check-report.md`).

## 2. Industry context (labeled)

> Filled from context intake. Tags: `USER-PROVIDED`, `HYPOTHESIS`,
> `DO NOT ASSUME`, `VERIFY`.

### Industry

- **Industry (USER-PROVIDED):** Higher education / student lifecycle intelligence
  — universities, colleges, and the departments/units within them.

### Problem thesis (USER-PROVIDED, framed as HYPOTHESIS requiring research)

- Higher-ed institutions run different, disconnected/siloed information systems
  to execute and manage different stages of the **student lifecycle**.
- **Student lifecycle stages (USER-PROVIDED):** recruiting / pre-enrollment →
  application → enrollment → active student (member of the student body taking
  classes) → graduation → alumni community membership.
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
- **User base (HYPOTHESIS):** a wide set of users across the student lifecycle
  with different jobs-to-be-done.
- **EXPLICIT RESEARCH MANDATE (USER-PROVIDED):** research is needed to
  understand this space, the true nature of the problem, and to position
  StudentIQX as a compelling solution. **DO NOT ASSUME** the problem framing is
  proven — validate it, and raise inconsistencies.

### Structural oddities / constituent types / LOB equivalents

- **Constituent (student) lifecycle stages** double as the "customer journey":
  prospect → applicant → enrolled/matriculated → active student → graduate →
  alumnus/donor. (USER-PROVIDED lifecycle; stage-to-department mapping is
  `HYPOTHESIS`.)
- **LOB equivalents / functional areas (HYPOTHESIS, from Confluence source):**
  Admissions & Enrollment; Student Success & Retention; Advancement & Alumni;
  Operations / Compliance / Platform Health (IT & data).
- **Institution-type heterogeneity (USER-PROVIDED):** higher-ed institutions
  differ by size, cost, prestige, selectivity, number of colleges/departments,
  educational focus (academic / research / professional), and control
  (not-for-profit / for-profit). Multi-campus and multi-school systems,
  extension schools, and online programs add structure (`HYPOTHESIS`).

### Known incumbents (HYPOTHESIS — from Confluence source, VERIFY)

- **Student-success / analytics incumbents:** EAB Navigate / Navigate+, Civitas
  Learning, Ellucian Illuminate.
- **SIS / LMS / advising systems:** Banner (Ellucian), Colleague, PeopleSoft,
  Workday Student, Canvas, Blackboard, Starfish.
- Incumbent **complementarity vs. displacement** is an open question — see
  `gap-check-report.md`.

### Budget dynamics / buyer vs. user

- **Buyer ≠ user (HYPOTHESIS).** Likely economic buyers by function (Confluence
  source): VP Enrollment Management / Admissions; Dean of Student Affairs / VP
  Student Success / Provost; VP Advancement / Chief Advancement Officer; CIO /
  CDO / VP IT (co-buyer, FERPA-activated). Users are front-line advisors,
  enrollment/ops staff, gift officers, and analysts.
- Budget authority, procurement language, and buying committees vary by function
  and institution type (`HYPOTHESIS`, `VERIFY`).

### Regulatory regime

- **FERPA** (student education records) is the anchor regulatory constraint for
  student data, sharing, analytics, and AI (`HYPOTHESIS` pending Agent 9
  research). Additional considerations may include GLBA (financial aid), state
  privacy laws, Title IV/IX contexts, and accreditation data requirements
  (`VERIFY`).

### Commercial wedge hypothesis

- **HYPOTHESIS:** the single strongest entry signal is a failed/stalled
  "Student 360" / data-warehouse / student-success initiative at an institution
  with 3+ disconnected systems and enrollment-cliff or retention exposure.
  Functional entry likely via Enrollment & Yield (lead motion) or Student
  Success & Retention. **This is a hypothesis to validate, not a settled wedge.**

### DO NOT ASSUME (constraints)

- **DO NOT ASSUME an ICP is settled.** The user explicitly does not yet know how
  to segment the higher-ed market or where StudentIQX resonates most. Defining
  the ICP is an **explicit research objective** of this offering. The Confluence
  ICP/TAM/segmentation material is a strong `HYPOTHESIS` to validate — not truth.
- **DO NOT ASSUME** the 8 named agentic workflows / 4 pillars from the source
  survive research; treat them as hypotheses.
- **DO NOT silently resolve** the ICP enrollment-band conflict (2,000–15,000 vs
  3,000–15,000) — carry it as an open `VERIFY`.
- **DO NOT ASSUME** Coalesce or generic "Snowflake Intelligence" are in
  canonical scope — they are ADJACENT/`VERIFY` (see §3).

## 3. Verndale context

- **Known relationships / clients in this industry (USER-PROVIDED):**
  - Harvard University, Graduate School of Education (GSE). `VERIFY:` nature of
    relationship and decision-makers.
  - Some contacts at Quinnipiac University. `VERIFY:` contacts and relationship
    strength.
  - "That's about it" — no other known higher-ed relationships.
- **Technology scope — canonical prototype stack (USER-PROVIDED + doctrine):**
  - **Snowflake = data layer.**
  - **Sigma = user / experience layer.**
  - **Snowflake Cortex = the AI toolkit** (in scope).
  - **ADJACENT / `VERIFY` (NOT canonical):** Coalesce (data transformation) and
    generic "Snowflake Intelligence" appear in source material — treat as
    adjacent/verify only. This aligns with the always-on Sigma-first /
    Snowflake-backed doctrine.
- **Strategy source (if provided):** none supplied at scaffold time. Verndale
  firm + D&A practice strategy to be injected before Agents 3 and 10 run.

## 4. Operating rules (all agents)

1. **Sigma-first, Snowflake-backed.** React is a non-canonical sketchpad only.
   See `shared/product-doctrine.md`. Snowflake Cortex is the canonical AI toolkit.
2. **Evidence discipline.** No external claim without an `EVIDENCE-LEDGER.md`
   row. Draft research with inline `VERIFY:` flags; Agent 27 finalizes. The
   Confluence sources are seeded as **unverified** — validate before use.
3. **Context labels** on every industry fact (`USER-PROVIDED` / `HYPOTHESIS` /
   `DO NOT ASSUME` / `VERIFY` / `CONFIRMED`).
4. **Write only inside your own** `agent-outputs/<agent-name>/` folder (Stage 4
   builders also write to `prototype/`).
5. **Never silently mutate canonical artifacts** — propose changes in `PROPOSED/`.
6. **Respect dependencies and gates** in `factory/phases.yaml` + `manifest.yaml`.
7. **Standardize naming on `StudentIQX`** across all deliverables; flag any
   source drift (StudentIQ / SIQ / Student360) as `VERIFY`.

## 5. Shared knowledge pack

The 10 files in `shared/` are the canonical Sigma/Snowflake doctrine. Agents
read the specific files listed for them in `factory/phases.yaml` (`shared_files`).

## 6. Model tiers

Each agent declares a `model_tier` (tier1/tier2/tier3). Map tiers to your
provider's models per root `AGENTS.md`. Stage 4 (Agents 21–23) biases to tier1.
