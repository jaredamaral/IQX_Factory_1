# OFFERING-DECISIONS — StudentIQX

Append-only log of strategic decisions and human gate approvals. Newest at top.
Every gate decision from `iqx-gate-review` is recorded here AND mirrored in
`manifest.yaml`.

---

## Decision #5 — Gate 1 override (proceed to Stage 2 despite Revise recommendation)
- **Date:** 2026-07-08
- **Gate:** gate-1
- **Decision:** **Override Revise** — proceed to Stage 2. Agent 8 recommended Revise,
  citing unresolved EAB differentiation (E-058) and unknown budget holder (E-029)
  as gate-blocking. User overrides: proceed to Stage 2. All seven candidate
  wedges (Agent 2's five plus Agent 4's Continuing Retention and Transfer Entry)
  are retained as a market-entry/use-case inventory, not narrowed to one.
  Melt-to-Matriculation Activation Accelerator is designated the build and demo
  spine because it is the most concretely defined and highest-value entry point,
  not because the other wedges are eliminated.
- **Rationale:** Prototype-driven validation (build, show to Harvard GSE and
  Quinnipiac, iterate) is faster than pre-build discovery conversations. EAB
  differentiation and the budget-holder question will be tested against a working
  prototype rather than resolved before building it.
- **Carry-forward, not resolved:** EAB/incumbent differentiation (E-058), budget
  holder (E-029). Both remain open sales-learning risks, not build blockers.
- **Decided by:** Jared Amaral
- **Affected artifacts:** `manifest.yaml`, `EVIDENCE-LEDGER.md`, Stage 2 agents

---

## Decision #4 — User intake: Stage 1 strategic context (2026-07-07)
- **Date:** 2026-07-07
- **Gate:** none
- **Decision:** Recorded user-provided answers to open Stage 1 risks and commercial
  posture. Key points:
  1. **IQX complement doctrine (USER-PROVIDED):** Verndale expects StudentIQX — like
     all IQX offerings — as a separate **governed layer** (Student 360,
     intelligence/insights, AI-enabled activation) **alongside** Slate, Salesforce,
     SIS/LMS, and domain platforms. Reinforces Decision #2.
  2. **Relationships:** No near-term discovery on Harvard GSE / Quinnipiac; **proceed
     anyway** and treat relationship validation as opportunistic (E-012, E-034).
  3. **Budget holder:** **Unknown**; must be discovered through market-facing
     conversations (E-029 remains open).
  4. **School/college autonomy (USER-PROVIDED):** Within large universities, schools
     or colleges (e.g., Harvard GSE vs HBS vs Law) may operate like distinct
     businesses — different systems, processes, roles/JTBD on the **business side**.
     Whether **technology** is similarly decentralized is **unclear** (university
     infra vs school-level application support is `GATING HYPOTHESIS`). **Public**
     institutions tend toward more board-level technology governance and slower
     cycles; **private** institutions tend toward less bureaucracy (`HYPOTHESIS`,
     advisor-sourced, `VERIFY`). Small liberal arts colleges may have fewer buying
     layers (`HYPOTHESIS`, advisor-sourced, `VERIFY`) — candidate ICP signal, not
     settled ICP.
  5. **Metric definitions (USER-PROVIDED design principle):** Conflicting KPI
     definitions across units are **expected**, not a flaw to eliminate. StudentIQX
     is a **platform with reusable components**, not plug-and-play; it must support
     institution- and school-specific metric and process definitions (semantic/governance
     layer — Agents 6, 13).
  6. **Proof gap:** No Verndale higher-ed analytics case studies available now
     (E-012 area); proof must be built.
  7. **First-customer commercial posture (USER-PROVIDED):** Verndale willing to
     **co-invest** in POC, data-readiness discovery, or similar to win first customer.
  8. **Partners (USER-PROVIDED):** Snowflake and Sigma are aware; support is
     **opportunistic**, not a dedicated co-sell motion.
  9. **Wedge instinct (USER-PROVIDED, `HYPOTHESIS`):** First motion = **pre-enrollment /
     enrollment through matriculation**, coupled with **first-year / general
     retention**. Agent 8 validates against failed-Student-360 entry signal (E-011).
- **Decided by:** Jared Amaral
- **Affected artifacts:** `AGENTS.md`, `EVIDENCE-LEDGER.md` (E-036–E-044), Agents 4–8

---

## Decision #3 — Agent 3 informal gate override (proceed to Agent 4)
- **Date:** 2026-07-07
- **Gate:** none (informal Agent 3 checkpoint — not Gate 1)
- **Decision:** **Override Revise Before Go** — proceed to Agent 4 (`constituent-journey-mapper`) and continue Stage 1 Agents 4–8.
- **Rationale:** Agent 3 assessed strategic fitness as worth continuing but flagged open `GATING VERIFY` items (incumbent complement acceptance, relationship access, buying dynamics, metric governance, FERPA/AI). Positioning is locked in Decision #2. Remaining items are research objectives for Agents 4–8 and Gate 1, not preconditions requiring user answers now.
- **Carry-forward (must not be treated as resolved):**
  - Incumbent redundancy / complement market acceptance (E-008, E-023/E-028, E-035)
  - Harvard GSE / Quinnipiac relationship strength and access (E-012, E-034)
  - Finance budget role (E-029), campus vs system buying (E-030), metric definitions (E-031), FERPA/AI (E-021)
  - ICP unsettled (standing constraint in `AGENTS.md`, E-007)
