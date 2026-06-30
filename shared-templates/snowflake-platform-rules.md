# Snowflake Platform Rules

## Purpose

This file defines Snowflake's role in IQX and the rules agents must follow when designing data, intelligence, metrics, activation state, governance, and prototype-ready backend artifacts.

Use this file with:

- `product-doctrine.md`
- `snowflake-data-modeling-patterns.md`
- `activation-data-patterns.md`
- `sigma-first-design-rules.md`
- `sigma-workbook-as-code-rules.md`
- `quality-gates.md`

## Core Rule

Snowflake is the canonical IQX layer for:

- Data
- Metrics
- Semantic definitions
- Customer 360 entities
- Intelligence outputs
- Activation state
- Audit logs
- Consent and governance signals
- AI-enabled data workflows

Sigma is the canonical application layer. React is optional and non-canonical.

## Required Snowflake Layer Structure

Every IQX instance should use this logical layer structure unless the user explicitly overrides it:

```text
RAW_SYNTHETIC
CORE
MART_SIGMA
SEMANTIC
ACTIVATION
GOVERNANCE
```

### RAW_SYNTHETIC

Purpose:

- Holds generated demo/source data before conformance.
- Represents realistic source-system extracts.
- Supports prototype storyline and edge cases.

Typical objects:

- Source-like tables
- Synthetic event logs
- Synthetic transactions
- Synthetic profiles
- Synthetic campaign history
- Synthetic service/support interactions

Rules:

- Data should be clearly labeled synthetic.
- Data should include realistic imperfections where useful to the storyline.
- Do not include real PII.
- Include enough records to make Sigma filters, charts, and drilldowns feel credible.

### CORE

Purpose:

- Holds cleaned, conformed, identity-resolved Customer 360 entities.
- Represents the unified data foundation for IQX.

Typical objects:

- Customer / constituent master
- Account / household / organization master where relevant
- Identity map
- Interaction fact tables
- Transaction fact tables
- Campaign or journey fact tables
- Product, service, or content dimensions

Rules:

- Define grain for every table.
- Define primary/business keys.
- Document identity resolution assumptions.
- Preserve source-system lineage where useful.
- Do not design an exhaustive enterprise model; serve the approved use cases.

### MART_SIGMA

Purpose:

- Holds Sigma-ready views optimized for prototype pages and workflows.

Typical objects:

- Executive overview views
- Persona/operator workflow views
- Customer 360 drilldown views
- Segment/audience explorer views
- Recommendation review views
- Activation readiness views
- Performance measurement views

Rules:

- Every canonical Sigma page must map to one or more `MART_SIGMA` objects.
- Views should expose business-friendly column names.
- Views should minimize workbook complexity.
- Views should include fields needed for controls, filters, charts, and tables.
- Avoid forcing Sigma workbook specs to recreate complex logic that belongs in Snowflake.

### SEMANTIC

Purpose:

- Holds governed business metric and semantic definitions.
- Provides consistent business vocabulary across Snowflake, Sigma, and AI workflows.

Typical objects:

- Snowflake Semantic Views
- Metric definitions
- Entity definitions
- Dimension definitions
- Relationship definitions
- Business glossary mappings

Rules:

- Metrics should be defined once and reused consistently.
- The use-case library, Snowflake model, Sigma workbook spec, and sales narrative must use the same metric meaning.
- Semantic definitions should be used when they improve governed NLQ, Cortex Analyst, or cross-workbook consistency.
- Do not let each Sigma workbook invent separate metric logic for the same business concept.

### ACTIVATION

Purpose:

- Holds activation intent, outputs, status, payloads, and logs.

Typical objects:

- Activation requests
- Audience definitions
- Audience members
- Recommendation outputs
- Destination payloads
- Approval/rejection/defer events
- Run logs
- Sync/export logs
- Outcome measurement tables

Rules:

- Keep activation destination-neutral unless a specific destination is provided.
- Every activation use case must define who acts, what trigger applies, what is recommended, what is logged, and how success is measured.
- If Sigma cannot express the full interaction, Snowflake still owns the canonical activation state.

### GOVERNANCE

Purpose:

- Holds consent, PII classification, compliance signals, auditability, and data quality status.

Typical objects:

- PII classification table
- Consent status table
- Suppression list
- Data quality rule results
- Model/output audit log
- User/action audit log
- Retention/deletion considerations

