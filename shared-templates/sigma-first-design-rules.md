# Sigma-First Design Rules

## Purpose

This file teaches IQX agents how to translate personas, jobs to be done, pain points, use cases, and activation workflows into Sigma-realizable prototype experiences.

Use this file with:

- `product-doctrine.md`
- `sigma-capability-matrix.yaml`
- `sigma-workbook-as-code-rules.md`
- `snowflake-platform-rules.md`
- `activation-data-patterns.md`

The goal is not to design the fanciest possible app. The goal is to design the clearest Sigma-native or Sigma-approximate expression of an IQX customer intelligence and activation offering.

## Core Rule

Design in Sigma first.

Every canonical prototype experience must be expressible as a Sigma workbook/application experience backed by Snowflake data, metrics, semantic definitions, activation state, and audit logs.

React may inspire visual exploration, but it must not define canonical scope.

## Design Translation Flow

Agents must translate each use case through this flow:

```text
Persona
-> Job to be done
-> Pain point
-> Product remedy
-> Decision or action enabled
-> Required data
-> Required metric or intelligence output
-> Snowflake object
-> Sigma page pattern
-> Sigma elements
-> Activation surface, if applicable
-> Measurable business outcome
```

If any link is missing, flag the gap before producing the prototype spec.

## Canonical Sigma Page Patterns

### Executive Overview

Use when the buyer or executive persona needs to understand the business value quickly.

Typical elements:

- KPI charts
- Trend charts
- Bar or combo charts
- High-level segment summary table
- Text annotations for the before/after story
- Controls for time period, region, business unit, or product line

Good for:

- Revenue impact
- Retention/churn reduction
- Conversion lift
- Cost-to-serve reduction
- Engagement improvement
- Pipeline or opportunity value

Avoid:

- Too many KPIs
- Operational detail
- Generic dashboard metrics not tied to the wedge

### Manager / Operator View

Use when the working persona needs to find where to act.

Typical elements:

- Filterable table
- Risk or opportunity score columns
- Segment controls
- Priority rankings
- Bar/scatter/combo chart for triage
- Recommendation summary text

Good for:

- Which customers need attention
- Which audiences are ready for activation
- Which accounts or constituents are underperforming
- Which recommendations are highest priority

Avoid:

- Custom task-board interactions
- Drag-and-drop prioritization
- Complex workflow state that is not backed by Snowflake tables

### Customer / Constituent 360 Drilldown

Use when the demo needs to show the "whole customer" story.

Typical elements:

- Detail table filtered to one customer/account/household/etc.
- Timeline or event table
- KPI or score summary
- Segment membership table
- Recommendation table
- Recent interactions table
- Consent or eligibility fields where relevant

Good for:

- Showing fragmented data unified into a coherent profile
- Explaining why a recommendation exists
- Demonstrating trust and context

Avoid:

- Custom profile-card layouts that cannot be represented in Sigma
- Timeline UI that depends on custom React components
- Data not traceable to the Customer 360 model

### Segment / Audience Explorer

Use when the persona needs to build, inspect, or refine a cohort.

Typical elements:

- Controls for dimensions, thresholds, and eligibility
- Filterable customer or account table
- Segment size KPI
- Value/risk/opportunity summary
- Distribution charts
- Activation-readiness flags

Good for:

- Propensity-based audience selection
- Churn risk cohorts
- Cross-sell opportunities
- Loyalty or engagement segments
- Suppression and consent-aware targeting

Avoid:

- Freeform visual segment builders
- Node-based audience logic
- Drag-and-drop rule builders

Sigma approximation:

- Use controls, filters, score thresholds, and a Snowflake-backed audience table.

### Recommendation Review

Use when the product provides an insight or AI-assisted recommendation.

Typical elements:

- Recommendation table
- Explanation columns
- Confidence or score columns
- Recommended action/channel
- Eligibility and compliance flags
- Expected impact metrics
- Controls for risk, value, channel, or campaign

Good for:

- Next best action
- Next best offer
- Churn intervention
- Cross-sell recommendation
- Service recovery recommendation

Avoid:

- Black-box recommendations with no explanation
- Chat-only recommendation experiences
- Recommendations not stored or reproducible in Snowflake

### Activation Review / Readiness

Use when the persona needs to prepare or review an action.

Typical elements:

- Activation audience table
- Activation request/status table
- Campaign or channel payload preview table
- Suppression/consent checks
- Count and value KPIs
- Exceptions or warnings table

Good for:

- Audience handoff
- Campaign readiness
- Partner/channel export review
- Sales/service action queues

Avoid:

- Button-only activation flows
- Unlogged approvals
- Multi-step wizards as canonical behavior

Sigma approximation:

- Show activation state in Snowflake-backed tables and use pages/sections to represent workflow stages.

### Performance Measurement

Use when the demo needs to close the loop.

Typical elements:

- Trend charts
- KPI charts
- Segment performance table
- Lift or delta views
- Campaign/action outcome table
- Controls for time period, cohort, or channel

Good for:

- Measuring whether activation worked
- Showing revenue/conversion/retention lift
- Demonstrating learning-loop potential

Avoid:

- Outcome claims not supported by synthetic data
- Metrics not linked to the value case

## Common Sigma-Native Element Choices

Use these defaults unless the use case clearly requires otherwise:

