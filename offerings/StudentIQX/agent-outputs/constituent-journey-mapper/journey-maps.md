# StudentIQX Agent 4 — Constituent Journey Maps

Agent: `constituent-journey-mapper`  
Stage: 1 — Commercial Scan  
Run date: 2026-07-07  
Status: Agent 4 complete; all `VERIFY` and `GATING VERIFY` items remain open until later agents or gate review resolve them.

## Execution Context

`USER-PROVIDED`: The canonical student lifecycle is recruiting / pre-enrollment -> application -> enrollment -> active student -> graduation -> alumni community membership.

`USER-PROVIDED`: Decision #2 locks StudentIQX as a complementary governed intelligence layer alongside SIS/CRM/LMS/domain platforms, not a replacement. The canonical surface is staff-facing operational intelligence; student-facing self-service is out of scope unless unlocked later (E-032, E-035, E-036).

`USER-PROVIDED`: Decision #3 overrides the Agent 3 informal "Revise Before Go" checkpoint and permits Agent 4 to run. Open strategic risks remain research objectives for Agents 4-8 and Gate 1.

`USER-PROVIDED`: Decision #4 sets the current wedge instinct as pre-enrollment / enrollment through matriculation plus first-year or general retention, to be validated by Agent 8 (E-041).

`VERIFY`: Budget holder, campus-vs-system buying authority, school/college autonomy, technology governance, metric definitions, FERPA/AI constraints, and incumbent-market acceptance remain unresolved or partially validated (E-021, E-029/E-031, E-037/E-038).

## Journey Spine

| Stage | Constituent state | Primary office(s) | Common systems touched | Core staff job | Key handoff / risk |
|---|---|---|---|---|---|
| Recruiting / pre-enrollment | Prospect, inquiry, stealth prospect | Admissions & Enrollment, Marketing, academic program | CRM, web analytics, campaign tools, event tools, inquiry imports | Identify interest, prioritize outreach, move prospect toward application | Prospect identity may not connect to later applicant/student record. |
| Application | Applicant, incomplete applicant, completed applicant | Admissions, program/department, financial aid | CRM, application platform, document management, SIS staging, aid systems | Complete application, evaluate readiness/fit, coordinate aid and program review | Application status, aid status, and outreach history may live in separate workflows. |
| Enrollment / yield | Admit, deposited student, melt risk, matriculant | Enrollment, Financial Aid, Orientation, Housing, Registrar, Finance | CRM, SIS, aid, orientation, housing, payment, communication systems | Convert admit to enrolled student and reduce melt | Admit/deposit signals often hand off awkwardly to SIS, orientation, and first-term support. |
| Active student / first year | Matriculant, enrolled student, first-year student | Student Success, Academic Affairs, Advising, Registrar, Finance | SIS, LMS, advising, degree audit, aid, billing/holds, support systems | Keep student engaged, registered, progressing, and supported | Enrollment data does not always become actionable advising context. |
| Risk / intervention | At-risk student, stop-out risk, student with hold, disengaged student | Student Success, Advisors, Faculty, Student Affairs, Finance | LMS, SIS, advising notes, early alert, aid/billing, support referrals | Prioritize outreach, coordinate intervention, measure response | Risk can be academic, financial, engagement, wellness/care, or administrative; combining without governance can mislead. |
| Persistence / re-enrollment | Persister, continuing student, stop-out, returning student | Student Success, Registrar, Finance, Academic Affairs | SIS, registration, advising, aid/billing, CRM/reactivation | Support term-to-term continuation or re-entry | Stop-out and re-entry journeys can fall between Enrollment and Student Success ownership. |
| Graduation | Candidate, completer, graduate | Registrar, Academic Affairs, Student Success, Career Services | SIS, degree audit, advising, career services, advancement handoff | Confirm completion, clear requirements, transition record | Graduation outcome may not connect cleanly to alumni/advancement record. |
| Alumni community | Alumnus, engaged alumnus, donor/prospect | Advancement, Alumni Relations, Career Services | Advancement CRM, alumni platform, events, giving, career systems | Build engagement, segment, steward, cultivate giving | Student history and engagement may not follow into advancement intelligence. |

