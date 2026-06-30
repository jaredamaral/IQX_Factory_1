# Sigma Tooling Integration (IQX Factory)

The IQX Factory uses two kinds of Sigma skills:

1. **Official Sigma skills** (external dependency — NOT vendored in this repo):
   `sigma-api` (auth) and `sigma-data-models` (semantic layer via `/v2/dataModels`),
   from the public upstream `https://github.com/sigmacomputing/sigma-agent-skills`.
2. **IQX-owned skills** (in this repo, `.cursor/skills/`): `sigma-workbook-as-code`
   (workbook `/v2/workbooks/spec`, not covered by the official skills) and
   `sigma-snowflake-prototype` (Snowflake layer model + build).

You only need the official skills when you reach **Stage 4** (prototype). Install
them once, per machine.

## Install the official Sigma skills

Clone the upstream and link/copy the two skills into the repo-root `.cursor/skills/`
so Cursor auto-discovers them:

```powershell
# 1. Clone the upstream somewhere outside this repo (e.g. a tools folder)
git clone https://github.com/sigmacomputing/sigma-agent-skills.git C:\Users\<you>\tools\sigma-agent-skills

# 2. Link the two skills into this repo's .cursor/skills (junctions; needs a shell)
$src = "C:\Users\<you>\tools\sigma-agent-skills\skills"
foreach ($name in @("sigma-api","sigma-data-models")) {
  $target = ".cursor\skills\$name"
  if (Test-Path $target) { Remove-Item $target -Recurse -Force }
  cmd /c mklink /J "$target" "$src\$name" | Out-Null
}
```

(Alternatively, copy the two skill folders into `.cursor/skills/` instead of
junctioning — copies are simpler but won't auto-update when upstream changes.)

> Do not commit the official skills into this repo. They are an external
> dependency; `.gitignore` should keep `.cursor/skills/sigma-api/` and
> `.cursor/skills/sigma-data-models/` untracked if you copy them in.

## Credentials

Create a local `.env` at the repo root (gitignored — never commit secrets):

```
SIGMA_BASE_URL=https://aws-api.sigmacomputing.com   # API host, NOT app URL; adjust per cloud/region
SIGMA_CLIENT_ID=your-client-id
SIGMA_CLIENT_SECRET=your-client-secret
```

Find these in Sigma: **Administration → Developer Access → API credentials**.
The `sigma-api` skill exchanges these for a short-lived bearer token; verify with
`GET /v2/whoami`. `SIGMA_BASE_URL` is the API host (e.g.
`https://aws-api.sigmacomputing.com`), not `https://app.sigmacomputing.com`.

## Stage 4 invocation order (Agents 21–22)
1. `sigma-api` → obtain `SIGMA_API_TOKEN`.
2. (optional) `sigma-data-models` → build/inspect the semantic layer via API.
3. `sigma-snowflake-prototype` (IQX) → Snowflake DDL + synthetic data + `MART_SIGMA` views.
4. `sigma-workbook-as-code` (IQX) → workbook YAML in `prototype/sigma-workbooks/`,
   validated against `shared-templates/sigma-capability-matrix.yaml`.

## Workbook-as-code spec shape (reference)
Top-level keys include `name`, `schemaVersion`, and `pages[]`. Each page has
`elements[]` with a `kind` (`table`, `viz`, `pivot`, `text`, `container`,
`control`, …), a `source` (often a `warehouse-table`/`join` pointing at Snowflake
`MART_SIGMA` objects), and `columns[]` with `formula`s. Always set/track
`schemaVersion`. Updates use the **full-representation** workflow (send the
complete spec, not a partial patch). Per-offering workbooks live under
`offerings/<Industry>IQX/prototype/sigma-workbooks/`.
