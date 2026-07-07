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
| E-002 | Higher-ed student data is fragmented across siloed SIS/CRM/LMS/advising systems | VERIFY | SRC-1; intake HYPOTHESIS | low | 1,2,3,5,6,8 | 2026-07-02 |
| E-003 | FERPA is the anchor regulatory constraint for student data/analytics/AI | VERIFY | intake HYPOTHESIS | low | 9,12,13 | 2026-07-02 |
| E-004 | Carnegie 2025 universe ≈ 3,927 degree-granting institutions | VERIFY | SRC-2 (unsourced) | low | 11 | 2026-07-02 |
| E-005 | Enrollment-band counts (>30K ≈110; 15–30K ≈260; 3–15K ≈1,050; 1–3K ≈1,100) | VERIFY | SRC-2 (unsourced) | low | 11 | 2026-07-02 |
| E-006 | TAM tiers: Core ≈1,050; Serviceable ≈1,400–1,800; Full ≈2,325; Out ≈1,600 | VERIFY | SRC-2 (unsourced) | low | 11 | 2026-07-02 |
| E-007 | ICP enrollment band — CONFLICT: 2,000–15,000 (ICP section) vs 3,000–15,000 (TAM Core) | VERIFY | SRC-2 (internal conflict) | low | 11 | 2026-07-02 |
| E-008 | Named incumbents: EAB Navigate/Navigate+, Civitas Learning, Ellucian Illuminate; SIS/LMS/advising: Banner/Colleague/PeopleSoft/Workday/Canvas/Blackboard/Starfish | VERIFY | SRC-1/SRC-2 | low | 2,6,16 | 2026-07-02 |
| E-009 | Canonical tech = Snowflake + Sigma + Cortex; Coalesce & "Snowflake Intelligence" are ADJACENT/verify only | VERIFY | intake decision #2 | med | 3,12,13,15,21,22 | 2026-07-02 |
| E-010 | 4 functional pillars + 8 named agentic workflows (Yield Optimizer, Applicant Insights, Retention Risk, Attendance & Engagement, Donor Propensity, Alumni Segmentation, Data Quality Guardian, Privacy & Compliance) | VERIFY | SRC-1 | low | 2,12 | 2026-07-02 |
| E-011 | "Failed/stalled Student 360 / data-warehouse / student-success initiative" is the single strongest ICP signal | VERIFY | SRC-2 | low | 2,3,8,11,16 | 2026-07-02 |
| E-012 | Verndale relationships: Harvard GSE; some Quinnipiac contacts (strength unknown); existence of relationship is user-provided, but strength, sponsor level, and decision-maker access remain VERIFY | VERIFY | intake USER-PROVIDED; relationship strength not yet sourced | low | 3,8,10,11 | 2026-07-02 |
| E-013 | NCES counted 3,896 U.S. degree-granting postsecondary institutions in 2022-23, including 1,599 public, 1,614 private nonprofit, and 683 private for-profit institutions | VERIFY | NCES Digest Table 317.10: https://nces.ed.gov/programs/digest/d23/tables/dt23_317.10.asp | med | 1,2,8,11 | 2026-07-04 |
| E-014 | Total fall enrollment in degree-granting postsecondary institutions peaked above 21.0M in 2010 and was 18.58M in 2022; NCES projected growth from 2023 onward | VERIFY | NCES Digest Table 303.10: https://nces.ed.gov/programs/digest/d23/tables/dt23_303.10.asp | med | 1,2,8,11,14 | 2026-07-04 |
| E-015 | NSC estimated spring 2025 total postsecondary enrollment up 3.2% YoY and undergraduate enrollment up 3.5% to 15.3M, still 2.4% below spring 2020 | VERIFY | National Student Clearinghouse Current Term Enrollment Estimates: https://nscresearchcenter.org/current-term-enrollment-estimates/ | med | 1,2,8,11,14 | 2026-07-04 |
| E-016 | WICHE projects U.S. high-school graduates peak in 2025 and then decline steadily through 2041, with a 13% decline from peak to projection end | VERIFY | WICHE Knocking at the College Door: https://www.wiche.edu/knocking/ | med | 1,2,8,11,14 | 2026-07-04 |
| E-017 | NCES reports a 64.6% six-year graduation rate for the 2016 first-time, full-time bachelor's degree-seeking cohort at 4-year institutions, with material variation by race/ethnicity and institution profile | VERIFY | NCES Digest Table 326.10: https://nces.ed.gov/programs/digest/d23/tables/dt23_326.10.asp | med | 1,5,7,8,14 | 2026-07-04 |
| E-018 | NCES reports 76.7% first-year retention for full-time first-time degree-seeking undergraduates from 2021 to 2022 across all institutions; 4-year institutions were 81.0% | VERIFY | NCES Digest Table 326.30: https://nces.ed.gov/programs/digest/d23/tables/dt23_326.30.asp | med | 1,5,7,8,14 | 2026-07-04 |
| E-019 | NCES reports 2022-23 average total cost of attendance for first-time, full-time undergraduates living on campus at 4-year institutions of $27.1K public, $58.6K private nonprofit, and $33.6K private for-profit | VERIFY | NCES COE Price of Attending an Undergraduate Institution: https://nces.ed.gov/programs/coe/indicator/cua/price-of-attending-an-undergraduate-institution | med | 1,2,8,11,14 | 2026-07-04 |
| E-020 | Gallup's 2024 survey found U.S. adults nearly evenly divided on confidence in higher education: 36% high confidence, 32% some confidence, and 32% little/no confidence | VERIFY | Gallup: https://news.gallup.com/poll/646880/confidence-higher-education-closely-divided.aspx | med | 1,2,8,11,16 | 2026-07-04 |
| E-021 | FERPA applies to educational agencies/institutions receiving U.S. Department of Education funds; education records are directly related to a student and maintained by the institution or party acting for it, and PII is defined broadly | VERIFY | U.S. Department of Education FERPA regulations: https://studentprivacy.ed.gov/ferpa | med | 1,2,3,5,9,12,13,21,23 | 2026-07-04 |
| E-022 | EDUCAUSE's 2024 Top 10 frames technology, data, and workforce as contributors to institutional resilience, including financial resilience and decision support | VERIFY | EDUCAUSE 2024 Top 10: https://www.educause.edu/research-and-publications/research/top-10-it-issues-technologies-and-trends/2024 | med | 1,3,10,15 | 2026-07-04 |
| E-023 | EAB Navigate360 positions itself as a higher-ed CRM spanning recruitment, retention, student/alumni engagement, reporting/analytics, predictive models, staff/student AI, and integrations with SIS/LMS/Common App/custom data; EAB claims 850+ partner institutions | VERIFY | EAB Navigate360: https://eab.com/solutions/navigate360/ | med | 1,2,3,6,8,16 | 2026-07-06 |
| E-024 | Civitas Learning positions its platform as unifying student data, analytics, and workflows, with predictive analytics, AI recommendations, unified student profiles, shared notes, academic alerts, and connected workflows | VERIFY | Civitas Learning: https://www.civitaslearning.com/ | med | 1,2,3,6,8,16 | 2026-07-06 |
| E-025 | Technolutions Slate positions Slate as a unified interface for admissions, student success, and advancement and claims 2,000+ colleges and universities use it | VERIFY | Technolutions Slate: https://technolutions.com/ | med | 1,2,3,6,8,16 | 2026-07-06 |
| E-026 | Ellucian Student positions its SIS as uniting administrative processes, improving data accuracy, supporting learner success from enrollment through graduation, eliminating data silos, providing real-time data, compliance controls, and AI across solutions | VERIFY | Ellucian Student: https://www.ellucian.com/products/student | med | 1,2,3,6,8,16 | 2026-07-06 |
| E-027 | WICHE projects 38 states will see high-school graduate declines by 2041 compared with 2023; the Midwest and Northeast have already experienced declines, the South grows before a late slight decline, and the West more closely mirrors national projections | VERIFY | WICHE Knocking at the College Door: https://www.wiche.edu/knocking/ | med | 1,2,8,11 | 2026-07-06 |
| E-028 | Salesforce positions Education Cloud around connected education journeys across recruitment/admissions, academic operations, student success, advancement/alumni relations, communications/engagement, and lifelong learning | VERIFY | Salesforce Education: https://www.salesforce.com/education/ | med | 1,2,3,6,8,16 | 2026-07-06 |
| E-029 | Budget holder for StudentIQX wedges is unknown at intake; Finance/CFO may be sponsor, approver, veto, or passive — must be discovered through market conversations | VERIFY | USER-PROVIDED intake 2026-07-07; Agent 2 synthesis | med | 2,3,4,5,8,11,14,17 | 2026-07-07 |
| E-030 | Buying authority varies by institution structure: multi-campus systems, university systems, schools/colleges (which may operate as distinct businesses), extension units, and online divisions; school-level vs university-level technology governance is unclear | VERIFY | USER-PROVIDED intake 2026-07-07; Agent 2 synthesis | med | 2,3,4,5,8,11,15,20 | 2026-07-07 |
| E-031 | KPI names (enrollment, yield, melt, persistence, retention, etc.) will conflict across offices and schools; StudentIQX must support institution-specific definitions via governed semantic layer — conflict is expected, not a defect | VERIFY | USER-PROVIDED design principle 2026-07-07; Agent 2 synthesis | med | 2,3,4,5,6,8,13,21 | 2026-07-07 |
| E-032 | Canonical prototype scope is staff-facing operational intelligence; student-facing self-service is out of scope unless unlocked in OFFERING-DECISIONS | LOCKED | OFFERING-DECISIONS.md Decision #2 | high | 4,5,8,10,12,21 | 2026-07-07 |
| E-033 | Context-label vocabulary is fixed to five inline tags (USER-PROVIDED, HYPOTHESIS, VERIFY, GATING VERIFY, GATING HYPOTHESIS); agents must not invent new inline labels | LOCKED | factory/IQX_AGENT_BLUEPRINT.md §3.3; BLUEPRINT-ADDENDUM §11 | high | all | 2026-07-07 |
| E-035 | StudentIQX is positioned as a complementary governed intelligence layer alongside SIS/CRM/LMS and domain platforms, not a replacement | LOCKED | OFFERING-DECISIONS.md Decision #2 | high | 2,3,4,5,8,10,16 | 2026-07-07 |
| E-034 | Harvard GSE is a school/college-level unit inside a large research university (distinct business processes from other schools); Quinnipiac likely maps to private nonprofit / mid-sized pattern; relationship access unverified; no near-term discovery planned | VERIFY | USER-PROVIDED intake 2026-07-07; Agent 3 synthesis | med | 3,4,8,10,11 | 2026-07-07 |
| E-036 | Verndale expects all IQX offerings to be a governed Student/customer 360 + intelligence + activation layer alongside SIS/CRM/LMS — not replacement | LOCKED | USER-PROVIDED; OFFERING-DECISIONS.md Decision #2, #4 | high | all | 2026-07-07 |
| E-037 | Within large universities, schools/colleges may operate as distinct businesses (systems, processes, JTBD) even when under one brand | VERIFY | USER-PROVIDED intake 2026-07-07 | med | 4,5,6,8,11 | 2026-07-07 |
| E-038 | Technology services may be split: university-provided infrastructure vs school/college application support — extent unknown | VERIFY | USER-PROVIDED GATING HYPOTHESIS 2026-07-07 | med | 4,5,6,8,15 | 2026-07-07 |
| E-039 | Public universities may have slower, more board-governed technology buying; private institutions may have less bureaucratic layering | VERIFY | USER-PROVIDED HYPOTHESIS; advisor-sourced, not yet independently verified | low | 4,5,8,11,17 | 2026-07-07 |
| E-040 | Small liberal arts colleges may have fewer buying-decision layers — candidate ICP segment | VERIFY | USER-PROVIDED HYPOTHESIS; advisor-sourced | low | 5,8,11 | 2026-07-07 |
| E-041 | User wedge instinct: pre-enrollment/enrollment through matriculation + first-year/general retention as first motion | VERIFY | USER-PROVIDED HYPOTHESIS 2026-07-07; validate vs E-011 at Agent 8 | med | 4,5,8,12 | 2026-07-07 |
| E-042 | Verndale willing to co-invest in POC, data-readiness discovery, or similar to win first higher-ed customer | VERIFY | USER-PROVIDED intake 2026-07-07 | med | 8,14,17,20 | 2026-07-07 |
| E-043 | Snowflake and Sigma are aware of StudentIQX; partner support expected to be opportunistic, not dedicated co-sell | VERIFY | USER-PROVIDED intake 2026-07-07 | low | 8,10,16 | 2026-07-07 |
| E-044 | No Verndale higher-ed analytics case studies available at intake | VERIFY | USER-PROVIDED intake 2026-07-07 | med | 3,8,16,20 | 2026-07-07 |

