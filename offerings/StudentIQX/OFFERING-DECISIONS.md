# OFFERING-DECISIONS — StudentIQX

Append-only log of strategic decisions and human gate approvals. Newest at top.
Every gate decision from `iqx-gate-review` is recorded here AND mirrored in
`manifest.yaml`.

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
     offering. `DO NOT ASSUME` an ICP is settled.
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
