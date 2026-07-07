# StudentIQX Agent 4 — Constituent Journey Maps

Agent: `constituent-journey-mapper`  
Stage: 1 — Commercial Scan  
Run date: 2026-07-07  
Status: Agent 4 complete; all `VERIFY` and `GATING HYPOTHESIS` items remain open until later agents or gate review resolve them.

## Execution Context

`USER-PROVIDED`: The canonical student lifecycle is recruiting / pre-enrollment -> application -> enrollment -> active student -> graduation -> alumni community membership.

`USER-PROVIDED`: Decision #2 locks StudentIQX as a complementary governed intelligence layer alongside SIS/CRM/LMS/domain platforms, not a replacement. The canonical surface is staff-facing operational intelligence; student-facing self-service is out of scope unless unlocked later (E-032, E-035, E-036).

`USER-PROVIDED`: Decision #3 overrides the Agent 3 informal "Revise Before Go" checkpoint and permits Agent 4 to run. Open strategic risks remain research objectives for Agents 4-8 and Gate 1.

`USER-PROVIDED`: Decision #4 sets the current wedge instinct as pre-enrollment / enrollment through matriculation plus first-year or general retention, to be validated by Agent 8 (E-041).

`VERIFY`: Budget holder, campus-vs-system buying authority, school/college autonomy, technology governance, metric definitions, FERPA/AI constraints, and incumbent-market acceptance remain unresolved or partially validated (E-021, E-029/E-031, E-037/E-038).

`HYPOTHESIS`: Journey opportunities should be read through the three-condition fit filter from prior strategy work: whether the institution owns enough cross-journey data to govern the workflow, whether the lifecycle moment has enough student lifetime value / institutional impact to optimize, and whether there is budget plus organizational will to act. Agent 8 should score the journey options explicitly against those three conditions.

## Journey Spine

| Stage | Constituent state | Primary office(s) | Common systems touched | Core staff job | Key handoff / risk |
|---|---|---|---|---|---|
| Recruiting / pre-enrollment | Prospect, inquiry, stealth prospect | Admissions & Enrollment, Marketing, academic program | CRM, web analytics, campaign tools, event tools, inquiry imports | Identify interest, prioritize outreach, move prospect toward application | Prospect identity may not connect to later applicant/student record. |
| Application | Applicant, incomplete applicant, completed applicant | Admissions, program/department, financial aid | CRM, application platform, document management, SIS staging, aid systems | Complete application, evaluate readiness/fit, coordinate aid and program review | Application status, aid status, and outreach history may live in separate workflows. |
| Enrollment / yield | Admit, deposited student, melt risk, matriculant | Enrollment, Financial Aid, Orientation, Housing, Registrar, Finance | CRM, SIS, aid, orientation, housing, payment, communication systems | Convert admit to enrolled student and reduce melt | Admit/deposit signals often hand off awkwardly to SIS, orientation, and first-term support. |
| Active student / first year | Matriculant, enrolled student, first-year student | Student Success, Academic Affairs, Advising, Registrar, Finance | SIS, LMS, advising, degree audit, aid, billing/holds, support systems | Keep student engaged, registered, progressing, and supported | Enrollment data does not always become actionable advising context. |
| Continuing student | Sophomore, junior, senior, major-switcher, transfer-in, transfer-out risk | Student Success, Academic Affairs, Advising, Registrar, Finance | SIS, LMS, advising, degree audit, aid/billing, major/program systems, transfer-credit evaluation | Keep students progressing after the first year and detect new retention/completion risks | Continuing-student risk may emerge from major changes, unmet requirements, aid exhaustion, course sequencing, or transfer intent rather than first-year acclimation. |
| Risk / intervention | At-risk student, stop-out risk, student with hold, disengaged student | Student Success, Advisors, Faculty, Student Affairs, Finance | LMS, SIS, advising notes, early alert, aid/billing, support referrals | Prioritize outreach, coordinate intervention, measure response | Risk can be academic, financial, engagement, wellness/care, or administrative; combining without governance can mislead. |
| Persistence / re-enrollment | Persister, continuing student, stop-out, returning student | Student Success, Registrar, Finance, Academic Affairs | SIS, registration, advising, aid/billing, CRM/reactivation | Support term-to-term continuation or re-entry | Stop-out and re-entry journeys can fall between Enrollment and Student Success ownership. |
| Graduation | Candidate, completer, graduate | Registrar, Academic Affairs, Student Success, Career Services | SIS, degree audit, advising, career services, advancement handoff | Confirm completion, clear requirements, transition record | Graduation outcome may not connect cleanly to alumni/advancement record. |
| Alumni community | Alumnus, engaged alumnus, donor/prospect | Advancement, Alumni Relations, Career Services | Advancement CRM, alumni platform, events, giving, career systems | Build engagement, segment, steward, cultivate giving | Student history and engagement may not follow into advancement intelligence. |

