# StudentIQX Agent 6 — Systems And Data Inventory

Agent: `systems-and-data-analyst`  
Stage: 1 — Commercial Scan  
Run date: 2026-07-07  
Status: Agent 6 complete; system-market claims remain `VERIFY` until Agent 27 finalizes evidence.

## Executive Read

`HYPOTHESIS`: StudentIQX is technically credible only if it treats higher-ed systems as a federated operating landscape, not as one clean student database. The core system problem is identity, metric, access, and action-feedback fragmentation across SIS, CRM, LMS, advising, financial aid, registrar, advancement, and institutional data/BI.

`USER-PROVIDED`: The canonical StudentIQX target stack is Snowflake as data layer, Sigma as staff experience layer, and Snowflake Cortex as AI toolkit. Coalesce and generic "Snowflake Intelligence" remain adjacent / `VERIFY` only (E-009).

`USER-PROVIDED`: Decision #2 scopes StudentIQX as staff-facing Unify + Intelligence + Activate. Agent 6 therefore models not only read-only views, but also staff-initiated, human-reviewed owner assignment, intervention-status tracking, and outcome logging in the governed Sigma/Snowflake layer (E-032/E-035/E-036).

`VERIFY(E-021/E-031)`: FERPA/PII and metric-definition conflicts are not downstream implementation details. They are core data-model requirements: every student-level insight needs role-aware access, auditability, explanation, and explicit metric owner/grain/source/timing.

`GATING HYPOTHESIS`: School/college autonomy may not match technology autonomy. A Harvard GSE-like school may own enrollment/student-success workflows while central university IT owns infrastructure, SIS, identity, security, or warehouse access (E-037/E-038). Agent 8 must validate whether that split helps or blocks the commercial wedge.

## Systems Inventory

