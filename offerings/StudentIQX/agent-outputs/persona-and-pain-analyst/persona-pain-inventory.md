# StudentIQX Agent 5 — Persona And Pain Inventory

Agent: `persona-and-pain-analyst`  
Stage: 1 — Commercial Scan  
Run date: 2026-07-07  
Status: Agent 5 complete; persona pains remain `HYPOTHESIS` or `VERIFY` until market conversations, Agent 7 evidence work, Agent 8 wedge validation, and later gate review.

## Executive Read

`HYPOTHESIS`: The strongest early persona cluster is not one job title. It is the cross-functional group around enrollment-to-matriculation and retention: Enrollment leadership, enrollment operations, financial aid, student success/advising, Finance, and IT/Data/Compliance.

`USER-PROVIDED`: StudentIQX is a staff-facing, complementary governed Unify + Intelligence + Activate layer, not a replacement for SIS/CRM/LMS/advising/advancement systems (E-032, E-035, E-036). Persona pain should therefore be framed as fragmented intelligence, handoff failure, metric disagreement, intervention measurement, and the missing closed loop from signal -> staff owner -> action status -> outcome - not as point-tool replacement.

`VERIFY(E-029)`: Budget authority remains unknown. This inventory separates economic buyers, veto/co-buyer roles, operational managers, and daily users so Agent 8 can test who has both pain and will to act.

`VERIFY(E-031)`: KPI conflicts are part of the pain. Personas may use the same words - yield, melt, persistence, retention, completion, risk - while meaning different populations, dates, sources, or grains.

`HYPOTHESIS`: The three-condition fit filter should be applied per persona and journey: data ownership across the workflow, student/institutional value worth optimizing, and budget plus organizational will to act.

## Buyer / User / Veto Map

| Persona | Function | Buying role | Daily user? | Primary journey stages | Fit-filter read |
|---|---|---|---|---|---|
| VP Enrollment Management | Enrollment | `HYPOTHESIS`: Economic buyer or executive sponsor | Sometimes | Recruiting, application, yield, melt | High value and will if enrollment pressure is visible; data ownership may depend on CRM, aid, SIS, and IT cooperation. |
| Director of Admissions / Enrollment Operations | Enrollment | `HYPOTHESIS`: Operational sponsor / recommender | Yes | Recruiting, application, yield, melt | Strong data and workflow pain; may lack independent budget authority. |
| Admissions Counselor / Recruiter | Enrollment | `HYPOTHESIS`: Daily user / influencer | Yes | Recruiting, application, yield | High workflow pain, low budget authority; value depends on whether better prioritization changes yield. |
| Financial Aid Leader / Aid Officer | Financial Aid | `HYPOTHESIS`: Co-owner / risk signal owner | Yes | Application, yield, melt, retention | Controls high-value affordability signals but may not own enrollment or success workflow. |
| VP Student Success / Dean of Students | Student Success | `HYPOTHESIS`: Economic buyer, sponsor, or co-sponsor | Sometimes | First-year retention, continuing retention, stop-out/re-entry | Strong mission fit; budget/will must be tested against incumbent tools and FERPA burden. |
| Academic Advisor / Success Coach | Student Success / Academic Affairs | `HYPOTHESIS`: Daily user / influencer | Yes | First-year retention, continuing retention, intervention | High pain from fragmented context; low buying authority. |
| Retention / Early-Alert Coordinator | Student Success | `HYPOTHESIS`: Operational owner / recommender | Yes | Risk, intervention, persistence | Strong workflow ownership; value depends on trusted signals and outcome logging. |
| Registrar / Transfer-Credit Leader | Registrar | `HYPOTHESIS`: Data owner / compliance-adjacent co-buyer | Sometimes | Matriculation, transfer, progression, completion | Critical data ownership; may be veto/gatekeeper more than sponsor. |
| Institutional Research / Analytics Leader | IR / Analytics | `HYPOTHESIS`: Definition owner / recommender / veto | Yes | Metric governance, executive reporting | High influence on metric trust; budget authority likely limited. |
| CFO / VP Finance | Finance | `VERIFY(E-029)`: Economic buyer, approver, veto, or passive reviewer unknown | Rarely | Yield, retention, net tuition, budget case | High value authority; daily workflow pain may be indirect. |
| CIO / CDO / VP IT | IT/Data | `HYPOTHESIS`: Required co-buyer / veto / platform sponsor | Sometimes | Source inventory, identity, access, governance | High data authority; will to act depends on business sponsor and platform readiness. |
| BI/Data Engineer / Data Steward | IT/Data/IR | `HYPOTHESIS`: Implementation owner / daily user | Yes | Data integration, quality, semantic definitions | High data pain, low economic authority; can make or break feasibility. |
| FERPA / Registrar / Privacy / Security Officer | Compliance | `VERIFY(E-021)`: Required reviewer / veto | Sometimes | FERPA access, audit, sensitive-risk workflows | High veto authority; value is risk reduction and trust, not daily optimization. |
| VP Advancement / Chief Advancement Officer | Advancement | `HYPOTHESIS`: Expansion buyer | Sometimes | Graduation, alumni, donor engagement | Plausible expansion value; less likely first wedge unless funded initiative exists. |
| Gift Officer / Alumni Relations Manager | Advancement | `HYPOTHESIS`: Daily user / influencer | Yes | Alumni engagement, segmentation, stewardship | Operational pain likely real, but first-wedge value is weaker than enrollment/retention. |
| School / College Dean or Unit Leader | Academic unit / school | `VERIFY(E-037/E-038)`: Possible sponsor if unit operates like a distinct business | Sometimes | Program enrollment, transfer/progression, retention, outcomes | High fit if local pain, data access, and budget align; weak fit if central IT controls needed data. |

