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

Run the bundled installer (clones the upstream to a reusable cache and junctions
`sigma-api` + `sigma-data-models` into `.cursor/skills/`):

```powershell
pwsh -File factory/scripts/install-sigma-skills.ps1
# optional: -CacheDir "C:\tools\sigma-agent-skills"
```

The official skills are **gitignored** (`.cursor/skills/sigma-api/`,
`.cursor/skills/sigma-data-models/`) — they are an external dependency and must
not be committed into this repo. Re-run the installer to update them.

## Credentials

Create a local `.env` at the repo root (gitignored — never commit secrets):

```
SIGMA_BASE_URL=https://aws-api.sigmacomputing.com   # API host, NOT app URL; adjust per cloud/region
SIGMA_CLIENT_ID=your-client-id
SIGMA_CLIENT_SECRET=your-client-secret
```

Find these in Sigma: **Administration → Developer Access → API credentials**.
`SIGMA_BASE_URL` is the API host (e.g. `https://aws-api.sigmacomputing.com`), not
`https://app.sigmacomputing.com`.

Get a token (Windows PowerShell helper; sets `$env:SIGMA_API_TOKEN`):

```powershell
. .\factory\scripts\get-sigma-token.ps1
```

Verify with `GET /v2/whoami`. Tokens last ~1 hour; re-run to refresh. (The
upstream also ships a bash `get-token.sh` if you prefer.)

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