## Journey Map 1: Enrollment Yield / Melt

This is the current leading wedge instinct (`USER-PROVIDED`, E-041). It covers prospect through matriculation and the first handoff into first-year support.

| Journey step | Constituent state | Owning office(s) | Staff-facing StudentIQX moment | Systems / data touched | Blind spot to expose |
|---|---|---|---|---|---|
| Source and engage | Prospect / inquiry | Enrollment, Marketing, program | `HYPOTHESIS`: Staff workflow assigning prospects to outreach owners from source quality, engagement, program interest, and next-action signals, with contact status and response outcome logged to the source segment. | CRM, campaign, web/event data, inquiry imports | Prospect may appear in multiple systems or not be known until application. |
| Convert to applicant | Applicant / incomplete applicant | Admissions, program office | `HYPOTHESIS`: Application-completion queue assigning incomplete applicants to staff owners, tracking checklist/status resolution, and logging completion outcome against the originating applicant segment. | CRM, application platform, document status, program review | Application status and communication history may not be reconciled. |
| Admit and package | Admit | Admissions, Financial Aid, program | `HYPOTHESIS`: Admit-yield workflow assigning admits to Enrollment, Financial Aid, or program owners by offer, aid, engagement, geography, and likely-yield signal, with status and outcome logged to the admit cohort. | CRM, application, SIS/admit load, financial aid | Aid status and enrollment intent may be disconnected. |
| Deposit and orient | Deposited student | Enrollment, Orientation, Housing, Finance | `HYPOTHESIS`: Melt-risk prioritization workflow assigning deposited students to staff owners, tracking aid/orientation/housing/payment/registration status, and logging yield or melt outcome against the originating risk score/cohort. | CRM, deposit, orientation, housing, payment, aid | Deposit does not guarantee matriculation; staff may lack a unified melt view. |
| Matriculate | Matriculant / first-term student | Registrar, Student Success, Advising | `HYPOTHESIS`: Matriculation handoff workflow assigning first-term students to advising/success owners with pre-enrollment context, handoff status, and first-term outcome logging tied back to the enrollment cohort. | SIS, CRM history, aid, orientation, advising | Advisors may receive a student record without recruitment context or known risk signals. |

Moments of truth:

- `HYPOTHESIS`: Incomplete application conversion.
- `HYPOTHESIS`: Admit-to-deposit yield.
- `HYPOTHESIS`: Deposit-to-matriculation melt.
- `HYPOTHESIS`: First-term registration and attendance/engagement.
- `VERIFY(E-031)`: Definitions of yield, melt, matriculation, and census enrollment may differ by Enrollment, Registrar, Finance, and IR.

## Journey Map 2: First-Year Retention / Student Success

This journey covers the first-year portion of the retention wedge (`USER-PROVIDED`, E-041). General / continuing retention is mapped separately below so the broader wording in Decision #4 is not collapsed into first-year-only dynamics.