| System / data domain | Primary owner(s) | Constituent data held | Lifecycle stages served | Integration reality | Data-quality / governance risks |
|---|---|---|---|---|---|
| Admissions / enrollment CRM | Enrollment, Admissions Ops, Marketing, program admissions | `HYPOTHESIS`: inquiries, prospects, applicants, outreach, event engagement, source/channel, counselor ownership, application checklist, admit/deposit signals | Recruiting, application, yield, transfer inquiry | `VERIFY(E-025/E-028/E-023)`: Slate, Salesforce, and EAB claim CRM/lifecycle scope; actual institutional implementation varies. | Prospect identity may not persist to SIS; source/channel and outreach history may not follow into advising; CRM action records may not connect to yield/melt outcomes. |
| Application platform / document management | Admissions, program reviewers, Graduate/professional schools | `HYPOTHESIS`: application status, credentials, documents, recommendations, program review status, admit/deny/waitlist decision | Application, transfer application, graduate/professional admissions | Often tied to CRM and SIS load, but program/school review may be local. | Checklist status and program review may be out of sync with CRM outreach or SIS admit record. |
| SIS / student system of record | Registrar, IT/Data, Student Accounts, sometimes central system office | `HYPOTHESIS` + `VERIFY(E-008/E-026)`: student identity, enrollment, registration, courses, grades, academic status, holds, student financials, census/freeze records | Matriculation, active student, persistence, graduation | Usually authoritative for enrolled student records; may receive imports from CRM/application and feed LMS/advising/warehouse. | SIS may not hold pre-enrollment context; official student status may differ from operational lists; term/census timing drives metric conflict. |
| Financial aid | Financial Aid, Finance, Enrollment | `HYPOTHESIS`: FAFSA/aide completion, packaging, scholarships, unmet need, aid holds, verification, affordability signals | Application, yield, melt, retention | May integrate with SIS/student accounts and enrollment CRM; access often restricted. | Aid readiness can be invisible to counselors/advisors; financial risk may be overexposed or under-shared due to privacy/access concerns. |
| Student accounts / billing / holds | Finance, Bursar, Student Accounts, Registrar | `HYPOTHESIS`: balances, payment status, registration holds, account flags, payment plans | Yield, registration, retention, re-entry | Often tied to SIS but not always visible in advising/enrollment workflow. | Students may be academically healthy but blocked from registration; hold definitions and timing may be misunderstood by non-finance staff. |
| Orientation / housing / student affairs onboarding | Orientation, Housing, Student Affairs, Enrollment | `HYPOTHESIS`: orientation registration, housing application/status, onboarding checklist, student services touchpoints | Yield, matriculation, first term | Often point solutions or local process lists feeding CRM/SIS inconsistently. | Deposit-to-matriculation risk can be hidden when orientation/housing/payment/registration are not joined. |
| LMS | Academic Affairs, Faculty, IT, Teaching & Learning | `HYPOTHESIS`: course activity, attendance/participation proxy, assignment submission, grades-in-progress, course engagement | Active student, first-year retention, continuing retention | LMS feeds may go to advising/early-alert, BI, or warehouse; real-time availability varies. | Engagement signals are course-contextual and can be misread without enrollment, advising, and academic-progress context. |
| Advising / case management / early alert | Student Success, Advising, Academic Affairs, Dean of Students | `HYPOTHESIS` + `VERIFY(E-023/E-024)`: advising notes, appointments, alerts, caseloads, referrals, intervention status, shared notes | First-year retention, continuing retention, risk, intervention, re-entry | May be incumbent workflow system or local advising platform; overlaps with StudentIQX activation candidate. | Sensitive notes, inconsistent outcome logging, duplicate outreach, and incumbent overlap are high-risk. |
| Degree audit / catalog / transfer-credit evaluation | Registrar, Academic Affairs, Advising, program offices | `HYPOTHESIS`: degree requirements, credits earned/attempted, transfer credit, prerequisites, applicability, residency rules, completion readiness | Transfer entry, continuing progression, graduation | Usually linked to SIS but may require separate evaluation/workflow tools and local program rules. | Accepted credits may not equal applicable credits; major changes and course sequencing can create hidden completion risk. |
| Faculty / academic program systems | Academic departments, program chairs, school/college units | `HYPOTHESIS`: program admission decisions, gateway course performance, faculty alerts, cohort rules, local notes | Application review, active student, progression, completion | Often local spreadsheets, department systems, LMS, or school-specific tools. | School/college autonomy can create local source-of-truth conflicts and unmodeled program-specific definitions. |
| IR / institutional warehouse / BI | Institutional Research, IT/Data, Analytics, sometimes Finance | `HYPOTHESIS`: official metrics, census/freeze extracts, longitudinal cohorts, reporting marts, dashboards | Executive reporting, accreditation, finance, all lifecycle stages | May already be Snowflake/warehouse or legacy BI; "failed Student 360" remains a possible trigger (E-011). | Operational metrics and official metrics can diverge; warehouse may be reporting-oriented, not activation/outcome-loop oriented. |
| Identity / access / security | IT, IAM, Security, Registrar/Privacy | `VERIFY(E-021)`: role, affiliation, access rights, audit records, sensitive-data permissions | All staff-facing surfaces | Must govern Sigma/Snowflake access and field/row-level permissions. | Access managed system-by-system can produce overexposure, under-sharing, and inconsistent audit trails. |
| Advancement CRM / alumni platform | Advancement, Alumni Relations, Advancement Services | `HYPOTHESIS` + `VERIFY(E-028/E-025/E-023)`: alumni identity, engagement, events, giving, campaigns, prospect research, stewardship | Graduation handoff, alumni, donor cultivation | May be Salesforce, Slate/advancement modules, EAB, Blackbaud-like systems, or institution-specific platform. | Graduate-to-alumni identity match can break; student/program/engagement history may not flow to advancement segmentation. |
| Career services / outcomes | Career Services, Alumni Relations, Academic Affairs | `HYPOTHESIS`: career advising, internships, employment outcomes, employer engagement, alumni career signals | Active student, graduation, alumni | Often separate from SIS/advancement and unevenly populated. | Outcomes and engagement data may be useful for advancement and program value but weakly governed. |
| Outreach / communication tools | Enrollment, Student Success, Advancement, Marketing | `HYPOTHESIS`: email/SMS/call campaigns, reminders, message engagement, suppression/consent, contact attempts | Recruiting, yield, intervention, re-entry, alumni | May sit inside CRM/advising/advancement tools or separate messaging platforms. | Action outcomes may be trapped in point tools; consent/suppression rules must be respected. |
| StudentIQX governed layer | IT/Data with business owners; Sigma/Snowflake/Cortex | `USER-PROVIDED` + `HYPOTHESIS`: unified identity spine, semantic definitions, risk/cohort scores, staff assignments, action status, outcomes, audit fields | Cross-lifecycle: enrollment, retention, transfer, advancement, governance | Complementary layer alongside source systems; should read from operational systems and write governed activation/outcome records without autonomous action. | Must avoid becoming another ungoverned system of record; source-of-truth and writeback boundaries need explicit design. |

