# OFFERING-DECISIONS — StudentIQX

Append-only log of strategic decisions and human gate approvals. Newest at top.
Every gate decision from `iqx-gate-review` is recorded here AND mirrored in
`manifest.yaml`.

---

## Decision #2 — Pre-run positioning locks (Stage 1)
- **Date:** 2026-07-07
- **Gate:** none (pre–Stage 1 requirement; locked after Agents 1–3 exposed recurring provisional defaults)
- **Decision:** Locked two positioning calls that every Stage 1 agent had been silently defaulting:
  1. **Complement vs replacement:** StudentIQX is a **complementary governed
     intelligence layer** that sits **alongside** SIS, CRM, LMS, and domain
     platforms (EAB, Civitas, Slate, Ellucian, Salesforce, Starfish, etc.). It
     does **not** replace those systems in canonical scope.
  2. **Surface scope:** The canonical prototype and offering experience are
     **staff-facing** operational intelligence (enrollment, student success,
     advancement, IT/data users). **Student-facing self-service** is **out of
     scope** unless explicitly unlocked in a future decision.
- **Rationale:** Three consecutive agent runs (1–3) flagged both items as
  unresolved despite converging on the same defaults. Locking removes re-derivation
  noise; Agent 8/10/16 still validate market acceptance of the complementary,
  staff-facing posture.
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