| Need | Preferred Sigma Pattern |
|---|---|
| Show an important business outcome | KPI chart |
| Compare categories | Bar chart |
| Show trend over time | Line chart |
| Show volume and rate together | Combo chart |
| Explore relationship between two scores | Scatter chart |
| Review customers/accounts/audiences/actions | Table |
| Summarize by dimensions | Pivot table |
| Filter by segment, region, product, stage | List control |
| Filter by score or threshold | Slider or range slider |
| Filter by date window | Date range control |
| Toggle eligibility or active state | Checkbox or switch |
| Explain recommendation logic | Table columns plus concise text |
| Show workflow status | Snowflake-backed status fields in a table |

## Sigma Approximation Patterns

When a custom app pattern appears, convert it to a Sigma approximation.

| Custom App Pattern | Sigma Approximation |
|---|---|
| Multi-step wizard | Separate Sigma pages or sections with Snowflake-backed status fields |
| Drag-and-drop journey builder | Table with ordered steps, controls, and activation status |
| Modal detail view | Dedicated detail page or filtered drilldown section |
| Tabbed interface | Separate workbook pages or stacked sections |
| Editable form | Activation request table and review surface; mark manual-build if input behavior is required |
| Kanban/task board | Prioritized table grouped by status, owner, or stage |
| Chat panel | Snowflake AI output table plus recommendation/explanation review in Sigma |
| Command palette | Controls and navigation pages |
| Card grid | Table or grouped table with key fields and conditional formatting |

## Page Inventory Rules

An IQX prototype should usually have 3 to 5 canonical Sigma pages:

- Executive overview
- Persona/operator workflow
- Customer/constituent 360 drilldown
- Segment/audience/recommendation review
- Activation/performance measurement

Do not create excessive navigation. The prototype should tell a sharp sales story.

Every page must have:

- Persona served
- Job to be done
- Business question answered
- Required Snowflake source
- Required metrics
- Sigma elements
- Feasibility classification
- Demo storyline role

## Data Binding Rules

Every Sigma element must map to a Snowflake object or governed metric.

Use this mapping format:

```yaml
page:
element:
element_type:
business_purpose:
snowflake_dependency:
  layer:
  object:
  fields:
metrics:
controls:
feasibility_classification:
```

If the Snowflake object does not exist in the data model spec, the agent must add it as a required downstream dependency.

## Metric Design Rules

Metrics must be:

- Persona-relevant
- Decision-relevant
- Defined consistently
- Traceable to Snowflake
- Supported by synthetic data
- Used in the demo storyline

Avoid vanity KPIs. If a metric does not help the persona decide, prioritize, approve, intervene, or measure, remove it.

## AI Experience Rules

AI-assisted moments must be expressed as reviewable outputs, not magic.

Good Sigma-first AI patterns:

- Recommendation table with explanation and confidence fields
- Summary text sourced from Snowflake AI output
- Search/result table sourced from Snowflake Cortex Search
- Natural-language insight result represented as generated fields or analysis outputs
- Exception list generated by model/scoring logic

Avoid:

- Chat-only user experiences as canonical Sigma scope
- Unreviewed automated decisions
- AI claims without Snowflake data lineage
- AI features not tied to a job to be done

## Activation UX Rules

Activation is a governed workflow, not a decorative interaction.

The Sigma surface should show:

- Who or what is being activated
- Why it was selected
- Recommended action or channel
- Eligibility and suppression/consent status
- Expected value or outcome
- Current activation status
- Audit/log fields
- Performance result after action

If approve/edit/reject behavior cannot be represented in workbook-as-code, classify it as `Requires manual Sigma build` or `Sigma-approximate` and preserve the canonical state in Snowflake.

## React Divergence Control

If a React sketch is created, Agent 21 must produce a React divergence register.

No React idea may enter canonical scope unless it has:

- A Sigma-native implementation, or
- A Sigma approximation that preserves the business workflow, or
- A manual Sigma build path explicitly documented

React-only behavior must remain aspirational and outside the canonical prototype.

## Sigma Feasibility Matrix Entry

Every meaningful interface pattern should be documented like this:

```yaml
interaction:
persona:
job_to_be_done:
sigma_classification:
sigma_implementation:
snowflake_dependency:
manual_sigma_work_required:
react_allowed:
canonical:
notes:
```

## Agent 21 Output Standard

Agent 21 must produce:

- Persona workflow maps
- Sigma-native page and screen inventory
- Sigma feasibility matrix
- Sigma workbook build spec
- Snowflake data dependency map
- Activation workflow spec
- Optional React visualization sketch spec
- React divergence register

The Sigma workbook build spec should be detailed enough for a builder to implement, but should not claim to be a validated API payload unless validated against Sigma's current workbook-as-code schema.

## Agent 23 Review Standard

Agent 23 must fail launch readiness if:

- The Sigma feasibility matrix is missing or incomplete.
- Any canonical flow depends on React-only behavior.
- Any page lacks a Snowflake dependency.
- Any metric lacks a consistent definition.
- Any activation flow lacks Snowflake auditability.
- Unsupported Sigma features are presented as canonical.
- Synthetic data does not support the storyline.

## Design Quality Bar

A strong Sigma-first prototype feels like a credible business application built in Sigma, not a generic dashboard and not a fantasy React app.

It should:

- Tell a clear before/after fragmentation story.
- Serve real personas and jobs to be done.
- Show only the metrics needed to act.
- Make the next action obvious.
- Preserve trust through explanation, lineage, and auditability.
- Stay honest about Sigma and Snowflake capabilities.
