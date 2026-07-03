# StudentIQX — Agent Run Order

Canonical sequence from `factory/phases.yaml` and `manifest.yaml`. All **27 agents**, grouped by stage, with **human gates** inserted where they fire.

---

## Stage 1 — Commercial Scan

1. **industry-landscape-analyst** (tier1, web research)
2. **business-deep-dive-analyst** (tier1)
3. **strategic-fitness-assessor** (tier2) — *informal go/no-go; you may kill before proceeding*
4. **constituent-journey-mapper** (tier2)
5. **persona-and-pain-analyst** (tier2)
6. **systems-and-data-analyst** (tier2) — *can run in parallel with #5*
7. **industry-evidence-researcher** (tier1, web research)
8. **commercial-wedge-validator** (tier1)

**GATE 1 — Proceed / Revise / Kill** (after `commercial-wedge-validator` → logged to `OFFERING-DECISIONS.md`)

---

## Stage 2 — Offering Spine

9. **regulatory-compliance-researcher** (tier1, web research)
10. **strategy-alignment-analyst** (tier1)
11. **market-and-icp-analyst** (tier1, web research) — *can run in parallel with #12*
12. **use-case-architect** (tier1)
13. **customer-360-data-modeler** (tier1)
14. **value-case-modeler** (tier1, web research) — *can run in parallel with #13*
15. **delivery-architecture-and-implementation-planner** (tier2)

**GATE 2 — Approve Offering Brief** (after `delivery-architecture-and-implementation-planner` → writes `OFFERING-BRIEF.md`)

---

## Stage 3 — GTM and Sales Enablement

16. **competitive-positioning-analyst** (tier1, web research)
17. **packaging-pricing-and-delivery-modeler** (tier2)
18. **sales-objection-architect** (tier2) — *can run in parallel with #17*
19. **red-team-commercial-skeptic** (tier1)
20. **gtm-collateral-generator** (tier1)

**GATE 3 — Approve Sales Readiness** (after `gtm-collateral-generator` → logged to `OFFERING-DECISIONS.md`)

---

## Stage 4 — Prototype *(bias to tier1)*

21. **prototype-experience-spec-builder** (tier1, builder)
22. **synthetic-data-generator** (tier2, run tier1 if available)
23. **launch-readiness-assessor** (tier2, run tier1 if available)

**GATE 4 — Launch Readiness Review** (after `launch-readiness-assessor` → logged to `OFFERING-DECISIONS.md`)

---

## Stage 5 — Learning Loop *(on demand / scheduled, not strictly sequential)*

24. **slack-intake-monitor** (tier3)
25. **sales-learning-synthesizer** (tier2)
26. **offering-updater** (tier2)
27. **research-verifier** (tier3)

**GATE 5 — Approve Changes Into Canonical Offering**, with two sub-gates:

- **5a — Inbox triage:** Review `UPDATES-INBOX.md`; trigger `offering-updater` or defer/reject.
- **5b — PROPOSED diff review:** Review `PROPOSED/` diff; approve (move to live + commit + `UPDATES-LOG`) or reject.

---

## Notes

- **Gates 1–4 are hard gates:** Agents in the next stage declare `gate_required`, so the stage runner won't advance past them until you approve. Agent 3 also has a soft kill checkpoint.
- **Web-research agents** (1, 7, 9, 11, 14, 16) emit drafts with `VERIFY:` flags; you do the external research, drop results into `research-inputs/`, and Agent 27 (`research-verifier`) finalizes `EVIDENCE-LEDGER.md`.
- **Stage 5** is the ongoing loop — triggered on demand rather than run in strict order like 1–23.
