# Sigma Workbook-As-Code Rules

## Purpose

This file defines how IQX agents should reason about Sigma workbook-as-code when designing and specifying the canonical IQX prototype experience.

Agents should use this file when creating:

- Sigma-native prototype page inventories
- Sigma workbook build specs
- Sigma feasibility matrices
- React divergence registers
- Launch-readiness assessments

The canonical IQX front end is Sigma. React may only sketch ideas that are either Sigma-realizable, Sigma-approximate, or explicitly marked aspirational.

## Source Basis

These rules are distilled from:

- Sigma documentation: Manage workbooks as code
- Sigma Public REST API OpenAPI file
- Sigma API authentication skill notes
- IQX product doctrine

The Sigma workbook-as-code feature is beta. Recheck official Sigma documentation and the OpenAPI schema before creating implementation-ready API payloads.

## Core Platform Facts

Sigma workbook-as-code allows a workbook to be represented as JSON or YAML and managed through the Sigma API.

The workbook representation can describe:

- Workbook structure
- Data sources referenced by the workbook
- Pages
- Elements
- Element configuration
- Canvas layout

The workbook representation does not contain the source data itself. Data must live in Snowflake or another connected data platform.

The OpenAPI file confirms these workbook spec endpoints:

```text
POST /v2/workbooks/spec
GET  /v2/workbooks/{workbookId}/spec
PUT  /v2/workbooks/{workbookId}/spec
```

Use these conceptually as:

- `POST`: create a workbook from a full code representation.
- `GET`: retrieve the full code representation of an existing workbook.
- `PUT`: update a workbook from a full code representation.

## Full-Representation Rule

Agents must assume workbook updates are full-representation updates, not partial patches.

For any update workflow:

1. Retrieve the current workbook representation.
2. Modify the representation.
3. Submit the complete updated representation.

Do not design agent workflows that depend on partial workbook patches unless the official Sigma API explicitly supports that operation for the target endpoint.

## Schema Version Rule

Workbook code representations must include a `schemaVersion` field.

Agents must:

- Preserve `schemaVersion` when modifying retrieved specs.
- Include `schemaVersion` when creating new workbook specs.
- Avoid inventing a schema version if the current official docs or retrieved examples specify a different value.

## Access And Permission Rule

Workbook-as-code operations require appropriate Sigma permissions.

Agents must assume the API user needs:

- Valid Sigma API credentials.
- Access to the correct Sigma API base URL for the organization region.
- Permission to create, edit, and publish workbooks as applicable.
- Edit access to the target workbook for updates.
- Access to referenced folders, connections, and data sources.

Operational API instructions must never expose client secrets, bearer tokens, or credentials in logs or files.

## Supported Elements In Workbook-As-Code

The workbook-as-code beta supports common analytical workbook elements.

Agents may classify the following as workbook-as-code-supported, subject to current Sigma documentation and OpenAPI validation:

- Tables
- Pivot tables
- Controls
- Bar charts
- Line charts
- Donut charts
- Pie charts
- KPI charts
- Combo charts
- Scatter charts
- Area charts
- Containers
- Text elements
- Image elements
- Divider elements

These are good default building blocks for IQX Sigma prototypes.

## Unsupported Or Restricted Elements

Agents must not present unsupported workbook-as-code features as canonical generated workbook behavior.

The workbook-as-code beta documentation identifies several unsupported areas. Treat these as manual-build, Sigma-approximate, or aspirational until official docs say otherwise:

- Python elements
- Input tables
- Buttons
- Embeds
- Plugins
- Value lists
- Action sequences
- Modals
- Tabs / tabbed containers
- Repeated containers
- Forms
- Popovers
- Single-row containers
- Advanced workbook or page settings not represented in the workbook spec
- Map charts
- Sankey charts
- Funnel charts
- Gauge charts
- Box plot charts
- Waterfall charts

If an IQX workflow needs one of these features, the agent must classify it in the Sigma feasibility matrix as one of:

- `Requires manual Sigma build`
- `Currently unsupported / aspirational`
- `React-only, not allowed in canonical prototype`

## Sigma Feasibility Classification

Every proposed interface pattern in Agent 21 output must receive one of these classifications:

```text
Sigma-native
Sigma-approximate
Requires manual Sigma build
Currently unsupported / aspirational
React-only, not allowed in canonical prototype
```

Use the classifications as follows:

`Sigma-native`: The experience can be represented with supported Sigma workbook-as-code primitives.

`Sigma-approximate`: The business workflow can be represented in Sigma, but not with the exact interaction style a custom app might use.

`Requires manual Sigma build`: Sigma UI may support the idea, but workbook-as-code does not currently represent it cleanly.

`Currently unsupported / aspirational`: The idea may be valuable, but should not be part of the canonical prototype.

`React-only, not allowed in canonical prototype`: The idea belongs only in a non-canonical React sketch and must not influence committed Sigma scope.

## Preferred IQX Sigma Patterns

Agents should favor patterns that fit Sigma well:

- Executive overview page with KPI elements and trend charts
- Persona-specific operational page with tables, filters, and recommended actions
- Customer, account, household, fan, student, member, donor, or patient 360 drilldown page
- Segment or audience explorer with controls and filterable tables
- Recommendation review page using tables, score columns, and explanatory text
- Activation readiness page backed by Snowflake activation tables
- Performance measurement page with conversion, retention, revenue, engagement, or cost-to-serve metrics
- Data quality or identity-confidence page where relevant to the sales story

