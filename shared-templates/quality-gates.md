# IQX Shared Quality Gates

## Purpose

This file defines shared pass/fail checks for IQX agents and human gates.

It turns the product doctrine, Sigma rules, Snowflake rules, activation patterns, and React constraints into reviewable criteria.

## Universal Quality Gate

Every major artifact must pass these checks:

- It serves a named persona.
- It maps to a job to be done.
- It addresses a documented pain point.
- It defines the product remedy.
- It identifies required data.
- It defines required metrics.
- It identifies Sigma experience implications.
- It identifies Snowflake model implications.
- It identifies activation implications if relevant.
- It documents assumptions and open questions.
- It does not overstate platform capability.

## Agent 12: Use-Case Architect Gate

Pass only if each use case includes:

- Persona
- Job to be done
- Pain point
- Business impact
- Product remedy
- Insight or action enabled
- Required data
- Required metrics
- Intelligence outputs
- Sigma experience contract
- Snowflake data contract
- Activation requirements, if applicable
- Compliance guardrails
- Success definition

Fail if:

- The use case is a generic dashboard.
- The use case lacks a persona or job.
- Metrics are vague or undefined.
- Sigma feasibility is not considered.
- Snowflake data requirements are missing.
- Activation behavior lacks logging and measurement.

## Agent 13: Customer 360 Data Modeler Gate

Pass only if the data model includes:

- Required Snowflake layers
- Entity inventory
- Relationship inventory
- Grain for every object
- Keys and identity assumptions
- Source-to-target mapping
- PII and consent classification
- Data quality risks
- MART_SIGMA view candidates
- SEMANTIC definition candidates
- ACTIVATION dependencies
- GOVERNANCE dependencies
- Minimum viable prototype dataset
- Minimum viable real implementation dataset

Fail if:

- The model is exhaustive instead of use-case-driven.
- Any table lacks grain.
- Identity resolution is hand-waved.
- Metrics cannot be derived.
- Sigma pages cannot trace to marts.
- PII/consent is ignored.

## Agent 21: Prototype Experience Spec Gate

Pass only if the prototype spec includes:

- Persona workflow maps
- Sigma-native page inventory
- Sigma feasibility matrix
- Sigma workbook build spec
- Snowflake data dependency map
- Activation workflow spec, if applicable
- Optional React spec clearly marked non-canonical
- React divergence register if React is used

Fail if:

- React is treated as canonical.
- Sigma feasibility is missing.
- Unsupported Sigma features are presented as deliverable.
- Pages lack Snowflake dependencies.
- Metrics differ from Agent 12 or Agent 13.
- Activation state is not modeled in Snowflake.
- The prototype has too many generic pages.

## Agent 22: Synthetic Data Generator Gate

Pass only if synthetic data includes:

- Source-like raw data
- Unified Customer 360 data
- Sigma-ready mart data
- Activation sample records, if applicable
- Governance/consent/suppression fields where relevant
- Named demo scenarios
- Data dictionary
- DDL or load-ready specs
- Data quality checks
- Realistic distributions and edge cases

Fail if:

- Data does not support the demo storyline.
- Data lacks enough variety for controls and charts.
- A key Sigma page cannot be populated.
- Activation records are missing for activation use cases.
- Synthetic PII is unsafe or unlabeled.
- Metrics cannot be calculated from the data.

## Agent 23: Launch Readiness Gate

Pass only if:

- ICP is approved.
- Buyer personas are approved.
- Top use cases are approved.
- Customer 360 model is drafted.
- Demo scenario is built.
- Sigma/Snowflake integrity assessment passes.
- Sales narrative is tested internally.
- Proof points are sourced.
- Objection handling is complete.
- Delivery model is drafted.
- Known risks are documented.

Fail if:

- The prototype depends on React-only behavior.
- Sigma feasibility matrix is missing or incomplete.
- Sigma pages do not map to MART_SIGMA, SEMANTIC, or ACTIVATION objects.
- Metrics are inconsistent across artifacts.
- Activation lacks logging/audit/outcomes.
- Unsupported Sigma features are presented as canonical.
- Synthetic data does not support the demo storyline.
- AI features lack data lineage, review path, or compliance guardrails.

## Sigma/Snowflake Prototype Integrity Assessment

Agent 23 must explicitly pass/fail:

```yaml
sigma_feasibility:
snowflake_data_model_traceability:
metric_consistency:
activation_auditability:
react_divergence_risk:
synthetic_data_completeness:
ai_governance:
```

Each item must include:

```yaml
status: pass | fail | partial
evidence:
gaps:
recommended_action:
```

## React Divergence Gate

If React is used, pass only if:

- The Sigma-first spec exists.
- React is labeled non-canonical.
- Every React-only interaction is listed.
- Every listed interaction has Sigma classification.
- Aspirational items are excluded from canonical scope.
- React data matches Snowflake/Sigma data.

Fail if React introduces hidden canonical scope.

## Activation Gate

For activation use cases, pass only if:

- Destination class is defined.
- Activation request object is defined.
- Audience/member object is defined if needed.
- Recommendation output object is defined if needed.
- Approval event object is defined if review is required.
- Export/sync log object is defined if a destination exists.
- Outcome measurement is defined.
- Feedback loop is defined.
- Consent/suppression rules are defined.

Fail if activation is represented only as UI.

## AI Gate

For AI-assisted use cases, pass only if:

- The AI moment serves a named job to be done.
- Required data is identified.
- Generated output is defined.
- Review/approval path is defined.
- Snowflake storage or derivation is defined.
- Sigma review surface is defined.
- Audit/logging is defined.
- Compliance or explainability constraints are documented.

Fail if the AI feature is generic, magical, or untraceable.

## Human Gate Review Questions

At each human gate, ask:

- Does this still solve the commercial wedge?
- Is the experience credible in Sigma?
- Is the data model sufficient but not overbuilt?
- Are the metrics consistent?
- Are activation claims auditable?
- Are AI claims grounded?
- Are risks and unsupported features visible?
- Would a prospect understand the before/after story?
- Would delivery teams be trapped by an overpromise?

## Final Rule

Technical honesty matters as much as sales clarity.

No agent may present an experience, metric, activation behavior, or AI capability as canonical unless it can be represented in the Snowflake/Sigma target architecture or is explicitly labeled aspirational.