Rules:

- Regulated or sensitive use cases must include compliance guardrails.
- Synthetic data must avoid real personal data.
- Agents must identify fields that are PII, sensitive, regulated, consent-bound, or suppression-relevant.
- Governance fields should be visible in Sigma when they affect user decisions.

## Naming Rules

Use clear, stable, business-readable object names.

Recommended patterns:

```text
RAW_SYNTHETIC.<SOURCE_SYSTEM>_<ENTITY_OR_EVENT>
CORE.DIM_<ENTITY>
CORE.FCT_<EVENT_OR_TRANSACTION>
CORE.BRIDGE_<RELATIONSHIP>
MART_SIGMA.<PAGE_OR_WORKFLOW>_VW
SEMANTIC.<BUSINESS_DOMAIN>_SEMANTIC_VIEW
ACTIVATION.<ACTIVATION_OBJECT>
GOVERNANCE.<GOVERNANCE_OBJECT>
```

Examples:

```text
RAW_SYNTHETIC.CRM_CUSTOMERS
RAW_SYNTHETIC.EMAIL_CAMPAIGN_EVENTS
CORE.DIM_CUSTOMER
CORE.FCT_PURCHASE
CORE.BRIDGE_CUSTOMER_IDENTITY
MART_SIGMA.EXECUTIVE_OVERVIEW_VW
MART_SIGMA.CHURN_RISK_REVIEW_VW
SEMANTIC.CUSTOMER_INTELLIGENCE_SEMANTIC_VIEW
ACTIVATION.AUDIENCE_REQUESTS
ACTIVATION.AUDIENCE_MEMBERS
ACTIVATION.DESTINATION_PAYLOADS
GOVERNANCE.CONSENT_STATUS
GOVERNANCE.DATA_QUALITY_RESULTS
```

Agents may adjust entity names for the industry, but must preserve the layer intent.

## Grain Rules

Every table or view must define its grain.

Examples:

```text
One row per customer
One row per customer per source system ID
One row per interaction event
One row per customer per recommendation per run
One row per audience member per activation request
One row per metric per reporting period
```

If grain is unclear, downstream metrics and Sigma visuals will be unreliable. Agents must flag unclear grain as a data model gap.

## Metric Rules

Every metric must include:

- Name
- Business definition
- Formula or derivation
- Grain
- Time grain, if relevant
- Required fields
- Higher/lower-is-better direction, if relevant
- Persona/use case served
- Snowflake source object
- Sigma page or element where it appears

Metric definitions must remain consistent across:

- Agent 12 use-case library
- Agent 13 data model
- Agent 21 Sigma workbook spec
- Agent 22 synthetic data
- Agent 23 launch-readiness assessment

If a metric is calculated in Sigma for presentation convenience, the agent must document why it is not defined in Snowflake.

## Semantic Layer Rules

Use Snowflake semantic definitions when:

- A metric is reused across pages, use cases, or personas.
- Cortex Analyst or natural-language analytics is part of the use case.
- Multiple workbooks or outputs need the same business vocabulary.
- The metric has executive or sales narrative importance.

Semantic definitions should capture:

- Entities
- Relationships
- Dimensions
- Facts
- Metrics
- Synonyms or business language where useful

Do not treat the semantic layer as an afterthought. For IQX, it is part of the credibility layer that keeps metrics consistent.

## Cortex Usage Rules

Snowflake Cortex capabilities may be proposed when they serve a clear IQX use case.

Agents must not propose generic AI features. Each AI feature must define:

- Persona
- Job to be done
- Business decision or action improved
- Required data
- Generated output or recommendation
- Review/approval path
- Audit/logging requirement
- Compliance or explainability constraint
- Sigma surface where the output is reviewed
- Snowflake object where the output is stored or derived

### Cortex Analyst

Use when the user experience requires natural-language questions over governed structured data.

Rules:

- Requires a well-defined semantic model or semantic views.
- Should not be used as a substitute for missing metrics.
- Outputs should be reviewable and explainable in Sigma or documented demo flow.

### Cortex Search

Use when the use case requires search or retrieval over unstructured or semi-structured customer information.

Good candidates:

- Support tickets
- Call transcripts
- Chat logs
- Survey responses
- Feedback comments
- Notes
- Product/content interactions

