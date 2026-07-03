# Gap-Check Report — StudentIQX

> Produced at scaffold time (Step 2). Assesses the **fixed 27-agent army** against
> higher-ed / student-lifecycle specifics and surfaces early decisions. **No
> agents are added or removed** — gaps are surfaced as decisions and open
> `VERIFY` items for the human. Built fresh from the Blueprint + `shared-templates/`
> + intake context (Rule 1).

## 1. Verdict

The standard 27-agent IQX army **fits higher education** without structural
change. Higher ed maps cleanly onto the IQX model: the **student lifecycle** is
the constituent journey; **functional offices** (Enrollment, Student Success,
Advancement, IT/Data) are the LOBs; **fragmented SIS/CRM/LMS/advising/advancement
systems** are the Customer 360 problem; **FERPA** is the regulatory regime; and
**Snowflake + Sigma + Cortex** is the canonical stack. The tensions below are
domain nuances to manage inside existing agents, not missing agents.

## 2. Buyer ≠ user divergence across four offices

Higher ed has an unusually strong **buyer/user split that also fragments by
office**, each with its own budget, systems, and cycle (all `HYPOTHESIS`):

| Office (LOB) | Likely economic buyer | Front-line users | Sales cycle note |
|---|---|---|---|
| Admissions & Enrollment | VP Enrollment Mgmt / Dir Admissions | enrollment ops, counselors, fin-aid | "lead motion" (fastest) |
| Student Success & Retention | Dean of Students / VP Success / Provost | advisors, early-alert coordinators, IR | longest cycle |
| Advancement & Alumni | VP Advancement / CAO | gift officers, alumni relations | parallel GTM track |
| IT / Data / Compliance | CIO / CDO / VP IT | BI/data engineers, registrar | co-buyer, FERPA-activated (often required above a spend threshold) |

- **Coverage:** Agents 5 (persona/pain), 11 (ICP/buyer titles), 17 (packaging by
  entry point), 18 (objections by segment), 20 (discovery by persona) already
  carry this. **Decision to watch:** which office is the *primary* entry motion —
  unresolved because the **ICP itself is an explicit research objective** (`DO
  NOT ASSUME`). Agents 11 and 25 must resolve it with real evidence.

## 3. FERPA regulatory regime

- **Anchor:** FERPA governs education records, consent, disclosure, and the
  "school official"/vendor exception (relevant to Verndale as processor).
  Adjacent (`VERIFY`): GLBA (fin-aid), state privacy laws, Title IV, HIPAA (campus
  health), PPRA, GDPR (international students).
- **Coverage:** Agent 9 (regulatory) emits machine-readable constraints; Agents
  12/13 bind use cases + data model to them; GOVERNANCE layer carries consent/PII/
  audit; Agent 23's technical-honesty gate checks activation auditability.
- **Decision to watch:** predictive **risk scoring** on students (retention/
  admissions) raises consent, explainability, and bias questions — Cortex/AI
  moments must stay FERPA-safe and CFO-safe. Flag as an early design constraint
  for Agents 12/21.

## 4. Incumbent complementarity (not displacement)

- **Incumbents (`HYPOTHESIS`, `VERIFY`):** EAB Navigate/Navigate+, Civitas
  Learning, Ellucian Illuminate (student success/analytics); Banner/Colleague/
  PeopleSoft/Workday (SIS), Canvas/Blackboard (LMS), Starfish, Slate/Salesforce.
- **Recommended posture (from strategy):** position StudentIQX as the **unifying,
  governed intelligence layer beneath/across point tools on the customer's own
  Snowflake** — complement, not rip-and-replace. Agents 10 and 16 own this;
  Agent 19 (red team) must stress-test it. **Decision to watch:** "no entrenched
  competitor under contract" is cited as an ICP signal — verify per-competitor
  displacement posture before committing messaging.

## 5. Sigma surface fit for advisor / enrollment workflows

- The **advisor early-warning** and **enrollment yield/melt** workflows are
  strong Sigma candidates: cohort tables, drill-downs, controls, and an
  activation surface (outreach list) that traces to `MART_SIGMA` + `ACTIVATION`.
- **Beta constraint:** true "take action" affordances (buttons, input tables,
  action sequences, modals, tabs, forms) are **not** workbook-as-code supported —
  they must live in the feasibility matrix as `Requires manual Sigma build`/
  approximate, never emitted as generated workbook YAML. Agents 21/23 enforce
  this; the `feasibility-matrix.yaml` stub is ready to be replaced.
- **Decision to watch:** the AI-assisted activation moment (Cortex) should be
  designed as a Sigma-approximate pattern (table + governed request/output
  table) rather than an unsupported one-click action.

## 6. Open VERIFY / decisions carried forward

(Also seeded in `EVIDENCE-LEDGER.md` and logged in `OFFERING-DECISIONS.md` #1.)

1. **Source-naming drift** — StudentIQX vs StudentIQ / SIQ / Student360 (E-001).
   Standardize on **StudentIQX**; confirm no external-facing artifact uses the
   others.
2. **ICP enrollment-band conflict** — 2,000–15,000 (ICP section) vs 3,000–15,000
   (TAM Core) (E-007). **Do not silently pick one** (Agent 11).
3. **Unsourced TAM figures** — ~3,927 universe; band counts (~110/260/1,050/
   1,100); tiers (~1,050 / 1,400–1,800 / 2,325 / 1,600). Verify vs Carnegie 2025
   + IPEDS (E-004/005/006).
4. **Tech scope** — confirm Coalesce and generic "Snowflake Intelligence" remain
   ADJACENT/`VERIFY` vs canonical (canonical = Snowflake + Sigma + Cortex) (E-009).
5. **Verndale relationships** — nature/strength of Harvard GSE + Quinnipiac
   (E-012); these are the only known beachheads.
6. **Named pillars/agents** — whether the 4 pillars + 8 agentic workflows survive
   research or are premature (E-010).
7. **Whole problem thesis** — per the user's explicit mandate, treat the entire
   fragmentation/pain framing as a hypothesis to validate, not proven truth.

## 7. Agent-army adequacy notes (no changes made)

- **No agent added or removed.** The fixed army covers higher ed.
- **Web-research load is front-heavy** (Agents 1, 7, 9, 11, 14, 16) and directly
  tied to the open ICP/TAM/thesis questions — budget real research time; Agent 27
  finalizes.
- **ICP is a first-class research deliverable**, not a scaffolding assumption —
  Agents 8/11 and the Stage-5 sales-learning loop (Agent 25) are the mechanisms
  that will actually settle it.
- **Stage 4 tier1 bias** (Agents 21–23) is important here because FERPA + Sigma
  beta constraints punish shortcuts.
