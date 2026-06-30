# shared-templates/ — IQX Knowledge Pack (canonical location)

This is the **canonical home** for the 10 industry-agnostic knowledge-pack files
that the IQX Factory copies into every offering's `shared/` folder at scaffold
time. They encode Verndale's distilled platform rules (Sigma + Snowflake
doctrine, capability matrices, data-modeling patterns, quality gates).

## The 10 canonical files

| File | Purpose |
|------|---------|
| `product-doctrine.md` | Sigma-first / Snowflake-backed operating principles |
| `sigma-first-design-rules.md` | Design-to-Sigma translation rules |
| `sigma-capability-matrix.yaml` | Feature-level Sigma-native / approximate / unsupported tracking |
| `sigma-workbook-as-code-rules.md` | Workbook-as-code API rules, supported elements, beta caveats |
| `snowflake-platform-rules.md` | Snowflake layer model and platform rules |
| `snowflake-data-modeling-patterns.md` | RAW→CORE→MART_SIGMA→SEMANTIC→ACTIVATION→GOVERNANCE patterns |
| `activation-data-patterns.md` | Destination-neutral activation data patterns |
| `react-sketchpad-constraints.md` | React-as-sketchpad-only constraints |
| `quality-gates.md` | Shared pass/fail checks |
| `docs-ledger.md` | Source/recheck cadence ledger for the knowledge pack |

## How these files get here

Until `factory/bootstrap.ps1` runs, this directory may contain only this README.
The factory reads from the documented fallback
(`IQX_Factory_Claude/shared-templates/`) in the meantime — see `factory/paths.yaml`.

To promote the canonical copies into this folder:

```powershell
pwsh -File factory/bootstrap.ps1
```

Reading the knowledge pack from `IQX_Factory_Claude/shared-templates/` is
allowed: these are industry-agnostic IP, distinct from the StudentIQX
reference (which is planning-only and must never be a factory input — see Rule 1
in `factory/BLUEPRINT-ADDENDUM.md`).

## Updating the knowledge pack

When Sigma/Snowflake capabilities change, update the canonical file here, record
the change and recheck date in `docs-ledger.md`, then re-run the factory or
manually refresh existing offerings' `shared/` copies.
