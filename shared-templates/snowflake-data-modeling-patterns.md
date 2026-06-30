# Snowflake Data Modeling Patterns

## Purpose

This file gives IQX agents reusable Snowflake modeling patterns for Customer 360, synthetic data, Sigma-ready marts, semantic definitions, governance, and validation.

Use this file when producing:

- Customer 360 logical data models
- Snowflake implementation specs
- Synthetic data generation specs
- Sigma-ready mart definitions
- Data dictionaries
- Data quality checks
- Launch-readiness assessments

## Modeling Principle

The data model serves the approved use cases. Do not create an exhaustive enterprise data model unless the use cases require it.

Every table, view, metric, and synthetic dataset should support at least one of:

- A named persona
- A job to be done
- A pain point remedy
- A Sigma page
- An activation workflow
- A measurable business outcome

## Required Layer Pattern

Use this logical structure:

```text
RAW_SYNTHETIC
CORE
MART_SIGMA
SEMANTIC
ACTIVATION
GOVERNANCE
```

## RAW_SYNTHETIC Patterns

RAW_SYNTHETIC represents source-like data before unification.

Common source-like tables:

```text
RAW_SYNTHETIC.CRM_CUSTOMERS
RAW_SYNTHETIC.WEB_EVENTS
RAW_SYNTHETIC.TRANSACTIONS
RAW_SYNTHETIC.CAMPAIGN_EVENTS
RAW_SYNTHETIC.SUPPORT_CASES
RAW_SYNTHETIC.CALL_CENTER_INTERACTIONS
RAW_SYNTHETIC.LOYALTY_EVENTS
RAW_SYNTHETIC.PRODUCT_USAGE_EVENTS
RAW_SYNTHETIC.SURVEY_RESPONSES
RAW_SYNTHETIC.CONSENT_EVENTS
```

Rules:

- Preserve source-system flavor in raw names and fields.
- Include source identifiers and ingestion timestamps.
- Include inconsistencies that support the fragmentation story.
- Avoid real PII.
- Use synthetic but realistic distributions.

Recommended fields:

```text
source_system
source_record_id
ingested_at
generated_scenario_id
synthetic_flag
```

## CORE Patterns

CORE represents the unified, conformed Customer 360 model.

### Entity Tables

Use `DIM_` for stable descriptive entities:

```text
CORE.DIM_CUSTOMER
CORE.DIM_ACCOUNT
CORE.DIM_HOUSEHOLD
CORE.DIM_ORGANIZATION
CORE.DIM_PRODUCT
CORE.DIM_LOCATION
CORE.DIM_CHANNEL
CORE.DIM_CAMPAIGN
CORE.DIM_PERSONA_SEGMENT
```

Common customer fields:

```text
customer_id
customer_name
customer_type
primary_email_hash
primary_phone_hash
market
region
lifecycle_stage
value_tier
engagement_tier
created_date
first_seen_date
last_seen_date
synthetic_flag
```

Do not include real email, phone, SSN, account number, or address values in synthetic demos unless they are clearly fake and safe.

### Fact Tables

Use `FCT_` for event or transaction grains:

```text
CORE.FCT_TRANSACTION
CORE.FCT_INTERACTION
CORE.FCT_CAMPAIGN_EVENT
CORE.FCT_SUPPORT_CASE
CORE.FCT_WEB_EVENT
CORE.FCT_PRODUCT_USAGE
CORE.FCT_RECOMMENDATION
CORE.FCT_SCORE_HISTORY
CORE.FCT_ACTIVATION_OUTCOME
```

Fact table rules:

- Define the event grain explicitly.
- Include event timestamp.
- Include relevant foreign keys.
- Include source system and source record where useful.
- Include fields needed for metrics and Sigma controls.

### Bridge Tables

Use `BRIDGE_` for many-to-many or identity-resolution relationships:

```text
CORE.BRIDGE_CUSTOMER_IDENTITY
CORE.BRIDGE_CUSTOMER_ACCOUNT
CORE.BRIDGE_CUSTOMER_HOUSEHOLD
CORE.BRIDGE_CUSTOMER_SEGMENT
CORE.BRIDGE_AUDIENCE_MEMBER
```

Identity bridge fields:

```text
customer_id
source_system
source_customer_id
match_method
match_confidence
is_primary
valid_from
valid_to
```

## Grain Requirements

Every table and view must state its grain.

Examples:

```text
CORE.DIM_CUSTOMER: one row per unified customer
CORE.BRIDGE_CUSTOMER_IDENTITY: one row per unified customer per source-system identity
CORE.FCT_TRANSACTION: one row per transaction
CORE.FCT_SCORE_HISTORY: one row per customer per score type per scoring run
ACTIVATION.AUDIENCE_MEMBERS: one row per activation request per audience member
MART_SIGMA.CHURN_RISK_REVIEW_VW: one row per customer eligible for churn intervention
```

If the grain cannot be stated in one sentence, the model is not ready.

## Identity Resolution Pattern

For prototypes, identity resolution can be simplified but must be explicit.

Required assumptions:

- Which source IDs are linked.
- Which identifiers are used for matching.
- Whether matching is deterministic or probabilistic.
- Whether confidence is represented.
- What unmatched records look like.

Recommended fields:

```text
match_method:
  - deterministic_email
  - deterministic_customer_id
  - deterministic_account_id
  - probabilistic_name_zip
  - manual_demo_link

match_confidence:
  - 0.00 to 1.00
```

