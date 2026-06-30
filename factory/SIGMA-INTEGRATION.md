# Sigma Tooling Integration (IQX Factory)

How the imported `Sigma_Skills/` project wires into the IQX Factory. Two layers:

1. **Official Sigma skills** (from the `sigma-agent-skills` submodule) —
   `sigma-api` (auth) and `sigma-data-models` (semantic layer via `/v2/dataModels`).
2. **IQX-owned skills** — `sigma-workbook-as-code` (workbook `/v2/workbooks/spec`,
   not covered by the official skills) and `sigma-snowflake-prototype` (Snowflake
   layer model + build).

## Make the official skills discoverable at repo root

Cursor auto-discovers skills in the **workspace-root** `.cursor/skills/`. The
`Sigma_Skills/scripts/setup-cursor-skills.ps1` script links them into
`Sigma_Skills/.cursor/skills/` (nested). To expose them at the repo root, junction
them from `.cursor/skills/`:

```powershell
# From repo root (needs shell). Junctions repo-root .cursor/skills -> Sigma submodule skills.
$src = "Sigma_Skills\sigma-agent-skills\skills"
foreach ($name in @("sigma-api","sigma-data-models")) {
  $target = ".cursor\skills\$name"
  if (Test-Path $target) { Remove-Item $target -Recurse -Force }
  cmd /c mklink /J "$target" "$src\$name" | Out-Null
}
```

If the submodule is empty, first run:
`git submodule update --init --recursive` inside `Sigma_Skills/`.

Alternatively run the bundled `Sigma_Skills/scripts/setup-cursor-skills.ps1` and
point Cursor at the nested location, but repo-root junctions are preferred for
discovery.

## Credentials

Sigma API credentials live in `Sigma_Skills/.env` (copy from `.env.example`).
**Never commit secrets.** Token helpers:
- Windows: `Sigma_Skills/scripts/get-sigma-token.ps1`
- Bash: `Sigma_Skills/sigma-agent-skills/skills/sigma-api/scripts/get-token.sh`

`SIGMA_BASE_URL` is the API host (e.g. `https://aws-api.sigmacomputing.com`), not
the app URL. Verify a token with `GET /v2/whoami`.

## Stage 4 invocation order (Agents 21–22)
1. `sigma-api` → obtain `SIGMA_API_TOKEN`.
2. (optional) `sigma-data-models` → build/inspect the semantic layer via API.
3. `sigma-snowflake-prototype` → Snowflake DDL + synthetic data + `MART_SIGMA` views.
4. `sigma-workbook-as-code` → workbook YAML in `prototype/sigma-workbooks/`,
   validated against the capability matrix.

## Reference workbook
`Sigma_Skills/workbooks/SIQx-v1.3-JA-COPY.spec.yaml` is a real workbook-as-code
example showing `schemaVersion`, `pages[].elements[].kind`, warehouse-table
sources, and formula columns. **Pattern reference only** — it is StudentIQ-related
and must not be treated as canonical StudentIQX factory output (Rule 1). Per-offering
workbooks live under `offerings/<Industry>IQX/prototype/sigma-workbooks/`.