Rules:

- Define the searched corpus.
- Define what fields are indexed.
- Define the result object shown in Sigma.
- Define access controls and sensitivity concerns.

### Cortex AI Functions / AISQL

Use when the use case benefits from AI enrichment in Snowflake.

Good candidates:

- Classification
- Summarization
- Sentiment
- Entity extraction
- Recommendation explanation
- Text generation for draft messaging
- PII detection or redaction support

Rules:

- Store or materialize outputs when they affect the demo.
- Include confidence/explanation fields where relevant.
- Do not automate sensitive decisions without review.
- Recheck function availability before writing executable SQL.

### Cortex Code

Use as an implementation assistant, not as the canonical artifact store.

Good candidates:

- Drafting SQL
- Explaining SQL
- Generating model scripts
- Validating Snowflake syntax
- Assisting local repo workflows

Rules:

- Canonical artifacts still live in the IQX project files.
- Agents should output deterministic specs, DDL, SQL, and validation checks rather than relying on an interactive assistant to remember decisions.

## Synthetic Data Rules

Synthetic data must support the sales story and Sigma prototype.

It must include:

- Representative records
- Realistic distributions
- Edge cases that matter to the demo
- Enough volume for charts and filters to behave credibly
- Named demo examples for key aha moments
- Clear synthetic labeling
- No real PII

Synthetic data should support:

- Executive KPIs
- Operator triage
- Customer/constituent drilldowns
- Segment/audience exploration
- Recommendation review
- Activation readiness
- Performance measurement

## Loading Rules

For prototype planning, agents may specify Snowflake-ready assets rather than executing loads.

Expected outputs:

- CSV or Parquet files
- DDL
- Load instructions
- Data dictionary
- Data quality checks
- Sigma-ready mart views

Local file loading can be represented as:

```text
stage file
-> copy into RAW_SYNTHETIC table
-> transform to CORE
-> expose through MART_SIGMA and SEMANTIC
```

Streaming ingestion should be mentioned only when relevant to a real implementation or event-driven use case.

## Activation Destination-Neutral Rule

Do not assume a specific activation destination unless the user or industry context provides one.

Use a generic destination class:

```text
crm
marketing_automation
customer_service
ad_platform
internal_workflow
snowflake_table
manual_export
other
```

Agents must define required payload fields generically unless the destination is known.

Example destination-neutral fields:

```text
activation_request_id
audience_id
member_id
destination_class
recommended_action
payload_status
approval_status
approved_by
approved_at
sent_at
error_message
outcome_status
outcome_value
```

## Security And Governance Rules

Agents must flag:

- PII
- Sensitive attributes
- Consent-bound fields
- Suppression requirements
- Regulated data
- Explainability requirements
- Retention/deletion considerations
- Data sharing restrictions

Do not include real secrets, credentials, tokens, or real personal data in any generated artifact.

## Agent Output Requirements

### Agent 12

Must specify:

- Required entities
- Required marts
- Required metrics
- Semantic definitions
- Activation tables
- PII and consent constraints

### Agent 13

Must produce:

- Logical Customer 360 model
- Snowflake layer model
- Table/view inventory
- Grain for each object
- Keys and identity assumptions
- Source-to-target mapping
- PII classification
- Data quality risks
- Sigma-ready mart views
- Semantic definitions
- Activation and audit tables

### Agent 21

Must map every Sigma page and element to Snowflake dependencies.

### Agent 22

Must produce Snowflake-ready synthetic data assets and validation checks.

### Agent 23

Must fail readiness if Sigma pages, metrics, activation workflows, or AI features cannot be traced to Snowflake objects or documented assumptions.

## Quality Gate Failures

Fail the artifact if:

- A Sigma page has no Snowflake dependency.
- A metric is undefined or inconsistent across artifacts.
- Activation lacks request/output/audit objects.
- AI output lacks data lineage or review path.
- Synthetic data cannot support the demo storyline.
- PII or consent implications are ignored.
- React contains canonical logic not represented in Snowflake or Sigma.

## Rule Of Thumb

If Sigma is what the user sees, Snowflake is what makes it true.

Every visible IQX insight, score, metric, recommendation, activation state, and outcome should be traceable back to Snowflake or explicitly labeled as a prototype assumption.