| Journey step | Constituent state | Owning office(s) | Staff-facing StudentIQX moment | Systems / data touched | Blind spot to expose |
|---|---|---|---|---|---|
| First-term start | Matriculant / active student | Student Success, Advising, Registrar | `HYPOTHESIS`: First-year cohort workflow assigning students to advising/success owners from enrollment, aid, advising, and engagement indicators, with status and outcome logging against the first-year cohort. | SIS, LMS, advising, aid, holds, orientation | Pre-enrollment context may not follow the student. |
| Early engagement | Active student | Faculty, Advisors, Student Success | `HYPOTHESIS`: Early-alert activation workflow explaining trigger signals, assigning staff follow-up owners, tracking intervention status, and logging response outcome against the originating alert/score. | LMS, attendance/participation, grades, advising notes | LMS activity, faculty concern, and advising notes may not be unified. |
| Academic / financial risk | At-risk student | Advising, Finance, Financial Aid, Student Affairs | `HYPOTHESIS`: Risk triage workflow routing academic, financial, registration, and engagement issues to the right staff owner, tracking resolution status, and logging outcomes by risk type and cohort. | SIS, aid, billing/holds, LMS, advising, care referrals | "At risk" can mean different things to different offices. |
| Intervention | Student receiving outreach | Advisors, Success Coaches, Student Affairs | `HYPOTHESIS`: Action log / intervention outcome view, with human review before any AI-generated recommendation is used. | Advising/case management, CRM/outreach, notes, audit logs | Outreach may happen without consistent outcome logging. |
| Persist or stop out | Persister / stop-out | Student Success, Registrar, Finance | `HYPOTHESIS`: Persistence workflow tracking assigned interventions through persistence/stop-out outcome and writing results back to the originating risk factor, intervention, program, and cohort definition. | SIS, registration, billing, advising outcomes | Persistence definitions may differ by official reporting vs operational support. |
| Re-entry | Former student / returning student | Registrar, Student Success, Enrollment | `HYPOTHESIS`: Re-entry workflow assigning former students to outreach or barrier-resolution owners, tracking holds/credits/outreach status, and logging return/no-return outcomes against the reactivation segment. | SIS, CRM, advising notes, aid/billing | Stop-outs may become invisible once no longer actively enrolled. |

Moments of truth:

- `VERIFY(E-018)`: First-year retention is an externally documented benchmark, but institution-specific operating definitions remain unresolved.
- `HYPOTHESIS`: Early alert and advising triage are likely high-value staff workflows if data can be unified without overpromising AI.
- `VERIFY(E-021)`: FERPA and PII constraints must shape risk scoring, intervention notes, and auditability.

## Journey Map 3: Continuing Retention / Progression

This journey covers general retention after the first-year handoff. It is a distinct branch because later-stage retention risk is less about acclimation and more about progress, program fit, finance, sequencing, completion confidence, and transfer-out risk.

| Journey step | Constituent state | Owning office(s) | Staff-facing StudentIQX moment | Systems / data touched | Blind spot to expose |
|---|---|---|---|---|---|
| Program fit check | Continuing student / major-switcher | Academic Affairs, Advising, Registrar, school/college program office | `HYPOTHESIS`: Program-progress workflow assigning major-switch or program-fit cases to advising/program owners, tracking next-best academic action, and logging outcome against the progression segment. | SIS, degree audit, LMS, advising, program records | Major changes can reset degree progress while appearing as ordinary enrollment. |
| Financial continuity | Continuing student with emerging affordability risk | Finance, Financial Aid, Student Success | `HYPOTHESIS`: Retention-risk workflow routing affordability, aid exhaustion, balance, hold, and registration risks to Finance/Aid/Success owners, with status and outcome tied to the retention-risk cohort. | Aid, billing, holds, SIS registration, advising | A student may be academically healthy but unable to register, persist, or complete because of financial barriers. |
| Course sequencing / availability | Student blocked by pathway constraints | Registrar, Academic Affairs, department scheduler, Advising | `HYPOTHESIS`: Progression-barrier workflow assigning prerequisite, availability, sequencing, and graduation-delay issues to registrar/program/advising owners, with resolution status and outcome logged to the cohort. | SIS, catalog, degree audit, registration, advising | Progress risk can be structural, not behavioral, and may require program/registrar action rather than student outreach. |
| Transfer-out risk | Continuing student considering exit | Student Success, Advising, Registrar, Financial Aid | `HYPOTHESIS`: Transfer-out risk workflow assigning students to staff owners from engagement, hold, withdrawal, dissatisfaction, financial, or transcript/request signals, with outreach status and outcome logged to the risk score. | SIS, LMS, advising, transcript requests, aid/billing | Transfer intent may surface indirectly and too late for staff to intervene. |
| Near-completer support | Senior / near-completer | Registrar, Advising, Academic Affairs, Finance | `HYPOTHESIS`: Completion-support workflow assigning remaining-requirement, hold, registration, or graduation-readiness blockers to staff owners, with status and completion outcome logged to the near-completer cohort. | Degree audit, SIS, advising, billing/holds, graduation application | Near-completers can be counted as retained until they fail to finish. |