## Persona Details

### 1. VP Enrollment Management

**Responsibilities:** `HYPOTHESIS`: Own enrollment targets, funnel health, admit/yield performance, class composition, net tuition coordination, and executive reporting.

**Daily workflow and tools:** `HYPOTHESIS`: Reviews CRM dashboards, application pipeline reports, source/channel performance, aid and deposit reports, admissions team activity, and census/enrollment forecasts.

**Jobs to be done:**

- `HYPOTHESIS`: Know which prospects, applicants, admits, and deposited students need attention before the class misses target, who owns follow-up, what status each intervention is in, and which outcomes came from each cohort/score.
- `HYPOTHESIS`: Coordinate Admissions, Financial Aid, Marketing, Registrar, Orientation, Housing, Finance, and academic programs around one yield picture.
- `VERIFY(E-031)`: Explain enrollment/yield/melt results using definitions that Finance, IR, Registrar, and Enrollment can trust.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: CRM engagement, application status, aid status, deposit, orientation, and registration signals are not unified into assigned staff workflows with status and outcome logging. | Lost yield, late melt response, weaker revenue predictability, staff chasing lists manually. | Recruiting, application, yield, melt |
| `VERIFY(E-031)`: Yield and melt definitions differ across offices. | Executive mistrust, disputed forecasts, slower action during peak cycle. | Yield, census/enrollment |
| `VERIFY(E-029)`: Budget sponsor for the wedge is unknown. | Even strong pain may stall if Enrollment lacks budget or Finance/CIO approval. | All enrollment stages |

### 2. Director Of Admissions / Enrollment Operations Analyst

**Responsibilities:** `HYPOTHESIS`: Manage admissions operations, funnel lists, segmentation, campaign execution, counselor territories, reporting, and operational handoffs.

**Daily workflow and tools:** `HYPOTHESIS`: CRM, application platform, document/checklist tools, campaign tools, events, spreadsheets, SIS imports, BI reports.

**Jobs to be done:**

- `HYPOTHESIS`: Build assignable work queues for incomplete applicants, admits, deposited students, and melt-risk students, with owner, status, next action, and outcome tied back to the originating segment.
- `HYPOTHESIS`: Reconcile source, status, aid, communication, event, and registration signals.
- `HYPOTHESIS`: Give counselors prioritized action lists without forcing them to interpret raw reports.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Applicant checklist, communication history, aid readiness, and program review status live in separate systems instead of an assigned completion workflow with status and outcome logging. | More manual reconciliation, missed follow-ups, slower application completion. | Application |
| `HYPOTHESIS`: Deposit does not reliably indicate registration, orientation, housing, payment, or aid readiness in a staff-owned melt workflow. | Melt risk appears too late; staff outreach is reactive and hard to tie back to yield outcome. | Yield, melt |
| `HYPOTHESIS`: Funnel lists are rebuilt manually for different leaders instead of generated as governed, assignable segments with action status and outcomes. | Staff time loss, inconsistent reporting, list fatigue. | Recruiting through matriculation |