Agents should avoid making the Sigma prototype feel like a custom SaaS app unless the interaction is clearly Sigma-native or Sigma-approximate.

## Data Source Rule

Workbook specs should point at curated Snowflake data structures, not raw synthetic files.

Preferred source pattern:

```text
Snowflake RAW_SYNTHETIC
-> Snowflake CORE
-> Snowflake MART_SIGMA
-> Sigma workbook
```

Agents must map each Sigma page or element to one or more:

- `MART_SIGMA` views
- `SEMANTIC` definitions
- `ACTIVATION` tables
- `GOVERNANCE` constraints

If a Sigma element cannot be tied to a Snowflake object or governed metric, the agent must flag the gap.

## Metrics Rule

Agents must avoid scattering metric logic across Sigma workbooks, React prototypes, and prose artifacts.

For canonical IQX prototypes:

- Business metrics should be defined in the use-case library.
- Governed formulas should be represented in Snowflake semantic or mart definitions where feasible.
- Sigma workbook specs should consume or display those metrics consistently.
- Any Sigma-only formula must be documented and justified.

Metric names, formulas, time grains, comparison periods, and "higher/lower is better" direction must remain consistent across:

- Agent 12 use-case output
- Agent 13 Snowflake data model
- Agent 21 Sigma workbook spec
- Agent 22 synthetic data
- Agent 23 launch-readiness assessment

## Controls And Filters Rule

Controls are first-class Sigma patterns and should be used for Sigma-realizable interactivity.

Good IQX control candidates include:

- Date range
- Business unit
- Region or market
- Product line
- Lifecycle stage
- Persona-relevant segment
- Risk tier
- Propensity threshold
- Value band
- Activation eligibility
- Consent or suppression status

Agents should prefer controls and filters over custom React-style interaction patterns.

## Activation Workflow Rule

Sigma workbook-as-code may not support every activation interaction the product designer imagines.

Canonical activation must therefore be modeled in Snowflake first:

- Activation request table
- Activation output table
- Activation audit log
- Approval/rejection/defer status
- User/persona responsible
- Timestamp fields
- Compliance/consent fields
- Success-measurement fields

Sigma should expose activation workflows as review, exploration, readiness, and measurement surfaces unless richer action behavior is verified as supported.

If a workflow requires a button, action sequence, input table, form, or modal, classify it carefully:

- If Sigma UI can support it but workbook-as-code cannot, mark `Requires manual Sigma build`.
- If Sigma cannot support it in the target implementation, mark `Currently unsupported / aspirational`.
- If it only exists in React, mark `React-only, not allowed in canonical prototype`.

## React Divergence Rule

Any optional React sketch must include a divergence register.

Each divergence entry must include:

```yaml
interaction:
react_behavior:
sigma_classification:
sigma_approximation:
canonical_allowed:
aspirational_only:
reason:
```

React must not introduce net-new canonical behavior.

## Workbook Spec Output Requirements

When Agent 21 creates a Sigma workbook build spec, it must include:

- Workbook name
- Business purpose
- Target personas
- Page inventory
- Page-by-page storyline
- Elements per page
- Element type
- Element intent
- Data source or Snowflake dependency
- Required controls and filters
- Required charts/tables/KPIs
- Metric dependencies
- Activation dependencies
- Sigma feasibility classification for each pattern
- Unsupported or manual-build items
- Open questions and assumptions

The build spec should be detailed enough for a Sigma builder or AI agent to construct the workbook, but it should not pretend to be a validated API payload unless validated against the current OpenAPI schema and example library.

## API Payload Caution

Agents may draft workbook JSON/YAML only when:

- The target schema version is known.
- Required IDs are known or represented as explicit placeholders.
- Referenced connections, tables, columns, and workbooks are identified.
- The payload is validated against current Sigma docs or OpenAPI schema.

If those conditions are not met, agents should produce a workbook build spec rather than an executable payload.

## Beta Feature Caution

Workbook-as-code is beta. Agents must:

- Avoid overpromising feature coverage.
- Recheck beta docs before implementation.
- Mark beta-dependent assumptions.
- Keep unsupported features out of canonical prototype scope.
- Prefer conservative Sigma-native patterns for sales demos.

## Quality Gate Checks

Agent 23 must fail launch readiness if any of the following are true:

- The workbook spec relies on unsupported workbook-as-code features without labeling them.
- React-only behavior appears in the canonical Sigma scope.
- The Sigma feasibility matrix is missing.
- Workbook pages do not map to Snowflake data objects.
- Metrics are inconsistent with the use-case library or Snowflake data model.
- Activation behavior lacks Snowflake-backed request/output/audit structures.
- Required manual Sigma build steps are hidden or understated.

## Agent Rule Of Thumb

If the idea cannot be built in Sigma, do not make it the canonical prototype.

If the idea can be approximated in Sigma, describe the approximation and preserve the business meaning.

If the idea requires manual Sigma work, say so clearly.

If the idea is React-only, keep it out of the canonical IQX prototype.