Moments of truth:

- `HYPOTHESIS`: Major-switch and program-fit decisions.
- `HYPOTHESIS`: Financial exhaustion or hold-driven registration failure after first year.
- `HYPOTHESIS`: Course sequencing and degree-applicability bottlenecks.
- `HYPOTHESIS`: Transfer-out risk before withdrawal or transcript request becomes irreversible.
- `VERIFY(E-031)`: Retention, persistence, progression, completion, and transfer-out definitions may differ across IR, Registrar, Finance, Advising, and school/college leadership.

## Journey Map 4: Transfer Entry / Transfer-Heavy Segments

This is a missing branch in a purely linear prospect-to-alumni map. `HYPOTHESIS`: If transfer-heavy institutions, community colleges, online divisions, or adult learner programs remain in ICP consideration, the journey must account for students who enter midstream with prior credits, different enrollment signals, and different retention risk.

| Journey step | Constituent state | Owning office(s) | Staff-facing StudentIQX moment | Systems / data touched | Blind spot to expose |
|---|---|---|---|---|---|
| Transfer inquiry / application | Transfer prospect / transfer applicant | Admissions, transfer admissions, program office | `HYPOTHESIS`: Transfer pipeline workflow assigning applicants to staff owners by source institution, intended program, prior credits, incomplete materials, and barriers, with status and enrollment outcome tied to the transfer segment. | CRM, application, transcript/document management, program review | Transfer applicants may not behave like first-time applicants; missing transcript/credit data can hide risk. |
| Credit evaluation | Admitted transfer / credit-evaluation pending | Registrar, Academic Affairs, program office | `HYPOTHESIS`: Credit-evaluation workflow assigning credit-applicability issues to registrar/program owners, tracking evaluation status, and logging degree-applicability outcome to the transfer cohort. | SIS, transfer-credit evaluation, degree audit, catalog, transcript data | Raw credits accepted may not equal credits applicable to the intended degree. |
| Advising / registration | Transfer matriculant | Advising, Registrar, school/college program | `HYPOTHESIS`: Transfer onboarding workflow assigning advising/registration owners, tracking degree-map, prerequisite, hold, and registration readiness, and logging first-term setup outcome. | SIS, degree audit, advising, registration, aid/billing | Transfer students can appear as continuing students but lack local advising/context. |
| First local term | Active transfer student | Student Success, Advising, Faculty | `HYPOTHESIS`: Transfer-success workflow assigning academic adjustment, credit applicability, registration, financial, and engagement risks to staff owners, with intervention status and first-local-term outcome logging. | SIS, LMS, advising, aid/billing, support referrals | Transfer risk may not align with first-time first-year risk models. |
| Completion pathway | Continuing transfer / near-completer | Registrar, Advising, Academic Affairs | `HYPOTHESIS`: Transfer-completion workflow assigning residency, remaining-course, and time-to-degree blockers to staff owners, tracking status, and logging completion outcome against the transfer pathway segment. | Degree audit, SIS, advising, catalog, registration | A transfer student can be close in credits but far from degree completion because of residency, major, or prerequisite rules. |

Moments of truth:

- `HYPOTHESIS`: Prior-credit applicability to intended degree.
- `HYPOTHESIS`: Transfer advising handoff into registration and first local term.
- `HYPOTHESIS`: Time-to-degree and completion confidence for transfer students.
- `VERIFY(E-031)`: Transfer retention and completion definitions may not align with first-time cohort definitions.

## Journey Map 5: Advancement / Alumni Expansion

This is currently an expansion journey, not the leading wedge, unless a specific account has advancement sponsorship.