## Data Domains And Likely Authoritative Sources

| Data domain | Likely authoritative source | Consuming personas | StudentIQX modeling need |
|---|---|---|---|
| Prospect / inquiry identity | `HYPOTHESIS`: Enrollment CRM | Enrollment, Marketing, Admissions Ops | Stable prospect key, source/channel history, engagement events, deduplication before applicant/SIS handoff. |
| Applicant status / checklist | `HYPOTHESIS`: CRM + application platform | Admissions, program reviewers, Enrollment leadership | Application lifecycle state, missing-item reasons, owner assignment and completion outcome. |
| Admit / deposit / yield status | `HYPOTHESIS`: CRM + SIS admit/deposit feeds | Enrollment, Financial Aid, Finance, Orientation | Cohort/score origin, assigned staff owner, status, yield/melt outcome. |
| Aid readiness / affordability | `HYPOTHESIS`: Financial aid + student accounts | Financial Aid, Enrollment, Advising, Finance | FERPA/PII-aware risk flags, owner routing, escalation status, outcome. |
| Matriculation / census enrollment | `HYPOTHESIS`: SIS / Registrar / IR | Registrar, Enrollment, Finance, IR | Explicit metric definitions: operational enrollment vs census/freeze vs paid enrollment. |
| LMS engagement / course activity | `HYPOTHESIS`: LMS | Advisors, Student Success, Faculty | Course-contextual signal with date, course, faculty, threshold, and explanation. |
| Advising notes / appointments / alerts | `HYPOTHESIS`: advising/case platform | Advisors, Student Success, Compliance | Sensitive-note handling, intervention type/status, owner, outcome, audit. |
| Holds / balances | `HYPOTHESIS`: student accounts / SIS | Finance, Financial Aid, Advisors | Barrier type, responsible office, resolution status, impact on registration/persistence. |
| Degree progress / transfer credit | `HYPOTHESIS`: degree audit + SIS + registrar evaluation | Registrar, Advisors, Academic Affairs | Applicable vs accepted credits, requirement gaps, completion confidence, resolution workflow. |
| Official retention / graduation metrics | `VERIFY(E-031)`: IR / Registrar / Academic Affairs | Executives, Finance, Student Success, IR | Semantic layer supporting multiple governed definitions by cohort, grain, source, and timing. |
| Staff assignment / action status / outcome | `USER-PROVIDED` + `HYPOTHESIS`: StudentIQX governed activation tables | Enrollment Ops, Advisors, Success, Financial Aid, Advancement, IT/Data | Canonical activation spine: originating segment/score/cohort, staff owner, action type, due/status, outcome, timestamp, audit. |
| Alumni identity / giving / engagement | `HYPOTHESIS`: Advancement CRM + alumni/event tools | Advancement, Alumni Relations, Finance | Identity link from graduate to alumnus, engagement segments, owner assignment, campaign/stewardship outcomes. |

