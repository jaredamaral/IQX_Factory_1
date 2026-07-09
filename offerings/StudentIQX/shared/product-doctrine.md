# Product Doctrine: Sigma-First, Snowflake-Backed IQX

## Purpose

This doctrine defines the operating principles every IQX agent must follow when designing use cases, data models, prototypes, synthetic data, activation workflows, and launch-readiness assessments.

IQX is a repeatable consulting offering for industry-specific customer intelligence and activation platforms. Its prototypes must be commercially compelling, but they must also be technically honest: the canonical experience must be reproducible in the target architecture.

## Core Doctrine

The canonical IQX application layer is Sigma.

Snowflake is the canonical layer for data, metrics, intelligence, semantic definitions, activation state, audit logging, and AI-enabled data workflows.

React is optional and non-canonical. It may be used only as a visualization sketchpad, not as the source of truth for the product experience.

Every prototype workflow must first be expressed using Sigma-native or Sigma-approximate primitives. Any React-only idea must be explicitly labeled aspirational and excluded from the canonical Sigma prototype unless there is a documented Sigma approximation.

The prototype is a sales conversation instrument, but it must be technically honest: the interface, data model, metrics, activation flows, and AI moments must be reproducible in Snowflake and Sigma.

## Product Hierarchy

Agents must apply this hierarchy when making design decisions:

1. Product intent lives in the use case definition.
2. Data, metrics, intelligence, activation state, and auditability live in Snowflake.
3. The canonical user experience lives in Sigma.
4. React, if used, is a temporary visual sketchpad only.

No downstream artifact may treat React as the product blueprint. If React introduces an idea, that idea must be evaluated against Sigma feasibility before it can influence the canonical prototype.

## Canonical Responsibilities

### Snowflake Owns

- Synthetic and real implementation data structures
- Customer 360 entities and identity assumptions
- Source-to-target mapping
- Curated Sigma-ready marts
- Governed metric and semantic definitions
- Intelligence outputs such as scores, segmentations, recommendations, propensities, classifications, and summaries
- Activation request, output, logging, and audit tables
- PII classification, consent status, compliance guardrails, and retention considerations
- Data quality checks and known failure modes

### Sigma Owns

- Canonical prototype pages and workflows
- Persona-facing dashboard and application surfaces
- Tables, pivots, charts, controls, filters, text, containers, and other Sigma-supported UI primitives
- Exploration, segmentation, review, and decision-support experiences
- Sigma workbook build specifications and feasibility matrices
- The user-facing sales demo experience, unless a capability is explicitly marked aspirational

### React May Only Own

- Optional visual exploration
- Layout inspiration
- Non-canonical interaction sketches
- Design alternatives explicitly constrained by Sigma feasibility

React may not own canonical workflow behavior, data logic, activation logic, metric definitions, or final prototype scope.

## Sigma-First Design Rules

Before specifying any interface, the responsible agent must classify each proposed experience pattern as one of:

- `Sigma-native`
- `Sigma-approximate`
- `Requires manual Sigma build`
- `Currently unsupported / aspirational`
- `React-only, not allowed in canonical prototype`

Agents must prefer Sigma-native patterns when possible. Sigma-approximate patterns are acceptable when the approximation preserves the business meaning of the workflow. Unsupported or React-only patterns must not be presented as canonical.

Common Sigma-first patterns include:

- KPI summary areas
- Filterable customer, account, audience, or opportunity tables
- Segment exploration pages
- Executive overview pages
- Manager/operator workflow pages
- Customer or constituent drilldowns
- Activation review tables
- Recommendation review surfaces
- Performance measurement pages
- Controls and filters that shape cohorts, periods, business units, product lines, journeys, or risk levels

When an agent wants a richer app-like interaction, it must first describe the Sigma approximation.

## Snowflake-First Data Rules

Every use case must define its Snowflake data contract before the prototype is considered complete.

At minimum, the data model should distinguish:

```text
RAW_SYNTHETIC
CORE
MART_SIGMA
SEMANTIC
ACTIVATION
GOVERNANCE
```

Every Sigma page or workflow must trace back to one or more of:

- `MART_SIGMA` views
- `SEMANTIC` definitions
- `ACTIVATION` tables
- `GOVERNANCE` constraints

Metrics must be defined once and reused consistently across use cases, Snowflake marts, Sigma workbook specs, sales narratives, and prototype demo scripts.

## Activation Design Pattern (canonical)

This principle defines what **Activate** means across every IQX vertical. It is specified in `factory/IQX_AGENT_BLUEPRINT.md` Section 2.2.1 and applies to every offering instance.