| Journey step | Constituent state | Owning office(s) | Staff-facing StudentIQX moment | Systems / data touched | Blind spot to expose |
|---|---|---|---|---|---|
| Graduation transition | Graduate | Registrar, Career Services, Advancement | `HYPOTHESIS`: Graduate handoff workflow assigning alumni-record, career, or advancement follow-up owners, tracking creation/status, and logging handoff outcome against the graduating cohort. | SIS, degree audit, career services, advancement CRM | Completion and alumni identities may not match cleanly. |
| Early alumni engagement | Recent alumnus | Alumni Relations, Career Services | `HYPOTHESIS`: Early-alumni engagement workflow assigning recent alumni to engagement owners by program, activity, event, and career signal, with outreach status and response outcome logged to the segment. | Alumni platform, events, email, career services | Recent graduate engagement may be weakly connected to student experience. |
| Donor cultivation | Engaged alumnus / donor prospect | Advancement, Annual Fund, Major Gifts | `HYPOTHESIS`: Cultivation workflow assigning alumni/donor prospects to gift or annual-fund owners from governed lifecycle and propensity signals, with status and giving/engagement outcome logging. | Advancement CRM, giving, events, student history, career outcomes | Advancement CRM may not receive governed student lifecycle context. |
| Stewardship / feedback | Donor / volunteer / advocate | Advancement, Alumni Relations | `HYPOTHESIS`: Stewardship workflow assigning donors, volunteers, or advocates to staff owners, tracking engagement/campaign status, and logging giving, participation, and response outcomes back to the segment. | Advancement CRM, giving, events, communications | Campaign outcomes may not feed back to lifecycle intelligence. |

Moments of truth:

- `HYPOTHESIS`: Graduation-to-alumni identity match.
- `HYPOTHESIS`: Recent alumni engagement before affinity decays.
- `HYPOTHESIS`: Donor segmentation and stewardship prioritization.
- `VERIFY(E-032)`: Student-facing alumni portals are out of canonical scope; Staff-facing advancement intelligence is allowed.

## Journey Map 6: IT / Data / Compliance Journey

This journey is internal, but it governs whether any staff-facing lifecycle view is credible.

| Journey step | Internal constituent | Owning office(s) | Staff-facing StudentIQX moment | Systems / data touched | Blind spot to expose |
|---|---|---|---|---|---|
| Source inventory | Data owner / system owner | IT/Data, IR, Registrar, office system admins | `HYPOTHESIS`: Source-governance workflow assigning lifecycle data sources to accountable owners, tracking refresh/allowed-use review status, and logging remediation outcomes. | SIS, CRM, LMS, advising, aid, advancement, warehouse | Business users may not know authoritative source by lifecycle stage. |
| Identity resolution | Data steward / analyst | IT/Data, IR, Registrar | `HYPOTHESIS`: Identity-resolution workflow assigning low-match or duplicate record issues to data stewards, tracking resolution status, and logging match-quality outcome by lifecycle stage. | CRM, SIS, advancement CRM, identity data | Identity shifts at application, matriculation, graduation, and alumni creation. |
| Metric governance | IR / Finance / Enrollment / Student Success | IR, Finance, Enrollment, Student Success | `HYPOTHESIS`: Semantic-governance workflow assigning metric definitions to accountable owners, tracking approval/version status, and logging definition decisions by office, cohort, time, source, and grain. | Warehouse/Snowflake, BI/Sigma, source systems | Conflicting KPI definitions are expected and must be governed, not erased (E-031). |
| FERPA / role access | Privacy / registrar / security | Compliance, Registrar, Security, IT | `HYPOTHESIS`: Access-review workflow assigning role/access exceptions and sensitive-signal reviews to privacy/security owners, tracking approval status, and logging audit outcomes. | Identity/access, data warehouse, Sigma, audit logs | Staff views may expose sensitive records or inappropriate risk signals. |
| Activation audit | Data steward / program owner | IT/Data, business office owner | `HYPOTHESIS`: Activation/request/outcome tables for staff action tracking. | Snowflake, Sigma, CRM/advising/outreach tools | Staff action may happen in point tools with no feedback loop. |

Moments of truth:

- `GATING HYPOTHESIS`: Technology services may be university-provided while school/college application support is local (E-038).
- `VERIFY(E-031)`: Metric definitions must be modeled flexibly by institution/school, not forced into a single universal dictionary.
- `VERIFY(E-021)`: FERPA and PII shape every student-level journey surface.

## Journey Variants By Institution Structure

