# StudentIQX Agent 2 — Business Deep-Dive Profile

Agent: `business-deep-dive-analyst`  
Stage: 1 — Commercial Scan  
Run date: 2026-07-06  
Status: Agent 2 complete; all external claims remain `VERIFY` until Agent 27 finalizes evidence.

## Executive Read

`HYPOTHESIS`: Higher education should be modeled as one institution-level business with several office-level operating lines, not as a single monolithic buyer. The most commercially relevant "LOBs" for StudentIQX are Admissions & Enrollment, Student Success & Retention, Advancement & Alumni, and IT / Data / Compliance.

`USER-PROVIDED`: The student lifecycle is recruiting / pre-enrollment -> application -> enrollment -> active student -> graduation -> alumni community membership.

`VERIFY(E-013/E-014/E-015/E-016/E-017/E-018/E-019/E-020)`: The operating context is pressure-heavy but uneven: a broad U.S. institution universe, enrollment volatility, demographic decline by region, completion/retention gaps, cost pressure, and public-confidence pressure. Agent 2 uses these as landscape inputs, not as finalized claims.

`GATING HYPOTHESIS`: StudentIQX only has a credible business profile if it can sit across office-owned systems as a complementary governed intelligence layer (locked in Decision #2, E-035). If the buyer expects incumbents or internal BI to fully solve cross-lifecycle intelligence natively, the business case weakens materially.

`VERIFY(E-029/E-030/E-031)`: Three operating-model risks need explicit downstream handling: Finance/CFO as budget/veto node, multi-campus system-level buying variation, and shared KPI definition conflicts across offices. Staff-facing scope is locked (E-032, Decision #2).

## Business Model Segments

| Segment | Context label | Business model / operating logic | StudentIQX implications |
|---|---|---|---|
| Public four-year / regional public universities | `HYPOTHESIS` + `VERIFY(E-016/E-027)` | Balance state funding, tuition, enrollment mix, program demand, retention, and public mission. Regional pressure can make yield and persistence more urgent. | Strong fit when enrollment, student success, finance, and IT need a shared view of pipeline, retention risk, and program economics. |
| Private nonprofit colleges | `HYPOTHESIS` + `VERIFY(E-019/E-020)` | Often tuition-dependent with reputation, discounting, retention, and advancement pressure. | Strong fit when net tuition, student experience, and alumni engagement need unified intelligence. |
| Community colleges / public two-year institutions | `HYPOTHESIS` + `VERIFY(E-015)` | Open access, transfer pathways, workforce credentials, adult learners, and persistence support. | Fit depends on budget and implementation capacity; strongest use cases are persistence, transfer, workforce program outcomes, and adult learner re-entry. |
| Large research universities / systems | `HYPOTHESIS` | Complex multi-school, multi-campus, graduate/professional, research, and advancement operations. | High data complexity, but internal data maturity may compete with external-offering value. Needs clear Snowflake/Sigma complement story. |
| Online, extension, and continuing education units | `HYPOTHESIS` | Nontraditional learners, stop-out/re-entry, part-time pacing, employer/workforce relevance, and direct marketing motions. | Strong fit where CRM, LMS, SIS, advising, and outcomes data need to be joined around adult learner conversion and persistence. |

## Provisional LOB / Wedge Priority

This ranking is a `HYPOTHESIS`, not a Stage 1 decision. It synthesizes the LOB relevance statements so downstream agents do not have to infer priority from scattered prose.

| Rank | Candidate wedge | Why it ranks here | Kill-risk / validation need |
|---|---|---|---|
| 1 | Enrollment yield / melt / program-demand intelligence | Most direct revenue line, likely executive urgency, clear buyer candidates, and strong fit with enrollment volatility / regional demographic pressure. | Must prove StudentIQX complements CRM platforms like Slate, Salesforce, and EAB rather than duplicating them. |
| 2 | Student Success / retention / advising prioritization | Strong mission fit and measurable student/outcome pressure; data fragmentation across SIS, LMS, advising, aid, and support workflows is plausible. | Slower buying committee, FERPA / explainability burden, and incumbent overlap with EAB, Civitas, Ellucian, and internal IR/analytics. |
| 3 | Executive Student 360 recovery motion | Best fit when a failed or stalled student-data initiative creates cross-office pain and IT/Data sponsorship. | Requires named executive sponsor and strong evidence that the institution wants a governed Snowflake/Sigma layer. |
| 4 | Advancement / alumni intelligence | Useful lifecycle expansion and potentially strong LTV case. | Less likely first wedge unless advancement is already funding a data initiative or Verndale has relationship access. |
| 5 | IT/Data platform health as standalone entry | Necessary enabler and possible diagnostic wedge. | Risk of becoming generic data-platform consulting unless tied to Enrollment or Student Success outcomes. |

## LOB 1: Admissions & Enrollment

### Constituents

- `USER-PROVIDED`: Prospect, applicant, admit, deposited student, enrolled/matriculated student.
- `HYPOTHESIS`: Additional operational segments include inquiry source, intended program, geography, financial-aid need, transfer status, first-generation status, adult learner status, international status, and online/hybrid interest.

### Operating Workflows

- `HYPOTHESIS`: Demand generation and inquiry capture across web, events, search, campaigns, partner/referral channels, high-school outreach, and transfer pipelines.
- `HYPOTHESIS`: Application management from inquiry -> applicant -> completed application -> admit/deny/waitlist.
- `HYPOTHESIS`: Financial-aid and scholarship coordination, including discounting strategy for tuition-dependent institutions.
- `HYPOTHESIS`: Yield management from admit -> deposit -> orientation -> matriculation.
- `HYPOTHESIS`: Melt prevention between deposit and census/enrollment confirmation.
- `HYPOTHESIS`: Program demand and capacity planning with academic units.

### KPIs And Metrics

- `HYPOTHESIS`: Inquiry volume, inquiry-to-application conversion, application completion rate, admit rate, yield rate, deposit rate, melt rate, enrollment by program, net tuition revenue, discount rate, cost per enrolled student, channel/source performance, FAFSA/aid completion rate, transfer conversion, and census enrollment.
- `VERIFY(E-014/E-015/E-016/E-027)`: Enrollment volatility and regional high-school graduate trends make these metrics commercially relevant, but Agent 7/11 should validate benchmark ranges and institution-segment differences.

### Systems And Data

- `VERIFY(E-023/E-025/E-028)`: EAB Navigate360, Slate, and Salesforce all claim education CRM or lifecycle engagement capabilities. These are likely incumbent systems or competitor surfaces in enrollment contexts.
- `HYPOTHESIS`: Common source systems include admissions CRM, application platform, SIS, financial-aid system, marketing automation, event systems, Common App/imports, web analytics, call/SMS/email engagement, and data warehouse/BI.

### Roles, Buyers, And Users

- `HYPOTHESIS`: Economic buyer may be VP Enrollment Management, Director of Admissions, CFO, president, or provost depending on urgency and spend.
- `HYPOTHESIS`: Daily users include enrollment operations, admissions counselors, marketing/recruitment staff, financial-aid partners, enrollment analytics/IR, and program leaders.
- `HYPOTHESIS`: IT/Data is usually a co-buyer or implementation gatekeeper when cross-system data integration, privacy, or Snowflake/Sigma access is required.

### StudentIQX Relevance

`HYPOTHESIS`: Enrollment is the fastest likely entry motion because it connects directly to revenue, urgency, and executive visibility. The wedge should be yield/melt/program-demand intelligence rather than "replace your CRM."

## LOB 2: Student Success & Retention

### Constituents

- `USER-PROVIDED`: Active student, at-risk student, stop-out, continuing student, graduate.
- `HYPOTHESIS`: Additional operational segments include first-year students, transfer students, online learners, adult learners, commuter students, residential students, Pell-eligible / financial-need students, first-generation students, students with holds, and students in gateway courses.

### Operating Workflows

- `HYPOTHESIS`: Advising caseload management and appointment prioritization.
- `HYPOTHESIS`: Early alert based on LMS engagement, grades, attendance/participation, registration behavior, financial holds, advising notes, and support-service usage.
- `HYPOTHESIS`: Academic progress tracking, degree audit coordination, course registration monitoring, and time-to-degree support.
- `HYPOTHESIS`: Intervention planning: outreach, referral, coaching, financial-aid escalation, tutoring, academic support, and follow-up logging.
- `HYPOTHESIS`: Term-to-term persistence review, stop-out prevention, and re-enrollment campaigns.

### KPIs And Metrics

- `VERIFY(E-017/E-018)`: Graduation and retention rates are externally documented pressure points; Agent 7 should build the proof-point library around segment-specific rates and financial impact.
- `HYPOTHESIS`: Key operating metrics include persistence, retention, graduation rate, credits attempted/earned, DFW rate, gateway-course completion, advising appointment attendance, holds resolved, registration completion, financial balance/aid completion, LMS engagement, intervention response, re-enrollment, time-to-degree, and student success caseload load.

### Systems And Data

- `VERIFY(E-023/E-024/E-026)`: EAB Navigate360, Civitas Learning, and Ellucian Student all claim student-success, analytics, or learner-success capabilities that overlap with StudentIQX.
- `HYPOTHESIS`: Common source systems include SIS, LMS, advising/case management, early-alert platform, degree audit, financial-aid, registrar, student conduct/care, tutoring/support systems, housing, and BI/IR data stores.

### Roles, Buyers, And Users

- `HYPOTHESIS`: Economic buyer may be provost, VP Student Success, Dean of Students, VP Academic Affairs, or CFO/president when retention has visible financial consequence.
- `HYPOTHESIS`: Daily users include academic advisors, success coaches, faculty advisors, early-alert coordinators, deans, student affairs teams, IR/analytics, and program chairs.
- `VERIFY(E-021)`: FERPA and PII constraints make IT/Data/Compliance a required co-buyer for any student-level risk or intervention workflow.

### StudentIQX Relevance

`HYPOTHESIS`: Student Success is likely the strongest mission-aligned use case but may be slower to buy than enrollment. The risk-scoring story must be explainable, auditable, and human-in-the-loop; StudentIQX should support staff-facing prioritization and intervention measurement rather than magical AI automation.

## LOB 3: Advancement & Alumni

### Constituents

- `USER-PROVIDED`: Graduate, alumnus, alumni community member, donor.
- `HYPOTHESIS`: Additional segments include recent graduates, engaged alumni, event attendees, annual fund donors, major-gift prospects, lapsed donors, parents/families, corporate/employer partners, and affinity/program cohorts.

### Operating Workflows

- `HYPOTHESIS`: Alumni engagement, event planning, segmentation, annual giving campaigns, major-gift portfolio management, donor research, stewardship, and campaign reporting.
- `HYPOTHESIS`: Handoff from student lifecycle to alumni record, including student engagement, academic/program affiliation, career outcomes, event participation, and giving history.

### KPIs And Metrics

- `HYPOTHESIS`: Alumni engagement score, participation rate, annual giving rate, donor retention, lapsed donor reactivation, major-gift pipeline, gift officer activity, proposal pipeline, campaign ROI, event attendance, affinity engagement, and lifetime giving.
- `VERIFY(E-023/E-025/E-028)`: EAB, Slate, and Salesforce all claim advancement/alumni or lifelong engagement scope, so StudentIQX must be careful about complement-vs-CRM overlap.

### Systems And Data

- `HYPOTHESIS`: Common systems include advancement CRM, alumni database, email/marketing platform, events platform, giving/payment systems, wealth screening, career services/alumni community platforms, and institutional data warehouse.

### Roles, Buyers, And Users

- `HYPOTHESIS`: Economic buyer may be VP Advancement, Chief Advancement Officer, campaign leadership, or CFO/president for campaign transformation.
- `HYPOTHESIS`: Daily users include gift officers, alumni relations, annual fund, advancement services, prospect research, campaign analysts, and event teams.

### StudentIQX Relevance

`HYPOTHESIS`: Advancement is a credible expansion motion after enrollment or student success establishes the lifecycle intelligence layer. It is less likely to be the first wedge unless the prospect already has a strategic advancement-data initiative or a strong Verndale relationship.

## LOB 4: IT / Data / Compliance / Institutional Research

### Constituents

- `HYPOTHESIS`: Internal constituents include CIO/CDO teams, data engineering, BI/analytics, institutional research, registrar, privacy/compliance, information security, system owners, and data stewards.
- `USER-PROVIDED`: IT/Data/Compliance is not just a support function; it is a co-buyer for FERPA-sensitive student intelligence.

### Operating Workflows

- `HYPOTHESIS`: Data integration from SIS, CRM, LMS, advising, financial-aid, advancement, and engagement systems.
- `HYPOTHESIS`: Identity resolution across prospect, applicant, student, graduate, and alumnus records.
- `HYPOTHESIS`: Data governance, access control, FERPA review, audit logging, and data-quality remediation.
- `HYPOTHESIS`: Institutional reporting, accreditation support, executive dashboards, census/freeze reporting, and ad hoc analytics.
- `HYPOTHESIS`: Platform operations for Snowflake, BI/Sigma, semantic definitions, activation/audit tables, and AI governance.

### KPIs And Metrics

- `HYPOTHESIS`: Data freshness, data completeness, match rate, duplicate rate, report cycle time, dashboard adoption, metric-definition consistency, access exceptions, FERPA/privacy incidents, data-quality issue backlog, integration uptime, and time to onboard a new source.
- `VERIFY(E-022)`: EDUCAUSE's resilience framing supports data/technology as an institutional operating concern, but Agent 7 should gather higher-ed-specific evidence around data governance and analytics pain.

### Systems And Data

- `VERIFY(E-008/E-023/E-024/E-025/E-026/E-028)`: The institution may already operate several major systems that claim lifecycle, analytics, or system-of-record scope. StudentIQX must map data ownership explicitly before promising unification.
- `USER-PROVIDED`: Canonical StudentIQX stack is Snowflake as data layer, Sigma as user/experience layer, and Snowflake Cortex as AI toolkit. Coalesce and generic "Snowflake Intelligence" remain adjacent/verify only.

### Roles, Buyers, And Users

- `HYPOTHESIS`: Economic or veto authority may sit with CIO, CDO, VP IT, registrar, privacy officer, information security, and institutional research leadership.
- `HYPOTHESIS`: Daily users include BI analysts, data engineers, IR analysts, system administrators, data stewards, and security/privacy reviewers.

### StudentIQX Relevance

`HYPOTHESIS`: IT/Data/Compliance is the enabling buyer. StudentIQX should sell business outcomes to Enrollment or Student Success, but it must satisfy IT/Data that the architecture is governed, auditable, non-replacement, and feasible on the institution's platform stack.

## Cross-Cutting Actor: Finance / CFO / Budget Governance

`HYPOTHESIS`: Finance is not a student-lifecycle operating LOB, but it is a recurring budget authority and veto node across Enrollment, Student Success, Advancement, IT/Data, and executive Student 360 initiatives. Agent 2 originally mentioned CFO/president inside multiple LOBs; the operating model should treat Finance as a cross-cutting actor rather than leaving it implied.

### Operating Workflows

- `HYPOTHESIS`: Budget planning and prioritization across enrollment, retention, academic programs, financial aid, advancement, and technology investments.
- `HYPOTHESIS`: Net tuition revenue planning, discount-rate governance, enrollment scenario modeling, and program margin / sustainability review.
- `HYPOTHESIS`: Business-case review for retention, graduation, student success, and data-platform investments.
- `HYPOTHESIS`: Capital / operating budget approval for Snowflake, Sigma, integration, managed services, and ongoing optimization work.

### KPIs And Metrics

- `HYPOTHESIS`: Net tuition revenue, discount rate, enrollment variance to plan, retention-related revenue impact, cost per enrolled student, cost to serve, program contribution margin, advancement ROI, technology run cost, and payback period.
- `VERIFY(E-019)`: Cost-of-attendance pressure is documented externally, but Agent 7/14 should validate finance-specific benchmark data before any sales value case uses quantified ROI.

### Roles, Buyers, And Users

- `HYPOTHESIS`: CFO, VP Finance, budget office, president/chief of staff, provost finance partner, and financial planning/analysis teams may act as approvers, co-sponsors, or blockers.
- `HYPOTHESIS`: Finance may not use StudentIQX daily, but it will ask whether the offering improves revenue predictability, retention economics, productivity, risk reduction, or executive decision quality.

### StudentIQX Relevance

`HYPOTHESIS`: Finance should be treated as a business-case stakeholder for every serious wedge. Agent 8 should not pass Stage 1 without identifying the likely budget source and whether the CFO/president is sponsor, approver, or passive reviewer.

## System-Level Vs Campus-Level Buying Model

`HYPOTHESIS`: The LOB model above describes office functions, but buying authority may sit at different institutional levels. A state system, multi-campus university, extension school, or school/college inside a university may have separate enrollment teams, advising models, IT systems, budgets, and data governance.

| Structure | How it modifies the LOB model | StudentIQX implication |
|---|---|---|
| Single-campus institution | Office-level buyers and users are likely closer together. | Cleaner pilot path; easier to bind Enrollment, Student Success, IT/Data, and Finance around one data foundation. |
| Multi-campus public system | System office may control IT/data platform, procurement, finance, and reporting while campuses own student workflows. | Sell may require system-level CIO/CDO/CFO sponsorship plus campus-level use-case proof. |
| Large university with schools/colleges | Central IT/IR may own data, but schools may own graduate/professional enrollment and student success operations. | ICP should score both central and school-level readiness; prototype may need school-level filtering and roll-up views. |
| Extension / online division | Unit may have its own CRM, marketing funnel, advising model, and P&L-like accountability. | Could be an easier entry point if the unit has clearer revenue accountability and data-access authority. |
| Community college district | District may control technology/procurement while campuses manage advising and workforce programs. | Fit depends on whether a district-wide model can support campus-specific workflows and metrics. |

`VERIFY(E-030)`: Agent 8 and Agent 11 should explicitly determine whether the first target account motion is campus-led, system-led, school-led, or unit-led. The answer changes buyer titles, procurement path, implementation scope, and demo storyline.

## Cross-Cutting Constituent Type List

| Constituent type | Context label | Lifecycle stage | Office(s) with material interest | Typical data needed |
|---|---|---|---|---|
| Prospect | `USER-PROVIDED` + `HYPOTHESIS` | Recruiting/pre-enrollment | Enrollment, marketing, program leaders | Source/channel, program interest, engagement, demographics, geography, outreach history |
| Applicant | `USER-PROVIDED` + `HYPOTHESIS` | Application | Admissions, financial aid, program/department | Application status, checklist, credentials, aid status, communications, admissions decision |
| Admit | `USER-PROVIDED` + `HYPOTHESIS` | Enrollment/yield | Enrollment, financial aid, orientation, housing | Offer/admit status, scholarship/aid, deposit, event engagement, intent signals |
| Enrolled / active student | `USER-PROVIDED` + `HYPOTHESIS` | Active student | Student success, academic affairs, registrar, finance | Courses, credits, grades, LMS engagement, advising, holds, aid, attendance/participation, support usage |
| At-risk / stop-out | `HYPOTHESIS` | Active student / interruption | Student success, finance, academic affairs | Risk factors, interventions, holds, balances, engagement, academic progress, outreach history |
| Graduate | `USER-PROVIDED` + `HYPOTHESIS` | Graduation transition | Registrar, advancement, career services | Degree completion, program, outcomes, career data, alumni record linkage |
| Alumnus / donor | `USER-PROVIDED` + `HYPOTHESIS` | Alumni community | Advancement, alumni relations, career services | Engagement, event participation, giving, affinity, communications, employment/outcomes |

## Cross-Cutting KPI Glossary

`VERIFY(E-031)`: The KPI glossary below names business concepts, not final metric definitions. Higher-ed offices may define the same term differently. Enrollment, IR, Academic Affairs, Finance, and Student Success may disagree on cohort inclusion, census/freeze date, part-time vs full-time handling, transfer inclusion, online/extension inclusion, and whether a metric is operational, official, or financial. This is a direct Agent 6 / Agent 13 data-model risk.

| KPI | Context label | Primary office | Why it matters for StudentIQX |
|---|---|---|---|
| Inquiry-to-application conversion | `HYPOTHESIS` | Enrollment | Indicates funnel quality and recruitment effectiveness. |
| Admit rate | `HYPOTHESIS` | Enrollment | Connects demand, selectivity, program capacity, and institutional strategy. |
| Yield rate | `HYPOTHESIS` | Enrollment | Directly affects enrolled class size and revenue planning. |
| Melt rate | `HYPOTHESIS` | Enrollment / Student Success | Captures admitted/deposited students who fail to matriculate; likely high-value activation use case. |
| Net tuition revenue | `HYPOTHESIS` | Enrollment / Finance | Bridges enrollment strategy and financial impact. |
| Discount rate | `HYPOTHESIS` | Enrollment / Finance | Critical for tuition-dependent institutions; requires careful financial-aid context. |
| Term-to-term persistence | `HYPOTHESIS` | Student Success | Near-term success signal and intervention outcome. |
| First-year retention | `VERIFY(E-018)` | Student Success | External benchmark exists; useful proof-point anchor. |
| Graduation rate | `VERIFY(E-017)` | Student Success / Academic Affairs | Long-run success and accountability metric. |
| DFW rate | `HYPOTHESIS` | Academic Affairs / Student Success | Course-level risk signal for gateway courses and advising. |
| Credits earned vs attempted | `HYPOTHESIS` | Student Success | Signals progress, financial-aid risk, and time-to-degree. |
| Time-to-degree | `HYPOTHESIS` | Student Success / Academic Affairs | Connects advising, course availability, cost, and outcomes. |
| Intervention response rate | `HYPOTHESIS` | Student Success | Measures whether activation workflows are actually working. |
| Alumni engagement score | `HYPOTHESIS` | Advancement | Potential bridge from student engagement to advancement segmentation. |
| Donor participation / retention | `HYPOTHESIS` | Advancement | Measures advancement relationship health. |
| Data freshness / completeness | `HYPOTHESIS` | IT / Data | Determines whether Sigma/Cortex outputs can be trusted. |
| Identity match rate | `HYPOTHESIS` | IT / Data | Core Customer 360 feasibility metric across prospect/student/alumni records. |
| Metric-definition consistency | `HYPOTHESIS` | IT / Data / IR | Prevents office-by-office dashboard drift and executive mistrust. |

### Metric Definition Conflict Register

| Metric family | Likely conflicting owners | Definition risk to hand to Agent 6 / Agent 13 |
|---|---|---|
| Enrollment / census | Enrollment, Registrar, Finance, IR | Operational enrollment, census enrollment, paid enrollment, and program enrollment may differ. |
| Yield / melt | Enrollment, Financial Aid, Orientation, IR | Denominator may be admits, deposits, FAFSA-complete admits, orientation registrants, or census-enrolled students. |
| Retention / persistence | Student Success, IR, Academic Affairs, Finance | Cohort definition, stop-out handling, transfer-outs, full-time/part-time handling, and term boundaries may differ. |
| Graduation / completion | Registrar, IR, Academic Affairs | Degree level, cohort, transfer, time horizon, and program-level rollups require explicit grain. |
| At-risk status | Advising, Faculty, Student Affairs, Financial Aid, IR | Risk may mean academic, financial, engagement, wellness/care, or registration risk; combining them without governance can overpromise. |
| Net tuition / discount | Finance, Enrollment, Financial Aid | Gross tuition, institutional aid, restricted aid, timing, and program attribution must be reconciled. |
| Alumni engagement / donor propensity | Advancement, Alumni Relations, Career Services | Engagement scoring may blend event, communication, giving, career, volunteer, and affinity signals with different ownership. |

## Workflow-Level Competitive Overlap

Agent 1 established incumbent overlap at the platform-claim level. Agent 2 needs to make the overlap operational: which workflow is being contested, and where StudentIQX might add value as a governed intelligence layer rather than another point tool.

| Workflow | Incumbent overlap | Possible StudentIQX complementary value | Validation need |
|---|---|---|---|
| Inquiry-to-enrollment funnel and yield | Slate, Salesforce, EAB, enrollment CRM | Cross-source funnel intelligence that joins CRM engagement, aid, program capacity, historical yield, student-success readiness, and finance metrics in Snowflake/Sigma. | Confirm whether enrollment teams lack this view today or already get it from CRM/BI. |
| Melt prevention | Slate/Salesforce engagement workflows, EAB student engagement, SIS/aid/orientation systems | Governed list of at-risk admits/deposits using CRM + aid + orientation + registration signals, with staff-facing prioritization and outcome logging. | Confirm data availability and whether outreach action happens in CRM while StudentIQX measures/queues intelligence. |
| Advising caseload / early alert | EAB Navigate360, Civitas Learning, Ellucian, LMS alerts, Starfish hypothesis from seed source | Unified risk and intervention view across LMS, SIS, advising notes, holds, financial aid, and support usage, with explainable score ingredients and audit trail. | Confirm whether institutions see EAB/Civitas as sufficient or need institution-owned Snowflake intelligence. |
| Student 360 profile | SIS, CRM, advising, Salesforce, Ellucian, internal data warehouse | Institution-owned semantic and metric layer that reconciles prospect -> student -> graduate -> alumnus identity and definitions. | Confirm identity-resolution pain and ownership across registrar, IT/Data, Enrollment, Advancement. |
| Executive enrollment / retention / finance reporting | Internal BI/IR, SIS reports, CRM dashboards, data warehouse | Executive decision cockpit with agreed definitions, cross-office drilldowns, and consistent Finance/IR/Enrollment metrics. | Confirm budget owner and whether CFO/provost/president care enough to sponsor. |
| Advancement segmentation | Salesforce, Slate, advancement CRM, alumni platforms | Lifecycle intelligence that carries student/program/engagement/outcome signals into alumni segmentation and campaign planning. | Confirm whether Advancement is a first wedge or expansion motion. |
| Data quality and governance | IT/Data, IR, SIS/CRM admins, data warehouse teams | Snowflake-modeled data quality, identity match, suppression, consent, and metric-governance surfaces in Sigma. | Confirm whether this sells as standalone diagnostic or only as support for enrollment/retention outcomes. |

## Structural Oddities Later Agents Must Preserve

1. `USER-PROVIDED`: The student lifecycle is both the customer journey and the product spine; downstream agents should not map "customer" too narrowly to enrolled students only.
2. `HYPOTHESIS`: Functional offices behave like LOBs with separate buyers, budgets, systems, metrics, and political priorities.
3. `HYPOTHESIS`: Buyer/user divergence is high: the economic buyer may be VP/provost/CFO/CIO, while daily users are counselors, advisors, analysts, and gift officers.
4. `HYPOTHESIS` + `VERIFY(E-016/E-027)`: Regional demographic pressure should influence ICP scoring; Northeast/Midwest institutions may face a different urgency pattern than the South.
5. `VERIFY(E-030)`: Multi-campus systems, schools/colleges, extension units, online programs, and graduate/professional schools may change who buys, who owns data, and which office workflows matter.
6. `VERIFY(E-031)`: Shared KPI names can hide conflicting metric definitions. StudentIQX must not present a unified metric until owner, grain, source, timing, and inclusion/exclusion rules are explicit.
7. `HYPOTHESIS`: Resident vs commuter, full-time vs part-time, adult vs traditional-age, transfer vs first-time, and online vs on-campus mixes materially change workflows and risk signals.
8. `VERIFY(E-021)`: FERPA and PII constraints must shape every student-level insight, AI moment, and activation workflow.
9. `GATING VERIFY`: Agent 8 must validate that the market accepts complementary positioning (locked in Decision #2, E-035) rather than expecting StudentIQX to replace incumbents.
10. `VERIFY(E-032)`: Staff-facing vs student-facing surface scope is still unlocked. Agent 3 should not treat either posture as a formal decision.

## Source Material And Evidence Notes

- `VERIFY(E-001)`: Canonical naming remains StudentIQX despite source drift.
- `VERIFY(E-002)`: Fragmented student data is still a seeded hypothesis, not a finalized fact.
- `VERIFY(E-008/E-023/E-024/E-025/E-026/E-028)`: Incumbents claim meaningful portions of the lifecycle and analytics surface; Agent 6 and Agent 16 must map system ownership and competitive overlap carefully.
- `VERIFY(E-010)`: The four pillars and eight named agentic workflows from seeded Confluence remain hypotheses. This profile describes office workflows instead of accepting those workflow names as canonical.
- `VERIFY(E-011)`: The "failed/stalled Student 360" trigger remains plausible but unproven.
- `VERIFY(E-029)`: Finance/CFO budget authority appears across several LOBs and should be validated as a cross-cutting buying-center role.
- `VERIFY(E-030)`: Campus vs system vs school/unit buying authority needs validation before account targeting.
- `VERIFY(E-031)`: Metric-definition conflict is now an explicit data-model risk.
- `VERIFY(E-032)`: Staff-facing vs self-service positioning remains a decision gap in `OFFERING-DECISIONS.md`.

## Downstream Questions

1. `GATING VERIFY`: Agent 8 must validate that staff-facing scope (locked Decision #2, E-032) matches buyer expectations vs incumbent student-facing CRM/engagement features.
2. `VERIFY`: Which office has both urgent pain and budget authority for the first wedge: Enrollment, Student Success, Advancement, Finance-backed executive Student 360, or IT/Data platform health?
3. `VERIFY`: Is the practical buyer campus-led, system-led, school-led, or unit-led?
4. `VERIFY`: Which systems are most often authoritative for each lifecycle stage, and where do data handoffs break?
5. `VERIFY`: Which KPIs have budget consequence strong enough for a Stage 1 commercial wedge: yield, melt, retention, net tuition revenue, time-to-degree, advancement pipeline, or data-platform operating efficiency?
6. `VERIFY`: Which KPI definitions are politically contested enough to require metric-governance work before any Sigma demo is credible?
7. `VERIFY`: What is the minimum Snowflake/Sigma data foundation that can support enrollment and retention use cases without overpromising activation or AI?