### 3. Admissions Counselor / Recruiter

**Responsibilities:** `HYPOTHESIS`: Engage prospects/applicants, answer questions, drive application completion, support admits, and influence yield.

**Daily workflow and tools:** `HYPOTHESIS`: CRM tasks, email/SMS/phone, event attendance, application notes, territory lists.

**Jobs to be done:**

- `HYPOTHESIS`: Know who to contact today and why, accept or update assigned outreach, and log contact status/outcome without leaving the governed workflow.
- `HYPOTHESIS`: See enough aid, program, event, and application context to personalize outreach.
- `HYPOTHESIS`: Avoid duplicative or poorly timed communication.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Counselor sees CRM activity but not complete aid, orientation, deposit, or registration context inside an assigned outreach workflow. | Lower outreach relevance, missed save opportunities, student frustration, and weak outcome attribution. | Recruiting, application, yield |
| `HYPOTHESIS`: Priority lists are opaque or stale and do not track owner, status, or outcome against the originating segment. | Counselors spend time sorting instead of engaging, and leaders cannot see which actions changed yield. | Recruiting, application, yield |
| `VERIFY(E-032)`: Staff-facing scope is locked; student-facing self-service is out of canonical scope. | The counselor remains the human activation point; product value depends on better staff context. | All counselor workflows |

### 4. Financial Aid Leader / Aid Officer

**Responsibilities:** `HYPOTHESIS`: Manage aid packaging, FAFSA/aide completion, scholarship/discount processes, affordability questions, and financial barriers to enrollment/persistence.

**Daily workflow and tools:** `HYPOTHESIS`: Financial-aid system, SIS, document tools, student communications, aid reports, billing/holds coordination.

**Jobs to be done:**

- `HYPOTHESIS`: Identify students whose enrollment or persistence is blocked by affordability, missing aid steps, balances, or holds, assign the right Finance/Aid owner, and log resolution outcome.
- `HYPOTHESIS`: Coordinate with Enrollment and Student Success without exposing inappropriate information.
- `HYPOTHESIS`: Support discount/net tuition decisions with trusted context.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Aid completion and affordability signals are not visible in enrollment or advising workflows with Finance/Aid owner assignment, status, and outcome logging. | Lost yield, melt, preventable stop-outs, delayed registration. | Application, yield, retention |
| `HYPOTHESIS`: Financial risk is mixed into generic "at risk" labels instead of routed to the right staff owner with resolution status. | Wrong intervention owner; academic advisors may chase issues Finance must solve. | First-year and continuing retention |
| `VERIFY(E-021)`: Aid-related student information requires careful access and audit handling. | Compliance risk and reluctance to share useful signals. | All student-level views |

### 5. VP Student Success / Dean Of Students

**Responsibilities:** `HYPOTHESIS`: Own retention strategy, advising effectiveness, early alert, student support coordination, persistence outcomes, and often student experience.

**Daily workflow and tools:** `HYPOTHESIS`: Advising/case management, LMS/early alert outputs, SIS reports, retention dashboards, committee reports, student affairs systems.

**Jobs to be done:**

- `HYPOTHESIS`: Detect risk early enough for staff to intervene, assign the intervention owner, track status, and connect the action to persistence outcome.
- `HYPOTHESIS`: Separate academic, financial, registration, engagement, wellness/care, and administrative risks.
- `VERIFY(E-031)`: Report retention/persistence outcomes using trusted definitions across IR, Academic Affairs, Finance, and Student Success.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: LMS, advising notes, SIS grades/registration, holds, aid, and support referrals produce separate risk pictures instead of one owner-assigned intervention workflow. | Reactive support, missed interventions, advisor overload, retention loss. | First-year and continuing retention |
| `HYPOTHESIS`: Intervention outcomes are not consistently logged or linked to persistence outcomes. | Cannot prove what works; budget case weakens. | Intervention, persistence |
| `VERIFY(E-017/E-018)`: Graduation and first-year retention are externally visible benchmark pressures. | Mission, reputation, and revenue consequences make this a serious but evidence-sensitive wedge. | Retention, completion |