Sigma should expose identity confidence only when it supports the sales story.

## Score And Intelligence Patterns

Scores should be modeled as data, not just UI decoration.

Recommended score table:

```text
CORE.FCT_SCORE_HISTORY
```

Recommended fields:

```text
score_run_id
customer_id
score_type
score_value
score_band
score_reason_1
score_reason_2
score_reason_3
model_version
scored_at
expires_at
```

Common score types:

```text
churn_risk
propensity_to_buy
next_best_offer
customer_health
lifetime_value
engagement_score
service_risk
expansion_likelihood
```

Rules:

- Include explanation fields for demo trust.
- Include score band fields for Sigma controls.
- Include run/version fields for auditability.

## Recommendation Pattern

Recommended table:

```text
CORE.FCT_RECOMMENDATION
```

Recommended fields:

```text
recommendation_id
customer_id
recommendation_type
recommended_action
recommended_channel
recommendation_reason
confidence_score
expected_value
eligibility_status
compliance_status
model_version
generated_at
expires_at
```

Rules:

- Every recommendation must have a reviewable reason.
- Every activation recommendation must map to ACTIVATION tables.
- Recommendations must be supported by synthetic data examples.

## MART_SIGMA View Patterns

MART_SIGMA views should be page-oriented and business-readable.

Recommended naming:

```text
MART_SIGMA.EXECUTIVE_OVERVIEW_VW
MART_SIGMA.CUSTOMER_360_DRILLDOWN_VW
MART_SIGMA.SEGMENT_EXPLORER_VW
MART_SIGMA.RECOMMENDATION_REVIEW_VW
MART_SIGMA.ACTIVATION_READINESS_VW
MART_SIGMA.PERFORMANCE_MEASUREMENT_VW
```

Rules:

- One view may support multiple Sigma elements on a page.
- Do not expose raw technical complexity when a curated view would simplify Sigma.
- Include fields needed for controls, filters, labels, metrics, and drilldowns.
- Use business-friendly aliases.
- Include synthetic scenario fields for demo navigation when useful.

Each MART_SIGMA view spec must include:

```yaml
view_name:
grain:
sigma_pages_supported:
source_objects:
key_fields:
metrics:
dimensions:
control_fields:
pii_fields:
governance_fields:
demo_storyline_role:
```

## SEMANTIC Patterns

Use SEMANTIC for governed business vocabulary and metrics.

Semantic definitions should include:

- Business entities
- Relationships
- Dimensions
- Facts
- Metrics
- Synonyms or business terms

Good candidates:

```text
Customer
Account
Audience
Campaign
Interaction
Transaction
Retention Rate
Churn Risk
Customer Lifetime Value
Conversion Rate
Activation Rate
Cost To Serve
Engagement Score
```

Rules:

- Reused metrics belong in SEMANTIC or clearly documented MART_SIGMA logic.
- Cortex Analyst use cases require disciplined semantic definitions.
- Semantic definitions must align with Agent 12 metric taxonomy.

## GOVERNANCE Patterns

Recommended governance objects:

```text
GOVERNANCE.PII_CLASSIFICATION
GOVERNANCE.CONSENT_STATUS
GOVERNANCE.SUPPRESSION_LIST
GOVERNANCE.DATA_QUALITY_RESULTS
GOVERNANCE.MODEL_OUTPUT_AUDIT
GOVERNANCE.USER_ACTION_AUDIT
```

Rules:

- Tag fields as PII, sensitive, regulated, consent-bound, or unrestricted.
- Include consent and suppression fields where activation is involved.
- Include data quality results when data trust is part of the story.

## Data Quality Pattern

Every model should define basic checks.

Common checks:

```text
not_null
unique
accepted_values
referential_integrity
valid_date_range
valid_score_range
freshness
duplicate_identity
consent_required_for_activation
suppression_exclusion
```

Data quality output fields:

```text
check_id
object_name
field_name
check_type
check_status
failed_record_count
checked_at
severity
notes
```

## Synthetic Data Scenario Pattern

Synthetic data should be scenario-driven.

Each scenario should include:

```yaml
scenario_id:
scenario_name:
persona:
demo_moment:
customer_or_account_examples:
source_data_records:
expected_scores:
expected_recommendations:
activation_records:
expected_sigma_pages:
business_outcome:
```

This ensures Agent 22 produces data that actually supports Agent 21's demo storyline.

## Required Agent Outputs

Agent 13 must produce:

- Entity inventory
- Relationship inventory
- Grain definitions
- Identity resolution assumptions
- Layered Snowflake object inventory
- Source-to-target mapping
- PII and consent classification
- Data quality risks and checks
- MART_SIGMA view specs
- SEMANTIC definition candidates
- ACTIVATION and GOVERNANCE dependencies

Agent 22 must produce:

- Synthetic data files or file specs
- Snowflake DDL
- Load instructions
- Data dictionary
- Data quality checks
- MART_SIGMA views
- Demo scenario fixtures

## Fail Conditions

Fail the data model if:

- A table lacks a clear grain.
- A Sigma page cannot trace to a MART_SIGMA view.
- A metric appears without definition.
- Activation lacks request/output/audit structures.
- Identity resolution assumptions are unstated.
- PII/consent concerns are ignored.
- Synthetic data does not support the demo moments.
