# prototype/snowflake/ — Snowflake build artifacts (Stage 4)

Snowflake DDL and data for the `StudentIQX` prototype. Authored by Agent 22
(synthetic-data-generator) using the `sigma-snowflake-prototype` skill, following
`shared/snowflake-platform-rules.md` and `shared/snowflake-data-modeling-patterns.md`.
Snowflake **Cortex** is the canonical AI toolkit for intelligence/AI moments.

## Layer model
```
RAW_SYNTHETIC -> CORE -> MART_SIGMA -> SEMANTIC -> ACTIVATION -> GOVERNANCE
```

## Expected contents
- `ddl/` — table + view definitions per layer
- `views/` — `MART_SIGMA` views that back Sigma pages
- `load/` — synthetic data load scripts / seed CSVs
- `data-dictionary.md` — student entities, columns, PII classification (FERPA),
  consent/retention
- `data-quality-checks.sql` — known failure modes and validations

## Rules
- Every Sigma page must trace to a `MART_SIGMA` view, `SEMANTIC` definition,
  `ACTIVATION` table, or `GOVERNANCE` constraint.
- Activation use cases must record request/output/audit tables (see
  `shared/activation-data-patterns.md`).
- Metrics defined once in `SEMANTIC` and reused everywhere.
- FERPA-classified student PII is governed in `GOVERNANCE` (consent, audit).