### 6. Academic Advisor / Success Coach

**Responsibilities:** `HYPOTHESIS`: Support students with course planning, registration, academic progress, referrals, risk response, and persistence.

**Daily workflow and tools:** `HYPOTHESIS`: Advising platform, SIS, degree audit, LMS signals, notes, email/calendar, referral systems, spreadsheets.

**Jobs to be done:**

- `HYPOTHESIS`: Understand why a student is at risk before the advising interaction and which intervention, owner, status, and outcome are already attached to the student.
- `HYPOTHESIS`: See pre-enrollment context, aid/hold issues, academic progress, engagement, and prior outreach in one staff-safe activation workflow.
- `HYPOTHESIS`: Log intervention outcomes without duplicate entry.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Advisors inherit first-year students without admissions context, melt-risk history, assigned follow-up, or prior outreach outcome. | First-term support misses known risk factors. | Matriculation, first year |
| `HYPOTHESIS`: Degree audit, LMS, holds, advising notes, and faculty alerts are separate instead of one routed intervention workflow. | Advisors lose time hunting context; students receive generic guidance. | First-year and continuing retention |
| `HYPOTHESIS`: Transfer students appear as continuing students but lack local context, assigned onboarding owner, and credit/progress resolution status. | Poor transfer onboarding, credit confusion, delayed progress. | Transfer entry, progression |

### 7. Retention / Early-Alert Coordinator

**Responsibilities:** `HYPOTHESIS`: Maintain early-alert processes, risk lists, outreach queues, escalation workflows, intervention campaigns, and outcome reporting.

**Daily workflow and tools:** `HYPOTHESIS`: Early-alert platform, advising/case management, LMS exports, SIS reports, communication tools, spreadsheets.

**Jobs to be done:**

- `HYPOTHESIS`: Turn fragmented risk signals into actionable staff queues with owner assignment, intervention status, escalation, and outcome logging.
- `HYPOTHESIS`: Route the right risk to the right owner.
- `HYPOTHESIS`: Measure intervention effectiveness across cohorts, programs, and risk types.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Risk signals are not explained by source or risk type and are not consistently converted into assigned, tracked interventions. | Staff distrust scores, over-contact students, or miss true risks. | Risk, intervention |
| `HYPOTHESIS`: Outreach occurs in multiple tools without a shared action/outcome log. | No feedback loop; hard to improve retention programs. | Intervention, persistence |
| `VERIFY(E-021)`: Student-level risk views need FERPA-safe access, audit, and human review. | Compliance concern can block useful analytics. | Risk, intervention |

### 8. Registrar / Transfer-Credit Leader

**Responsibilities:** `HYPOTHESIS`: Maintain student records, registration, degree/certificate rules, transfer-credit evaluation, census/freeze data, completion certification, and policy interpretation.

**Daily workflow and tools:** `HYPOTHESIS`: SIS, degree audit, transcript systems, catalog, registration, transfer-credit tools, reporting extracts.

**Jobs to be done:**

- `HYPOTHESIS`: Ensure status, credits, program, enrollment, and completion records are correct and policy-compliant.
- `HYPOTHESIS`: Help academic and advising teams understand transfer credit and degree applicability, assign resolution owners, and log applicability outcomes.
- `VERIFY(E-031)`: Protect official definitions while supporting operational views.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Accepted transfer credits may not map cleanly to degree applicability or an assigned resolution workflow. | Transfer students lose time, momentum, and trust; completion pathway becomes unclear. | Transfer, progression |
| `HYPOTHESIS`: Official census/completion data differs from operational lists. | Reporting disputes and mistrust of dashboards. | Enrollment, persistence, graduation |
| `VERIFY(E-021)`: Registrar often intersects with FERPA interpretation. | Access constraints can slow cross-office intelligence. | All student record views |

### 9. Institutional Research / Analytics Leader

**Responsibilities:** `HYPOTHESIS`: Produce official reporting, institutional metrics, cohort analysis, retention/graduation reporting, accreditation support, and executive analytics.