| Structure | Journey steps most changed | Staff-facing moments that change | Specific blind spot |
|---|---|---|---|
| Single-campus private college | Enrollment yield, first-year retention, financial risk | `HYPOTHESIS`: One cross-functional melt / retention queue may be feasible if Enrollment, Success, Finance, and IT can align quickly. | The same people may own several journey steps, but systems and metric definitions can still fragment context. |
| Small liberal arts college | Yield, advising, financial-risk intervention, near-completer support | `VERIFY(E-040)`: Fewer decision layers may make a fast diagnostic/POC viable, but the staff surface may need to combine multiple roles in one view. | Smaller teams may have less data capacity and may need lighter implementation even if organizational will is high. |
| Public regional university | Melt, transfer entry, continuing retention, stop-out/re-entry | `VERIFY(E-039)`: Staff pain may be acute, but procurement / board governance can slow approval; StudentIQX may need a data-readiness or POC path before full platform commitment. | Transfer-heavy and affordability-driven journeys may matter more than traditional first-time residential assumptions. |
| Multi-campus public system | Source inventory, identity resolution, metric governance, campus-specific advising / enrollment action | `VERIFY(E-030)`: System office may approve warehouse, security, procurement, and standard definitions while campuses own outreach queues and intervention workflows. | Agent 6 must separate system-level data/platform authority from campus-level staff action, because the buyer may not own the workflow and the workflow owner may not own the platform. |
| Large university with schools/colleges | Program fit, school-specific enrollment funnels, continuing retention, transfer/credit evaluation | `USER-PROVIDED` + `VERIFY(E-037/E-038)`: School-level leaders may need unit-specific journey maps and KPIs under central IT, central SIS, and school-local application/advising tools. | Harvard GSE-like units may have real business autonomy without matching technology autonomy, creating a fit-filter risk around ownership and will to act. |
| Extension / online division | Direct enrollment, adult learner onboarding, continuing retention, stop-out/re-entry, employer/workforce pathways | `HYPOTHESIS`: CRM/LMS engagement, part-time pacing, employer affiliation, and reactivation signals may be more important than residential orientation/housing signals. | The journey may skip or compress traditional admissions steps, so Agent 6 should not assume a residential first-time student data model. |

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
11. `HYPOTHESIS`: Continuing-student risk may be misread if StudentIQX treats all retention as first-year retention.
12. `HYPOTHESIS`: Transfer students may enter mid-lifecycle with prior credits, different source systems, and different risk signals than first-time students.
13. `HYPOTHESIS`: Multi-campus systems may need one governed data layer with multiple campus-specific action queues and local KPI variants.

## Inputs For Agent 5 And Agent 6

Agent 5 should use these journey maps to identify persona pains at the handoff points, especially:

- `HYPOTHESIS`: Enrollment staff managing melt without unified aid/orientation/registration signals.
- `HYPOTHESIS`: Advisors inheriting first-year students without pre-enrollment context.
- `HYPOTHESIS`: Student Success teams triaging risk from fragmented LMS/SIS/advising/finance signals.
- `HYPOTHESIS`: Continuing-retention owners separating major-switch, transfer-out, aid/hold, course sequencing, and near-completer risk instead of treating all risk as one queue.
- `HYPOTHESIS`: Transfer-student owners coordinating credit evaluation, degree applicability, transfer advising, and first local term success.
- `HYPOTHESIS`: Finance and executive sponsors lacking trusted cross-office definitions for enrollment and retention impact.
- `HYPOTHESIS`: IT/Data teams mediating conflicting source ownership and semantic definitions.
- `HYPOTHESIS`: Economic buyers evaluating each journey against data ownership, student/institutional value at stake, and budget/will to act.

Agent 6 should use these journey maps to inventory system boundaries and authoritative sources, especially:

- `VERIFY(E-030/E-038)`: campus vs system vs school/unit data ownership.
- `VERIFY(E-031)`: metric owner, grain, source, timing, and inclusion/exclusion definitions.
- `VERIFY(E-032/E-035/E-036)`: staff-facing complementary surfaces across incumbents, not replacement workflows.
- `VERIFY(E-021)`: FERPA-sensitive fields, access roles, and audit requirements.
- `HYPOTHESIS`: transfer-credit evaluation, degree audit, transcript, and advising boundaries for transfer-heavy segments.
- `HYPOTHESIS`: structure-specific implementation patterns: system-level governance with campus action queues, school-level views under central systems, and lightweight single-campus POC surfaces.