## Fragmentation Narrative

`HYPOTHESIS`: The student record does not break in one place. It changes grain, owner, and governing definition at each lifecycle transition.

1. **Prospect -> applicant:** CRM and application records may use enrollment-owned identifiers and statuses. Program review and document checklist data may be local or partially integrated.
2. **Applicant/admit -> student:** SIS becomes authoritative after matriculation, but the recruitment history, yield risk, aid barriers, and counselor outreach context may not land in advisor-visible form.
3. **Deposit -> matriculation:** Deposit, aid, orientation, housing, payment, registration, and census enrollment often sit under different owners. This is the melt window where StudentIQX needs source reconciliation plus staff assignment/status/outcome tracking.
4. **First-year active student:** LMS, advising, faculty alerts, holds, and aid signals each describe different kinds of risk. Combining them without risk-type separation, owner routing, and FERPA-safe controls can create noisy or unsafe workflows.
5. **Continuing student:** Degree audit, major changes, course availability, aid exhaustion, holds, transfer-out risk, and near-completer status live across registrar, finance, academic, and advising domains.
6. **Transfer student:** Transfer credit has at least two meanings: accepted credits and degree-applicable credits. The second is what matters for time-to-degree and completion risk.
7. **Graduation -> alumni:** Advancement may create or update alumni identity after completion, but student engagement, program affinity, career outcomes, and consent/suppression history may not flow cleanly.
8. **Staff action -> outcome:** The largest newly clarified data gap is the activation feedback loop. If staff assignments and actions happen only in CRM/advising/point tools and outcomes are not written back to the governed layer, StudentIQX cannot prove which scores, cohorts, or interventions changed yield, persistence, completion, or engagement.

## Identity Resolution Requirements

| Transition | Identity challenge | Required StudentIQX treatment |
|---|---|---|
| Prospect to applicant | `HYPOTHESIS`: same person may have multiple inquiries, event records, campaign IDs, or application identities. | Preserve source identity and match confidence; do not overwrite provenance. |
| Applicant to admit / deposited student | `HYPOTHESIS`: application, CRM, aid, and SIS staging IDs may not align cleanly. | Maintain crosswalk with source system, source key, lifecycle state, and timestamp. |
| Deposited to matriculated student | `HYPOTHESIS`: SIS student ID becomes central while pre-enrollment context may be dropped. | Bind CRM/application/yield history to SIS student with match-quality metadata. |
| Active student across terms | `HYPOTHESIS`: term, course, program, and cohort grain can change. | Model term-level enrollment and cohort membership separately from person identity. |
| Transfer student | `HYPOTHESIS`: prior institution, transcript, accepted credit, applicable credit, and local student identity are separate. | Model prior institution and credit-evaluation events as first-class entities. |
| Graduate to alumnus/donor | `HYPOTHESIS`: advancement CRM may create a separate alumni/donor identity. | Maintain graduate-to-alumni crosswalk and allowed-use constraints. |

## Metric Definition Matrix

`VERIFY(E-031)`: These are business concepts, not final definitions. Agent 13 must implement governed semantic definitions that can vary by institution, school/college, office, cohort, and reporting purpose.