**Daily workflow and tools:** `HYPOTHESIS`: Data warehouse, BI tools, SIS extracts, survey/reporting tools, IPEDS/accreditation reporting, spreadsheets.

**Jobs to be done:**

- `VERIFY(E-031)`: Define metric owner, grain, source, timing, and inclusion/exclusion rules.
- `HYPOTHESIS`: Reconcile operational views with official reporting.
- `HYPOTHESIS`: Help leaders trust cross-office dashboards.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `VERIFY(E-031)`: Same KPI names hide conflicting definitions. | Dashboard disputes, delayed decisions, weak executive confidence. | All stages |
| `HYPOTHESIS`: IR is asked to reconcile downstream data quality after systems already diverged. | Reporting burden, manual cleanup, slow analytics delivery. | Metric governance |
| `HYPOTHESIS`: Business offices may bypass IR with local reports. | Competing truths and political friction. | Executive reporting |

### 10. CFO / VP Finance

**Responsibilities:** `HYPOTHESIS`: Own institutional financial planning, budget approval, revenue forecasting, net tuition economics, cost controls, and investment prioritization.

**Daily workflow and tools:** `HYPOTHESIS`: Finance systems, budget tools, enrollment forecasts, tuition/aid reports, BI dashboards, executive packets.

**Jobs to be done:**

- `VERIFY(E-029)`: Determine whether StudentIQX is funded by Enrollment, Student Success, IT/Data, Finance, a president/provost initiative, or shared budget.
- `HYPOTHESIS`: Understand revenue consequences of yield, melt, retention, discounting, and completion.
- `HYPOTHESIS`: Decide whether a data/analytics investment has credible payback or strategic value.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Enrollment, retention, and finance reports use different timing and definitions. | Weak revenue forecast confidence; budget decisions lag. | Yield, retention, finance planning |
| `HYPOTHESIS`: Retention interventions are not tracked from originating score/cohort to staff action, outcome, and financial impact. | Hard to justify spend or prioritize programs. | Retention, intervention |
| `VERIFY(E-029)`: CFO role may be sponsor, approver, veto, or passive reviewer. | Sales motion can stall if budget authority is misidentified. | All wedges |

### 11. CIO / CDO / VP IT

**Responsibilities:** `HYPOTHESIS`: Govern platforms, integrations, security, data architecture, identity/access, vendor risk, and operational feasibility.

**Daily workflow and tools:** `HYPOTHESIS`: SIS/CRM/LMS integration stack, data warehouse, identity/access systems, BI/Sigma, security/audit tools, project portfolio tools.

**Jobs to be done:**

- `HYPOTHESIS`: Determine whether source systems, access controls, data quality, and architecture can support staff-facing student intelligence.
- `VERIFY(E-030/E-038)`: Resolve whether authority sits at institution, system, school/college, campus, or unit level.
- `USER-PROVIDED`: Preserve StudentIQX as a complementary governed layer, not a replacement for incumbent systems.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Business offices want unified intelligence but source-system ownership is distributed. | Slow delivery, unclear ownership, integration backlog. | Source inventory, identity, all workflows |
| `VERIFY(E-038)`: School/college business autonomy may not match technology autonomy. | Buyer and platform authority may be mismatched. | Large universities, schools/colleges |
| `VERIFY(E-021)`: FERPA/PII access and audit requirements shape feasibility. | Risk review can block or slow implementation. | All student-level views |

### 12. BI/Data Engineer / Data Steward

**Responsibilities:** `HYPOTHESIS`: Build data pipelines, model entities, maintain data quality, reconcile records, support BI, and operationalize semantic definitions.

**Daily workflow and tools:** `HYPOTHESIS`: Snowflake/warehouse, ETL/ELT, source extracts/APIs, BI/Sigma, data catalog, issue tickets, spreadsheets.

**Jobs to be done:**

- `HYPOTHESIS`: Resolve identity across prospect, applicant, student, graduate, and alumnus records.
- `HYPOTHESIS`: Model lifecycle stage, metric definitions, source freshness, data quality, and action/outcome feedback loops.
- `VERIFY(E-031)`: Support multiple governed definitions where offices legitimately differ.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Identity keys and grains differ across CRM, SIS, LMS, advising, and advancement systems. | Incorrect joins, duplicate records, mistrusted 360 views. | All lifecycle stages |
| `HYPOTHESIS`: Business users ask for "one number" when definitions differ. | Brittle dashboards, rework, political disputes. | Metric governance |
| `HYPOTHESIS`: Activation outcomes are not modeled back into the warehouse. | Intelligence cannot learn from staff action. | Intervention, activation audit |

