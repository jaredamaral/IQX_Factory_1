---
name: sigma-snowflake-prototype
description: "Design and build the Snowflake back end and Sigma feasibility for an IQX prototype. Use during Stage 4 (Agents 21, 22) to produce the RAW→CORE→MART_SIGMA→SEMANTIC→ACTIVATION→GOVERNANCE layer model, DDL, MART_SIGMA views, synthetic data, governed metrics, and activation/audit tables under prototype/snowflake/. Pairs with sigma-workbook-as-code."
---

# Sigma + Snowflake Prototype (IQX)

Gives Stage 4 agents operational skill (not just policy) for building the
Snowflake back end that powers a Sigma-first IQX prototype. Output lives under
`offerings/<Industry>IQX/prototype/snowflake/`.

## Read first
- `shared/snowflake-platform-rules.md`
- `shared/snowflake-data-modeling-patterns.md`
- `shared/activation-data-patterns.md`
- `shared/product-doctrine.md`
- `shared/quality-gates.md`

## Layer model (canonical)
```
RAW_SYNTHETIC -> CORE -> MART_SIGMA -> SEMANTIC -> ACTIVATION -> GOVERNANCE
```
Every Sigma page must trace to a `MART_SIGMA` view, a `SEMANTIC` metric, an
`ACTIVATION` table, or a `GOVERNANCE` constraint.

## Build workflow
1. **Derive entities** from the Agent 13 `data-model.md` (Customer 360) and the
   use-case library. Confirm grain and identity assumptions.
2. **Author DDL per layer** into `prototype/snowflake/ddl/`:
   - `RAW_SYNTHETIC` raw tables, `CORE` conformed entities,
     `MART_SIGMA` consumption views (one per Sigma page where possible),
     `SEMANTIC` governed metric definitions, `ACTIVATION` request/output/audit
     tables, `GOVERNANCE` PII/consent/retention constructs.
3. **Generate synthetic data** that supports the demo storyline (Agent 22):
   load scripts / seed CSVs in `prototype/snowflake/load/`. Volumes and
   distributions must make the prototype's metrics and segments believable.
4. **Define metrics once** in `SEMANTIC`; reuse across marts, Sigma specs, value
   case, and demo script. No metric drift.
5. **Activation contracts** (per `activation-data-patterns.md`): for every
   activation use case define who acts, trigger, recommendation, approve/edit/
   reject/defer, destination class, and the request/output/audit tables.
6. **Data quality checks** into `prototype/snowflake/data-quality-checks.sql`;
   document known failure modes in `data-dictionary.md`.

## Sigma feasibility (with Agent 21)
- Classify each proposed experience against `shared/sigma-capability-matrix.yaml`.
- Sigma-native pages get `MART_SIGMA` views shaped for direct consumption.
- Hand the feasibility result to the `sigma-workbook-as-code` skill for
  workbook YAML generation.

## Optional live Snowflake / Sigma execution
- Snowflake credentials are user-provided and environment-gated — never commit
  secrets. Prefer generating reviewable SQL files over executing destructively.
- For Sigma data models (semantic layer via API), use the official
  `sigma-data-models` skill (`Sigma_Skills/sigma-agent-skills/skills/sigma-data-models/`),
  authenticated via the `sigma-api` skill.

## Guardrails
- Snowflake is the source of truth for data, metrics, intelligence, activation
  state, and audit — never Sigma or React.
- Repo-relative paths; per-offering output only.
- Technical honesty: no metric or activation behavior in the prototype that the
  Snowflake model cannot actually produce.