| Metric family | Common source(s) | Likely owners | Definition conflicts to preserve |
|---|---|---|---|
| Inquiry / source conversion | CRM, campaign, web/event tools | Enrollment, Marketing, Admissions Ops | Inquiry date, duplicate inquiries, source attribution, stealth prospect handling. |
| Application completion | CRM, application platform, document tools | Admissions, program office | Completed application criteria, missing document timing, program review inclusion. |
| Admit / yield / deposit | CRM, SIS, Financial Aid | Enrollment, Admissions, Finance, IR | Admit denominator, deposit definition, aid-complete denominator, census-enrolled outcome. |
| Melt | CRM, SIS, orientation, housing, aid, payment | Enrollment, Orientation, Financial Aid, Registrar, Finance | Melt from admit vs deposit; paid vs registered vs census-enrolled; term timing. |
| Retention / persistence | SIS, IR warehouse, advising outcomes | Student Success, IR, Registrar, Finance | Term-to-term vs year-to-year, full-time/part-time, transfer-in/out, online/extension, official vs operational. |
| At-risk status | LMS, SIS, advising, aid, holds, care referrals | Student Success, Academic Affairs, Financial Aid, IR | Academic vs financial vs registration vs engagement vs care risk; risk source and threshold. |
| Transfer success | Application, transcript, degree audit, SIS | Registrar, Transfer Admissions, Advising, Academic Affairs | Accepted vs applicable credits; residency rules; time-to-degree; first local term success. |
| Completion / graduation | SIS, degree audit, IR | Registrar, Academic Affairs, IR | Degree level, cohort, time horizon, program/school rollups, near-completer inclusion. |
| Net tuition / financial impact | Finance, aid, SIS, retention outcomes | Finance, Enrollment, Financial Aid | Gross vs net, aid timing, discounting, cohort attribution, retained-revenue calculation. |
| Alumni engagement / donor propensity | Advancement CRM, events, giving, career services | Advancement, Alumni Relations | Engagement-score recipe, gift attribution, event participation, career/outcomes use. |

## Activation Data Model Requirements

`USER-PROVIDED`: StudentIQX activation is in scope only when staff-initiated and human-reviewed. The governed layer must support action without becoming an autonomous actor.

| Activation object | Purpose | Minimum fields / relationships | Source or owner |
|---|---|---|---|
| Originating segment / cohort | Links action back to the reason a constituent was surfaced. | segment ID, cohort definition, score/model version, metric definition, timestamp, source systems. | StudentIQX semantic layer; business owner signs off. |
| Constituent assignment | Assigns a person to a staff owner. | constituent ID, lifecycle state, staff owner, office, assignment reason, due date, priority, access basis. | StudentIQX activation table; routed from score/segment. |
| Intervention / action record | Tracks staff action and status. | action type, status, notes category, communication/referral flag, human reviewer, timestamps, source link. | Staff user in Sigma; may reference CRM/advising action. |
| Outcome record | Logs what happened after action. | outcome type, outcome date, disposition, next action, yield/retention/completion/giving outcome link, confidence/provenance. | Staff user or integrated operational system. |
| Audit / access event | Proves governed use. | user, role, constituent, fields accessed, action taken, timestamp, policy/access rule. | Sigma/Snowflake/IAM audit. |
| Feedback aggregate | Measures whether the workflow works. | cohort, intervention type, owner/team, status distribution, outcome distribution, conversion/persistence impact, caveats. | StudentIQX analytics layer. |

## Systems-To-Persona Pain Trace

| Persona pain | System gap likely causing it | Data needed for StudentIQX |
|---|---|---|
| Enrollment teams cannot see melt risk early enough. | CRM, aid, orientation, housing, payment, registration, and SIS/census signals are owned separately. | Cross-source admit/deposit/matriculation spine plus owner-assigned action and outcome tables. |
| Counselors lack full context for outreach. | CRM does not reliably include aid, orientation, deposit, registration, and later student-success risk. | Staff-safe constituent view with source provenance and assigned outreach status. |
| Advisors inherit first-year students without pre-enrollment context. | SIS/advising handoff drops CRM/application/yield history. | Matriculation crosswalk preserving recruitment/aid/yield-risk context. |
| Risk queues are noisy or undifferentiated. | LMS, advising, holds, aid, faculty alerts, and care referrals use different risk semantics. | Risk-type model with source, threshold, owner, access rule, and outcome. |
| Financial barriers are treated like academic risk. | Student accounts/aid data not routed to Finance/Aid owners inside advising workflows. | Financial-risk flags with controlled visibility and escalation workflow. |
| Transfer students lose momentum. | Transfer-credit evaluation, degree audit, advising, and registration are not modeled as one workflow. | Accepted/applicable credit distinction, owner assignment, status, first-local-term outcome. |
| CFO cannot justify spend. | Intervention outcomes are not tied back to cohort, score, revenue, retention, or completion. | Outcome records linked to business metrics and semantic definitions. |
| IT/Data fears another silo. | Staff actions happen in point systems with no governed feedback loop. | StudentIQX activation tables with explicit source-of-truth boundaries and audit. |