### 13. FERPA / Privacy / Security Reviewer

**Responsibilities:** `VERIFY(E-021)`: Review student-record access, PII exposure, role-based permissions, auditability, data sharing, and acceptable uses of analytics/AI.

**Daily workflow and tools:** `HYPOTHESIS`: Policy review, identity/access tools, security review, audit logs, vendor risk processes, registrar/compliance workflows.

**Jobs to be done:**

- `VERIFY(E-021)`: Ensure education records and PII are handled appropriately.
- `HYPOTHESIS`: Approve staff-level access rules by role, purpose, and lifecycle stage.
- `HYPOTHESIS`: Require explanation and human review for student-risk analytics.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Useful risk signals may be overexposed or under-shared because rules are unclear. | Either compliance risk or missed intervention opportunity. | Risk, intervention |
| `HYPOTHESIS`: AI or predictive signals lack clear audit/explanation. | Trust and approval barriers. | Student-level intelligence |
| `HYPOTHESIS`: Access is managed system by system. | Inconsistent permissions across lifecycle views. | All staff-facing surfaces |

### 14. VP Advancement / Chief Advancement Officer

**Responsibilities:** `HYPOTHESIS`: Own fundraising strategy, alumni engagement, annual giving, major gifts, campaign performance, stewardship, and advancement operations.

**Daily workflow and tools:** `HYPOTHESIS`: Advancement CRM, donor database, events, email/marketing tools, prospect research, giving systems, campaign reports.

**Jobs to be done:**

- `HYPOTHESIS`: Segment alumni and donors by affinity, engagement, program, giving potential, and stewardship needs, assign cultivation/stewardship owners, and log outcomes.
- `HYPOTHESIS`: Connect student experience, degree/program history, career outcomes, and alumni engagement where permitted.
- `HYPOTHESIS`: Prove campaign and engagement impact.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: Graduation-to-alumni identity handoff is incomplete or delayed and not routed as an assigned handoff workflow. | Weak early alumni engagement and missed affinity windows. | Graduation, alumni |
| `HYPOTHESIS`: Advancement CRM lacks governed student lifecycle context, owner-assigned cultivation actions, and outcome logging tied to the original segment. | Generic segmentation, weaker stewardship, missed giving opportunities. | Alumni, donor cultivation |
| `VERIFY(E-032)`: Student-facing alumni portal scope is out; staff-facing advancement intelligence is allowed. | Advancement value must be framed as staff intelligence, not a new alumni portal. | Alumni expansion |

### 15. School / College Dean Or Unit Leader

**Responsibilities:** `VERIFY(E-037/E-038)`: In large universities, schools/colleges may operate like distinct business units with their own program enrollment, student success, outcomes, and reporting needs while technology authority may remain central.

**Daily workflow and tools:** `HYPOTHESIS`: Program dashboards, admissions/enrollment reports, student-success reports, finance reports, school-local CRM/advising tools, central SIS/BI outputs.

**Jobs to be done:**

- `HYPOTHESIS`: Understand funnel health, program demand, student progress, completion, and outcomes at the school/program level.
- `VERIFY(E-038)`: Navigate mismatch between local business ownership and central technology/data authority.
- `HYPOTHESIS`: Sponsor a unit-level diagnostic or POC if data access and governance are feasible.

**Fragmentation pains and impact:**

| Pain | Business impact | Journey stages |
|---|---|---|
| `HYPOTHESIS`: School-local processes do not map cleanly to central university data. | Unit leaders cannot act quickly or prove local needs. | Enrollment, retention, progression |
| `VERIFY(E-030/E-038)`: Buyer may not own platform authority, and platform owner may not own the workflow pain. | Sales and implementation path become complex. | School/college variants |
| `HYPOTHESIS`: Unit-specific KPIs may differ from institution-wide definitions. | Central dashboards may be perceived as irrelevant locally. | Metric governance |

## Pain Themes By Journey

