# prototype/sigma-workbooks/ — Workbook-as-code (Stage 4)

Version-controlled Sigma **workbook-as-code** specs for `<Industry>IQX`. Authored
by Agent 21 (prototype-experience-spec-builder) using the `sigma-workbook-as-code`
skill, validated against `shared/sigma-capability-matrix.yaml`.

## Rules (beta — see shared/sigma-workbook-as-code-rules.md)
- **Full-representation workflow:** updates send the complete workbook spec, not
  a partial diff. Track `schemaVersion`.
- **Only Sigma-supported elements** become workbook content. Unsupported
  interactions (buttons, input tables, action sequences, modals, tabs, forms)
  stay in the spec/feasibility matrix as `Requires manual Sigma build` —
  never emitted as generated workbook YAML.
- One workbook spec per Sigma-native page (or a documented multi-page workbook).
- API deploy is credential-gated (`Sigma_Skills/.env`, never committed).

## Files
- `feasibility-matrix.yaml` — copied from Agent 21 output; classifies every
  proposed page/interaction as Sigma-native / approximate / manual / unsupported.
- `<workbook-name>.spec.yaml` — implementation-ready specs for Sigma-native pages.

## Launch readiness (Agent 23) checks
1. A workbook-as-code file exists for every Sigma-native page in the inventory.
2. No unsupported element appears as generated workbook content.
