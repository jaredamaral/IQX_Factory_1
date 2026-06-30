---
name: sigma-workbook-as-code
description: "Author, validate, and (optionally) deploy Sigma workbook-as-code specs for an IQX prototype. Use during Stage 4 (Agents 21, 23) when turning a prototype experience spec into version-controlled Sigma workbook YAML, checking pages against the capability matrix, or pushing specs via the Sigma /v2/workbooks API. Bridges IQX doctrine with the official sigma-api skill."
---

# Sigma Workbook-as-Code (IQX)

Turns an IQX prototype experience spec into **version-controlled Sigma workbook
YAML** under `offerings/<Industry>IQX/prototype/sigma-workbooks/`, and optionally
deploys it via the Sigma API. This IQX skill owns the **workbook** surface
(`/v2/workbooks/spec`), which the official `sigma-data-models` skill does NOT
cover (it targets `/v2/dataModels`).

> Workbook-as-code is **beta**. Be technically honest: only Sigma-supported
> elements become generated workbook content. Everything else stays in the
> feasibility matrix as manual-build / aspirational.

## Read first
- `shared/sigma-workbook-as-code-rules.md` — API rules, supported elements, beta caveats
- `shared/sigma-capability-matrix.yaml` — Sigma-native / approximate / unsupported per feature
- `shared/sigma-first-design-rules.md` — design-to-Sigma translation
- `shared/product-doctrine.md` — Sigma-first / Snowflake-backed doctrine
- Workbook-as-code spec shape + install steps: `factory/SIGMA-INTEGRATION.md`

## Spec shape (workbook-as-code)
Top-level keys include `name`, `schemaVersion`, and `pages[]`. Each page has
`elements[]` with a `kind` (e.g. `table`, `viz`, `pivot`, `text`, `container`,
`control`), a `source` (often a `warehouse-table`/`join` pointing at Snowflake
`MART_SIGMA` objects), and `columns[]` with `formula`s. Always set and track
`schemaVersion`.

## Authoring workflow
1. **Inventory pages** from the Agent 21 prototype spec.
2. **Classify each page/interaction** against `sigma-capability-matrix.yaml`:
   `Sigma-native` | `Sigma-approximate` | `Requires manual Sigma build` |
   `Currently unsupported / aspirational` | `React-only (excluded)`.
   Write/refresh `prototype/sigma-workbooks/feasibility-matrix.yaml`.
3. **Emit YAML only for Sigma-native (and acceptable approximate) pages** as
   `prototype/sigma-workbooks/<workbook-name>.spec.yaml`. Point element sources
   at Snowflake `MART_SIGMA` views from `prototype/snowflake/`. Define each
   metric once (trace to `SEMANTIC`).
4. **Never emit unsupported elements** (buttons, input tables, action sequences,
   modals, tabs, forms) as workbook content — leave them in the feasibility
   matrix labeled `Requires manual Sigma build`.
5. **Full-representation rule:** any update writes the COMPLETE workbook spec,
   not a partial patch. Preserve/track `schemaVersion`.

## Validation (Agent 23 launch readiness)
- A workbook spec exists for every `Sigma-native` page in the inventory.
- No unsupported element is presented as generated workbook content.
- Every page traces to a Snowflake `MART_SIGMA` view / `SEMANTIC` metric.
- Metrics are consistent across pages and with the value case.

## Optional deploy (credential-gated)
1. Get a token via the official **sigma-api** skill. Install it first per
   `factory/SIGMA-INTEGRATION.md` (upstream: sigmacomputing/sigma-agent-skills);
   credentials come from a repo-root `.env` (NEVER commit).
2. Workbook spec endpoints: `GET/POST/PUT /v2/workbooks/spec` (full
   representation). Verify with `GET /v2/whoami` first.
3. Never echo tokens/secrets; never write secrets into the workspace.

## Guardrails
- Beta honesty over demo polish — no one-click activation UX promised as generated content.
- Repo-relative paths; workbooks live per-offering under `prototype/sigma-workbooks/`.
- Keep the capability matrix current; log rechecks in `shared/docs-ledger.md`.