## Journey Map 1: Enrollment Yield / Melt

This is the current leading wedge instinct (`USER-PROVIDED`, E-041). It covers prospect through matriculation and the first handoff into first-year support.

| Journey step | Constituent state | Owning office(s) | Staff-facing StudentIQX moment | Systems / data touched | Blind spot to expose |
|---|---|---|---|---|---|
| Source and engage | Prospect / inquiry | Enrollment, Marketing, program | `HYPOTHESIS`: Staff view of source quality, engagement, program interest, and likely next action. | CRM, campaign, web/event data, inquiry imports | Prospect may appear in multiple systems or not be known until application. |
| Convert to applicant | Applicant / incomplete applicant | Admissions, program office | `HYPOTHESIS`: Pipeline list showing incomplete requirements, communication history, and predicted completion risk. | CRM, application platform, document status, program review | Application status and communication history may not be reconciled. |
| Admit and package | Admit | Admissions, Financial Aid, program | `HYPOTHESIS`: Admit cohort view combining offer, program, aid status, engagement, geography, and likely yield. | CRM, application, SIS/admit load, financial aid | Aid status and enrollment intent may be disconnected. |
| Deposit and orient | Deposited student | Enrollment, Orientation, Housing, Finance | `HYPOTHESIS`: Melt-risk prioritization list for staff action and follow-up logging. | CRM, deposit, orientation, housing, payment, aid | Deposit does not guarantee matriculation; staff may lack a unified melt view. |
| Matriculate | Matriculant / first-term student | Registrar, Student Success, Advising | `HYPOTHESIS`: Handoff view that shows pre-enrollment context to first-year advisors. | SIS, CRM history, aid, orientation, advising | Advisors may receive a student record without recruitment context or known risk signals. |

Moments of truth:

- `HYPOTHESIS`: Incomplete application conversion.
- `HYPOTHESIS`: Admit-to-deposit yield.
- `HYPOTHESIS`: Deposit-to-matriculation melt.
- `HYPOTHESIS`: First-term registration and attendance/engagement.
- `VERIFY(E-031)`: Definitions of yield, melt, matriculation, and census enrollment may differ by Enrollment, Registrar, Finance, and IR.

## Journey Map 2: First-Year Retention / Student Success

This journey extends the leading wedge into first-year persistence and general retention (`USER-PROVIDED`, E-041).

| Journey step | Constituent state | Owning office(s) | Staff-facing StudentIQX moment | Systems / data touched | Blind spot to expose |
|---|---|---|---|---|---|
| First-term start | Matriculant / active student | Student Success, Advising, Registrar | `HYPOTHESIS`: First-year cohort watchlist with enrollment, aid, advising, and engagement indicators. | SIS, LMS, advising, aid, holds, orientation | Pre-enrollment context may not follow the student. |
| Early engagement | Active student | Faculty, Advisors, Student Success | `HYPOTHESIS`: Engagement and early-alert view that explains which signals triggered concern. | LMS, attendance/participation, grades, advising notes | LMS activity, faculty concern, and advising notes may not be unified. |
| Academic / financial risk | At-risk student | Advising, Finance, Financial Aid, Student Affairs | `HYPOTHESIS`: Staff queue separating academic, financial, registration, and engagement risk. | SIS, aid, billing/holds, LMS, advising, care referrals | "At risk" can mean different things to different offices. |
| Intervention | Student receiving outreach | Advisors, Success Coaches, Student Affairs | `HYPOTHESIS`: Action log / intervention outcome view, with human review before any AI-generated recommendation is used. | Advising/case management, CRM/outreach, notes, audit logs | Outreach may happen without consistent outcome logging. |
| Persist or stop out | Persister / stop-out | Student Success, Registrar, Finance | `HYPOTHESIS`: Persistence outcome measurement by risk factor, intervention, program, and cohort definition. | SIS, registration, billing, advising outcomes | Persistence definitions may differ by official reporting vs operational support. |
| Re-entry | Former student / returning student | Registrar, Student Success, Enrollment | `HYPOTHESIS`: Re-entry list showing prior risk, holds, credits, and outreach status. | SIS, CRM, advising notes, aid/billing | Stop-outs may become invisible once no longer actively enrolled. |