| Journey | Highest-pain personas | Current-state pain | Business impact |
|---|---|---|---|
| Enrollment yield / melt | VP Enrollment, Admissions Ops, Financial Aid, Counselors, CFO | `HYPOTHESIS`: Fragmented CRM, application, aid, deposit, orientation, housing, registration, and payment signals are not converted into governed owner-assigned action queues. | Lost yield, late melt response, unstable revenue forecasts, manual staff work, weak attribution of action to yield. |
| First-year retention | VP Student Success, Advisors, Early-Alert Coordinator, Financial Aid, IT/Data, Compliance | `HYPOTHESIS`: Advisors inherit students without pre-enrollment context; LMS/SIS/advising/aid signals split risk into partial views without consistent assignment/status/outcome tracking. | Preventable attrition, staff overload, weak intervention measurement. |
| Continuing retention / progression | Advisors, Registrar, Academic Affairs, Finance, Student Success | `HYPOTHESIS`: Major changes, transfer-out risk, aid exhaustion, holds, course sequencing, and near-completion risk are not separated into routed workflows. | Delayed completion, stop-out, transfer-out, financial loss, student dissatisfaction. |
| Transfer entry | Registrar, Transfer Admissions, Advisors, Program Leaders, Student Success | `HYPOTHESIS`: Prior-credit data, degree applicability, advising, and first local term success are poorly connected to assigned resolution workflows. | Lost transfer yield, poor onboarding, delayed time-to-degree. |
| Advancement / alumni | CAO, Advancement Services, Gift Officers, Alumni Relations | `HYPOTHESIS`: Student history and alumni identity/engagement are weakly connected to assigned cultivation or stewardship actions. | Missed engagement and giving opportunities; weaker segmentation. |
| IT/Data/Compliance | CIO/CDO, Data Engineer, IR, FERPA/Security | `HYPOTHESIS`: Data ownership, identity resolution, semantic definitions, access, and audit are fragmented. | Feasibility risk, compliance risk, slow delivery, mistrusted intelligence. |

## Commercial Implications For Agent 8

1. `HYPOTHESIS`: The most testable first wedge is a staff-facing Enrollment + Student Success motion around melt and first-year retention, with Finance and IT/Data as required validation personas.
2. `VERIFY(E-029)`: Agent 8 must determine whether the budget comes from Enrollment, Student Success, Finance/president/provost, IT/Data, or shared transformation funds.
3. `VERIFY(E-030/E-038)`: Agent 8 must identify whether the first sale is campus-led, system-led, school-led, or unit-led.
4. `VERIFY(E-031)`: Agent 8 should treat metric-definition pain as part of the value proposition only if buyers acknowledge that semantic governance is a real pain, not just an implementation detail.
5. `HYPOTHESIS`: Transfer and continuing-retention use cases may become stronger wedges for public regional, community college, online/extension, or adult learner-heavy contexts than a traditional first-time first-year story.
6. `VERIFY(E-032/E-035/E-036)`: Persona messaging must stay complementary and staff-facing: "make existing systems intelligible and actionable" rather than "replace CRM/SIS/advising."
7. `VERIFY(E-039/E-040)`: Public, private, and small liberal arts contexts may change who participates in the buying committee and how many personas must approve a POC; validate whether fewer layers actually creates more will to act.
8. `VERIFY(E-032/E-035/E-036)`: Agent 8 must score in-product staff activation as a differentiator candidate, not just unified intelligence. The validation question is whether institutions value StudentIQX assignment/status/outcome tracking inside the governed layer, or prefer StudentIQX to trigger/action through incumbent CRM, advising, or case-management tools.

## Inputs For Agent 6

- `HYPOTHESIS`: Map each persona to source systems, role-based permissions, and authoritative data ownership.
- `VERIFY(E-031)`: Build a metric-definition matrix by persona, not only by KPI name.
- `VERIFY(E-021)`: Separate staff action surfaces from sensitive data and AI/risk signals that need access control, explanation, audit, and human review.
- `VERIFY(E-030/E-038)`: Capture whether data ownership sits centrally, locally, or split by school/campus/unit.
- `HYPOTHESIS`: Model action/outcome feedback loops for counselor outreach, advising intervention, aid escalation, transfer-credit resolution, and advancement stewardship.