## Architecture Implications For Agent 13

`HYPOTHESIS`: Agent 13 should not start with a flat "student profile" table. It should model a governed lifecycle graph with people, identities, lifecycle states, source records, metric definitions, segments/cohorts, assignments, actions, outcomes, and access policies.

Recommended conceptual entities:

- `person`
- `source_identity`
- `constituent_lifecycle_state`
- `institution_unit` / `campus` / `school_college`
- `program`
- `term`
- `application`
- `admit_deposit_yield_event`
- `enrollment_record`
- `aid_billing_barrier`
- `course_activity_signal`
- `advising_intervention`
- `transfer_credit_evaluation`
- `degree_progress`
- `metric_definition`
- `segment_or_score`
- `staff_assignment`
- `activation_action`
- `activation_outcome`
- `access_policy`
- `audit_event`

## Data-Quality Risk List

1. `VERIFY(E-002)`: Fragmentation across SIS/CRM/LMS/advising systems remains a core hypothesis to validate by account.
2. `VERIFY(E-008/E-023/E-024/E-025/E-026/E-028)`: Incumbents claim meaningful lifecycle scope; Agent 8 and Agent 16 must test whether StudentIQX is filling a real gap or duplicating existing workflows.
3. `VERIFY(E-021)`: FERPA/PII requires role-aware access, explanation, audit, and careful treatment of notes and risk scores.
4. `VERIFY(E-031)`: Metric names cannot be treated as canonical definitions; semantic definitions need owner, grain, source, timing, and inclusion/exclusion rules.
5. `VERIFY(E-030/E-038)`: System, campus, school/college, and unit ownership may split business workflow authority from data/platform authority.
6. `HYPOTHESIS`: Identity resolution can produce false matches or missed matches if source provenance and match confidence are not preserved.
7. `HYPOTHESIS`: LMS engagement signals can be misleading if interpreted without course context, faculty practices, enrollment status, and date windows.
8. `HYPOTHESIS`: Advising and care notes may include sensitive context that should not flow into broad analytics surfaces.
9. `HYPOTHESIS`: Activation records can become another silo unless action/status/outcome tables are governed and tied to source segments/cohorts.
10. `HYPOTHESIS`: Transfer-credit records require separate modeling of prior credits, accepted credits, applicable credits, and degree requirements.

## Open Questions For Agent 8

1. `GATING VERIFY`: Do target institutions value in-product staff assignment/status/outcome tracking inside StudentIQX, or do they expect StudentIQX to hand off to CRM/advising/case-management systems for all action?
2. `VERIFY`: Which source systems are most common in the actual target segment, and which are authoritative for enrollment, aid, retention, advising, and action outcomes?
3. `VERIFY`: Is the strongest first-customer signal a failed Student 360 / warehouse / student-success initiative (E-011), or a narrower melt/retention workflow with sufficient data access?
4. `VERIFY`: Does the buyer have authority to approve access to source systems and Snowflake/Sigma activation tables, or does that sit with central IT/system office?
5. `VERIFY`: Which metric families are politically contested enough to slow a demo or POC: yield/melt, retention/persistence, net tuition, transfer success, or completion?
6. `VERIFY`: Where should StudentIQX store staff action records when incumbents already own CRM/advising workflows: governed Sigma/Snowflake tables, integrated writeback to point systems, or hybrid?