**Functional split:** IQX owns decide, draft, track, and ingest. Channel systems of record own send, act, and execute.

**IQX owns (Sigma experience + Snowflake `ACTIVATION` / `GOVERNANCE` state):**

- Decision layer: scores, reasons, recommendations, and human decisions to act
- Content preparation: AI-drafted or templated content with human review
- Workflow and status tracking: assignment, intervention status, audit trail
- Outcome ingestion: results and feedback pulled back to close the loop

**Channel systems own (execution):**

- Actual send (email, SMS), call, enrollment or record update, or other channel-specific action
- Whatever CRM, marketing automation, SIS, case management, or operational tool already owns that channel
- IQX pushes a payload to trigger execution and pulls a result back in

Prior framings that treated activation as either "IQX owns the full workflow" or "IQX hands everything to the incumbent" are superseded by this split.

## Activation Doctrine

Activation is not merely a button or UI flourish. Every activation use case must define:

- Who acts
- What trigger causes action
- What recommendation appears
- What the user can approve, edit, reject, or defer
- What Snowflake table records the request
- What Snowflake table records the output
- What Snowflake table records the audit trail
- What compliance or consent rule applies
- How success is measured
- What feedback improves the intelligence layer

If the user-facing activation interaction cannot be fully represented in Sigma, the canonical design must still preserve the activation state and audit trail in Snowflake. React may sketch the aspirational interaction, but it does not become canonical.

## AI Doctrine

AI features must be grounded in Snowflake/Sigma feasibility and business value. Agents may propose AI-assisted experiences only when they define:

- The user persona and job to be done
- The business decision being improved
- The data required
- The generated or recommended output
- The review, approval, or override mechanism
- The audit/logging requirement
- The compliance or explainability constraint
- The Sigma surface where the AI output is reviewed
- The Snowflake object where the AI output is stored or derived

Do not include generic AI moments. Every AI feature must serve a specific use case and be visible in the prototype storyline.

## React Constraint Rules

React is allowed only when it is explicitly framed as optional and non-canonical.

React outputs must include a divergence register documenting every behavior that is not directly Sigma-realizable.

Each React-only or React-enhanced idea must be classified as:

```yaml
interaction:
react_behavior:
sigma_classification:
sigma_approximation:
canonical_allowed:
aspirational_only:
reason:
```

If no Sigma approximation exists, the idea must be excluded from the canonical prototype.

## Quality Gates

An artifact fails this doctrine if any of the following are true:

- It treats React as the canonical product interface.
- It presents a React-only interaction as part of the Sigma prototype.
- It specifies a Sigma page without a Snowflake data dependency.
- It specifies a metric without a governed definition or clear formula.
- It specifies activation without Snowflake logging and auditability.
- It specifies AI output without data source, user review path, and compliance guardrail.
- It uses unsupported Sigma functionality without labeling it aspirational.
- It creates synthetic data that does not support the demo storyline.
- It introduces a use case that does not map back to persona, job to be done, pain point, remedy, data, metric, and outcome.

## Required Traceability

Every canonical use case should be traceable through this chain:

```text
Industry pain
-> Persona
-> Job to be done
-> Product remedy
-> Use case
-> Required data
-> Snowflake model
-> Governed metrics / intelligence outputs
-> Sigma page or workflow
-> Activation behavior, if applicable
-> Demo storyline
-> Measurable business outcome
```

If any link is missing, the agent must flag the gap rather than hiding it.

## Agent Behavior Rules

Agents must:

- Use this doctrine before making design decisions.
- Prefer Sigma-realizable experiences over unconstrained app ideas.
- Keep Snowflake as the source of truth for data, metrics, intelligence, activation, and auditability.
- Label uncertainty, unsupported functionality, and aspirational features clearly.
- Preserve commercial clarity while remaining technically honest.
- Produce outputs that downstream agents can validate, not just read.

Agents must not:

- Produce a React-first prototype spec.
- Treat visual polish as a substitute for Sigma feasibility.
- Invent custom application behavior without a Sigma-native or Sigma-approximate path.
- Place metric logic only in Sigma or React if it should be governed in Snowflake.
- Describe activation without logging, audit, and success measurement.
- Present speculative AI features as deliverable without feasibility classification.

## Review Standard

A strong IQX prototype is not the most app-like prototype. It is the clearest, most credible expression of an industry-specific customer intelligence and activation offering that can be demonstrated in Sigma, powered by Snowflake, and explained in a sales conversation without overpromising delivery.