Moments of truth:

- `VERIFY(E-018)`: First-year retention is an externally documented benchmark, but institution-specific operating definitions remain unresolved.
- `HYPOTHESIS`: Early alert and advising triage are likely high-value staff workflows if data can be unified without overpromising AI.
- `VERIFY(E-021)`: FERPA and PII constraints must shape risk scoring, intervention notes, and auditability.

## Journey Map 3: Advancement / Alumni Expansion

This is currently an expansion journey, not the leading wedge, unless a specific account has advancement sponsorship.

| Journey step | Constituent state | Owning office(s) | Staff-facing StudentIQX moment | Systems / data touched | Blind spot to expose |
|---|---|---|---|---|---|
| Graduation transition | Graduate | Registrar, Career Services, Advancement | `HYPOTHESIS`: Graduate handoff view linking degree/program, engagement, outcomes, and alumni record creation. | SIS, degree audit, career services, advancement CRM | Completion and alumni identities may not match cleanly. |
| Early alumni engagement | Recent alumnus | Alumni Relations, Career Services | `HYPOTHESIS`: Engagement segmentation by program, activity, event participation, and career signal. | Alumni platform, events, email, career services | Recent graduate engagement may be weakly connected to student experience. |
| Donor cultivation | Engaged alumnus / donor prospect | Advancement, Annual Fund, Major Gifts | `HYPOTHESIS`: Staff segmentation and propensity view incorporating student lifecycle signals where permitted. | Advancement CRM, giving, events, student history, career outcomes | Advancement CRM may not receive governed student lifecycle context. |
| Stewardship / feedback | Donor / volunteer / advocate | Advancement, Alumni Relations | `HYPOTHESIS`: Outcome view showing engagement, giving, participation, and campaign response. | Advancement CRM, giving, events, communications | Campaign outcomes may not feed back to lifecycle intelligence. |

Moments of truth:

- `HYPOTHESIS`: Graduation-to-alumni identity match.
- `HYPOTHESIS`: Recent alumni engagement before affinity decays.
- `HYPOTHESIS`: Donor segmentation and stewardship prioritization.
- `VERIFY(E-032)`: Student-facing alumni portals are out of canonical scope; Staff-facing advancement intelligence is allowed.

## Journey Map 4: IT / Data / Compliance Journey

This journey is internal, but it governs whether any staff-facing lifecycle view is credible.

| Journey step | Internal constituent | Owning office(s) | Staff-facing StudentIQX moment | Systems / data touched | Blind spot to expose |
|---|---|---|---|---|---|
| Source inventory | Data owner / system owner | IT/Data, IR, Registrar, office system admins | `HYPOTHESIS`: Data-source inventory tied to lifecycle stage, owner, refresh, and allowed use. | SIS, CRM, LMS, advising, aid, advancement, warehouse | Business users may not know authoritative source by lifecycle stage. |
| Identity resolution | Data steward / analyst | IT/Data, IR, Registrar | `HYPOTHESIS`: Match-quality surface for prospect -> student -> graduate -> alumnus. | CRM, SIS, advancement CRM, identity data | Identity shifts at application, matriculation, graduation, and alumni creation. |
| Metric governance | IR / Finance / Enrollment / Student Success | IR, Finance, Enrollment, Student Success | `HYPOTHESIS`: Semantic definition registry by office, cohort, time, source, and grain. | Warehouse/Snowflake, BI/Sigma, source systems | Conflicting KPI definitions are expected and must be governed, not erased (E-031). |
| FERPA / role access | Privacy / registrar / security | Compliance, Registrar, Security, IT | `HYPOTHESIS`: Role-based access and audit review for student-level intelligence. | Identity/access, data warehouse, Sigma, audit logs | Staff views may expose sensitive records or inappropriate risk signals. |
| Activation audit | Data steward / program owner | IT/Data, business office owner | `HYPOTHESIS`: Activation/request/outcome tables for staff action tracking. | Snowflake, Sigma, CRM/advising/outreach tools | Staff action may happen in point tools with no feedback loop. |

Moments of truth:

- `GATING HYPOTHESIS`: Technology services may be university-provided while school/college application support is local (E-038).
- `VERIFY(E-031)`: Metric definitions must be modeled flexibly by institution/school, not forced into a single universal dictionary.
- `VERIFY(E-021)`: FERPA and PII shape every student-level journey surface.

## Journey Variants By Institution Structure

| Structure | Journey modification | Specific blind spot |
|---|---|---|
| Single-campus private college | `HYPOTHESIS`: Offices may coordinate more directly; fewer approval layers may support a faster diagnostic/POC. | The same people may own several journey steps, but systems can still fragment context. |
| Small liberal arts college | `VERIFY(E-040)`: May have fewer buying-decision layers and could be an ICP candidate. | Smaller teams may have fewer data staff and less capacity for complex implementation. |
| Public regional university | `VERIFY(E-039)`: May face slower, board-governed technology buying and public governance layers. | Staff pain may be high while procurement / IT timing slows action. |
| Multi-campus public system | `VERIFY(E-030)`: System office may control technology/procurement while campuses own student workflows. | Journey map must distinguish system-level data governance from campus-level advising/enrollment practice. |
| Large university with schools/colleges | `USER-PROVIDED` + `VERIFY(E-037/E-038)`: Schools may operate like distinct businesses while technology governance may be central, local, or split. | Harvard GSE-like units may need school-specific journey maps under university-level infrastructure. |
| Extension / online division | `HYPOTHESIS`: Direct enrollment, adult learner, part-time, stop-out/re-entry, and employer/workforce journeys may dominate. | CRM/LMS signals may matter more than residential student signals. |

## Cross-Stage Discontinuities

1. `HYPOTHESIS`: Prospect identity does not reliably persist into applicant, SIS, active student, graduate, and alumni records.
2. `HYPOTHESIS`: Admissions outreach history may not be visible to first-year advisors after matriculation.
3. `HYPOTHESIS`: Financial-aid, deposit, orientation, housing, and registration signals may be separated during the melt window.
4. `VERIFY(E-031)`: Enrollment, yield, melt, retention, persistence, and graduation definitions may differ across Enrollment, Registrar, Finance, IR, and Student Success.
5. `HYPOTHESIS`: Advising, LMS, faculty alerts, financial holds, and student affairs/care signals may produce separate risk pictures.
6. `HYPOTHESIS`: Intervention outcomes may be logged inconsistently or not connected to later retention/persistence measurement.
7. `HYPOTHESIS`: Stop-outs can fall between Student Success, Registrar, Finance, and Enrollment/reactivation ownership.
8. `HYPOTHESIS`: Graduation completion may not reliably trigger a high-quality alumni/advancement identity handoff.
9. `GATING HYPOTHESIS`: School/college business autonomy may not match technology autonomy, creating mismatched owners for workflow pain vs data/platform authority (E-038).
10. `VERIFY(E-021)`: Student-level risk and activation views must preserve FERPA-safe access, audit, review, and explanation paths.

## Inputs For Agent 5 And Agent 6

Agent 5 should use these journey maps to identify persona pains at the handoff points, especially:

- `HYPOTHESIS`: Enrollment staff managing melt without unified aid/orientation/registration signals.
- `HYPOTHESIS`: Advisors inheriting first-year students without pre-enrollment context.
- `HYPOTHESIS`: Student Success teams triaging risk from fragmented LMS/SIS/advising/finance signals.
- `HYPOTHESIS`: Finance and executive sponsors lacking trusted cross-office definitions for enrollment and retention impact.
- `HYPOTHESIS`: IT/Data teams mediating conflicting source ownership and semantic definitions.

Agent 6 should use these journey maps to inventory system boundaries and authoritative sources, especially:

- `VERIFY(E-030/E-038)`: campus vs system vs school/unit data ownership.
- `VERIFY(E-031)`: metric owner, grain, source, timing, and inclusion/exclusion definitions.
- `VERIFY(E-032/E-035/E-036)`: staff-facing complementary surfaces across incumbents, not replacement workflows.
- `VERIFY(E-021)`: FERPA-sensitive fields, access roles, and audit requirements.

