# EVIDENCE-LEDGER — StudentIQX

No external claim enters a canonical artifact without a row here. Research-driven
agents (1, 7, 9, 11, 14, 16) add `VERIFY:` claims; the user researches and drops
sources into `research-inputs/`; Agent 27 (research-verifier) finalizes rows.

## Seeded source inputs (intake — UNVERIFIED)

The following Confluence pages were provided at intake as **source material to
consider wisely but NOT to assume as verified fact**. Validate and raise
inconsistencies before any downstream agent consumes them.

- **SRC-1** — "StudentIQX - Student360 Value Proposition", Confluence (Verndale
  space DAPR, page `6311804930`). Positions unified Data + Intelligence +
  Activation for higher ed; names 3 systems, 4 functional pillars, 8 agentic
  workflows, tech foundation (Snowflake/Coalesce/Sigma/Cortex & Intelligence),
  buyer profiles by function, trigger signals, and entry-point workshops.
  **Status: UNVERIFIED HYPOTHESIS.**
- **SRC-2** — "StudentIQX - The US Market", Confluence (Verndale space DAPR, page
  `6933020823`). TAM dimensions, enrollment-band TAM estimates, institution-type
  modifiers, win-probability overlay, segmentation lenses, ICP sweet spot, and
  named incumbents/competitors. **Status: UNVERIFIED HYPOTHESIS; TAM figures are
  unsourced estimates.**

## Ledger

| ID | Claim | Status | Source(s) | Confidence | Used by | Date |
|----|-------|--------|-----------|------------|---------|------|
| E-001 | Canonical product name is "StudentIQX"; source material drifts to "StudentIQ"/"SIQ"/"Student360" | VERIFY | intake; SRC-1/SRC-2 | med | naming/all | 2026-07-02 |
| E-002 | Higher-ed student data is fragmented across siloed SIS/CRM/LMS/advising systems | VERIFY | SRC-1; intake HYPOTHESIS | low | 1,5,6,8 | 2026-07-02 |
| E-003 | FERPA is the anchor regulatory constraint for student data/analytics/AI | VERIFY | intake HYPOTHESIS | low | 9,12,13 | 2026-07-02 |
| E-004 | Carnegie 2025 universe ≈ 3,927 degree-granting institutions | VERIFY | SRC-2 (unsourced) | low | 11 | 2026-07-02 |
| E-005 | Enrollment-band counts (>30K ≈110; 15–30K ≈260; 3–15K ≈1,050; 1–3K ≈1,100) | VERIFY | SRC-2 (unsourced) | low | 11 | 2026-07-02 |
| E-006 | TAM tiers: Core ≈1,050; Serviceable ≈1,400–1,800; Full ≈2,325; Out ≈1,600 | VERIFY | SRC-2 (unsourced) | low | 11 | 2026-07-02 |
| E-007 | ICP enrollment band — CONFLICT: 2,000–15,000 (ICP section) vs 3,000–15,000 (TAM Core) | VERIFY | SRC-2 (internal conflict) | low | 11 | 2026-07-02 |
| E-008 | Named incumbents: EAB Navigate/Navigate+, Civitas Learning, Ellucian Illuminate; SIS/LMS/advising: Banner/Colleague/PeopleSoft/Workday/Canvas/Blackboard/Starfish | VERIFY | SRC-1/SRC-2 | low | 6,16 | 2026-07-02 |
| E-009 | Canonical tech = Snowflake + Sigma + Cortex; Coalesce & "Snowflake Intelligence" are ADJACENT/verify only | VERIFY | intake decision #2 | med | 12,13,15,21,22 | 2026-07-02 |
| E-010 | 4 functional pillars + 8 named agentic workflows (Yield Optimizer, Applicant Insights, Retention Risk, Attendance & Engagement, Donor Propensity, Alumni Segmentation, Data Quality Guardian, Privacy & Compliance) | VERIFY | SRC-1 | low | 12 | 2026-07-02 |
| E-011 | "Failed/stalled Student 360 / data-warehouse / student-success initiative" is the single strongest ICP signal | VERIFY | SRC-2 | low | 8,11,16 | 2026-07-02 |
| E-012 | Verndale relationships: Harvard GSE; some Quinnipiac contacts (strength unknown) | VERIFY | intake USER-PROVIDED | low | 3,10,11 | 2026-07-02 |

## Consolidated open VERIFY / questions
- Source-naming drift: StudentIQX vs StudentIQ vs SIQ vs Student360 (E-001).
- ICP enrollment-band conflict: 2,000–15,000 vs 3,000–15,000 (E-007) — do NOT
  silently pick one.
- All TAM figures unsourced — verify vs Carnegie 2025 + IPEDS (E-004/005/006).
- Whether Coalesce and "Snowflake Intelligence" are canonical scope (E-009).
- Nature/strength of Harvard GSE and Quinnipiac relationships (E-012).
- Whether the 8 named agents / 4 pillars survive research (E-010).
- Whether the entire problem thesis holds under research (per user's mandate).

## Status legend
- **VERIFY** — drafted / seeded, not yet sourced
- **CONFIRMED** — backed by a cited source the user accepted
- **REJECTED** — could not be substantiated; must not appear in canonical artifacts