- **Decided by:** Jared Amaral
- **Affected artifacts:** `manifest.yaml` (Agent 4 may run); Agents 4–8 outputs; Gate 1 decision after Agent 8

---

## Decision #2 — Pre-run positioning locks (Stage 1)
- **Date:** 2026-07-07
- **Gate:** none (pre–Stage 1 requirement; locked after Agents 1–3 exposed recurring provisional defaults)
- **Decision:** Locked two positioning calls that every Stage 1 agent had been silently defaulting:
  1. **Complement vs replacement:** StudentIQX is a **complementary governed
     intelligence layer** that sits **alongside** SIS, CRM, LMS, and domain
     platforms (EAB, Civitas, Slate, Ellucian, Salesforce, Starfish, etc.). It
     does **not** replace those systems in canonical scope.
  2. **Surface scope and Activate layer:** The canonical prototype and offering
     experience are **staff-facing** and include all three IQX architecture
     layers: **Unify, Intelligence, and Activate**. "Staff-facing" must not be
     read narrowly as dashboards that staff inspect before acting somewhere
     else. The Activate layer is in scope when it is **staff-initiated** and
     **human-reviewed** inside the governed Sigma/Snowflake experience: assigning
     specific constituents to specific staff owners, tracking intervention
     status, and logging outcomes back to the originating cohort, score, segment,
     or workflow. **Student-facing self-service** is **out of scope** unless
     explicitly unlocked in a future decision. **Unreviewed or autonomous
     action** is also out of scope.
  3. **Reference activation pattern:** For melt risk, StudentIQX may score incoming
     students with reason codes; an enrollment leader decides whether and how to
     intervene; StudentIQX, using an integrated LLM, drafts channel-appropriate
     content such as email copy or call talktracks; a human must approve or edit
     that content before any payload leaves StudentIQX; StudentIQX tracks the
     intervention decision and status; StudentIQX later ingests a matriculation
     outcome feed to close the loop. StudentIQX may push an execution payload to
     the CRM or marketing platform, but it does **not** send the email or place
     the call itself.
  4. **Activation rules:** Contact, consent, and suppression data are read-only
     contact intelligence in StudentIQX; the CRM or marketing platform remains
     the enforcement point. Peer-to-peer outreach is out of scope for StudentIQX
     native activation because peers are not staff users; peer interventions may
     be visible only as externally sourced intervention/outcome records. Outcome
     reporting is correlational only and must not claim an intervention caused,
     improved, or drove an outcome without a controlled-comparison caveat. Full
     bidirectional payload completeness, including how much contact/outcome
     history StudentIQX pushes back to CRM, is deferred for Agent 13 and must not
     be decided prematurely.
- **Rationale:** Three consecutive agent runs (1–3) flagged both items as
  unresolved despite converging on the same defaults. Locking removes re-derivation
  noise; Agent 8/10/16 still validate market acceptance of the complementary,
  staff-facing posture and whether buyers value in-product activation/workflow
  tracking versus keeping action in incumbent CRM, advising, or case-management
  tools.
- **Decided by:** user (via Claude governance review → Cursor hardening)
- **Affected artifacts:** `AGENTS.md`, `EVIDENCE-LEDGER.md` (E-032, E-035),
  Agents 4–8 prompts, downstream GTM/prototype agents

---

## Decision #1 — Offering scaffold created
- **Date:** 2026-07-02
- **Type:** Scaffold (Step 2)
- **Decision:** Created `offerings/StudentIQX/` from Blueprint v1.2 + addendum
  v1.3-cursor with 27 agents, the 10-file knowledge pack, manifest, and
  prototype dirs. Built **fresh** from the Blueprint + `shared-templates/` +
  intake context (Rule 1 — not seeded from any other offering).
- **Industry context captured:** see `AGENTS.md` Section 2 (labeled). Higher
  education / student lifecycle intelligence.
- **Confirmed intake decisions baked in:**
  1. **Canonical product name = `StudentIQX`.** Source material drifts to
     "StudentIQ", "SIQ", "Student360"; standardize on StudentIQX and flag the
     drift as a `VERIFY` item.
  2. **Technology scope (canonical prototype):** Sigma = user/experience layer,
     Snowflake = data layer, Snowflake Cortex = AI toolkit (in scope). Coalesce
     and generic "Snowflake Intelligence" from source = ADJACENT/`VERIFY`, NOT
     canonical. Aligns with the always-on Sigma-first / Snowflake-backed doctrine.
  3. **ICP / segmentation stance:** the Confluence ICP + TAM + segmentation is a
     strong **HYPOTHESIS to validate via research — NOT settled truth.** The user
     explicitly does not yet know how to segment the market or where StudentIQX
     resonates most; defining the ICP is an explicit research goal of this
     offering.
- **Decided by:** user ("Proceed with scaffold").
- **Notes:** Open `VERIFY` items carried into `EVIDENCE-LEDGER.md` and
  `gap-check-report.md` (naming drift; ICP enrollment-band conflict 2,000–15,000
  vs 3,000–15,000; unsourced TAM figures; Coalesce/"Snowflake Intelligence"
  scope; Harvard GSE + Quinnipiac relationship strength; survival of the 8
  named agents/4 pillars; whether the whole problem thesis holds under research).
  No agents have run yet. Stage 1 active; all five gates pending.

<!--
Template for future entries:

## Decision #N — <title>
- **Date:** <YYYY-MM-DD>
- **Gate:** <gate-N | none>
- **Decision:** <approve | revise | kill | hold> — <summary>
- **Rationale:** <why>
- **Decided by:** <user>
- **Affected artifacts:** <files>
-->