## Consolidated open VERIFY / questions
- Source-naming drift: StudentIQX vs StudentIQ vs SIQ vs Student360 (E-001).
- ICP enrollment-band conflict: 2,000–15,000 vs 3,000–15,000 (E-007) — do NOT
  silently pick one.
- All TAM figures unsourced — verify vs Carnegie 2025 + IPEDS (E-004/005/006).
- Whether Coalesce and "Snowflake Intelligence" are canonical scope (E-009).
- Nature/strength of Harvard GSE and Quinnipiac relationships (E-012).
- Whether the 8 named agents / 4 pillars survive research (E-010).
- Whether StudentIQX is commercially viable as a complementary intelligence layer (market acceptance of E-035/E-036) — not whether complement is Verndale's intent.
- Budget holder unknown — discover in market (E-029).
- School/college autonomy and tech governance split (E-037, E-038); public vs private buying speed (E-039).
- Small liberal arts as ICP candidate (E-040) — hypothesis only.
- User wedge instinct: enrollment→matriculation + retention (E-041) vs failed-Student-360 signal (E-011) — Agent 8 reconciles.
- Metric definition conflict is expected; semantic flexibility required (E-031).
- First-customer co-invest posture (E-042); opportunistic Snowflake/Sigma partners (E-043).
- No higher-ed case studies (E-044).
- Staff-facing scope locked (E-032); complementary positioning locked (E-035, E-036).
- Context-label vocabulary locked to five inline tags (E-033).
- Harvard GSE / Quinnipiac: proceed without near-term discovery (E-034, E-012).
- Whether the entire problem thesis holds under research (per user's mandate).

## Status legend
- **VERIFY** — drafted / seeded, not yet sourced
- **CONFIRMED** — backed by a cited source the user accepted (Agent 27 only)
- **REJECTED** — could not be substantiated; must not appear in canonical artifacts
- **LOCKED** — governance or positioning decision recorded in OFFERING-DECISIONS.md
