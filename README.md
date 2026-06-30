# IQX Factory (Cursor)

A Cursor-native toolset for building Verndale Data & Analytics **IQX Offerings** —
industry-specific customer intelligence and activation products (e.g. BankIQX,
StudentIQX). The factory scaffolds a complete, governed offering project and then
runs a 27-agent army across five stages to produce the offering's deliverables.

It is the Cursor migration of the Claude-based IQX Factory. The canonical IP (the
IQX Agent Blueprint and the shared knowledge pack) is preserved; orchestration,
state, portability, and Sigma/Snowflake build capability are added for Cursor.

## How it works — three steps

1. **Build the toolset** *(this repo — done)*: Blueprint, templates, factory
   agent, skills, machine-readable phase graph.
2. **Invoke the toolset** *(you trigger)*: say *"Run the factory for StudentIQX"*.
   The factory pauses for mandatory industry-context intake, then generates a
   fresh `offerings/StudentIQX/` scaffold (27 agents, governance files, manifest,
   prototype dirs). It never copies the Claude StudentIQX example.
3. **Run the scaffold** *(after step 2)*: the stage runner executes agents in
   dependency order with human gates, producing briefs, use cases, the Customer
   360 data model, GTM collateral, and a Sigma-first / Snowflake-backed prototype.

## Quick start

```powershell
# 1. One-time bootstrap (promotes canonical IP, inits git)
pwsh -File factory/bootstrap.ps1 -InitGit

# 2. Wire the official Sigma skills (see factory/SIGMA-INTEGRATION.md)
```

Then, in Cursor chat:
- **Scaffold an offering:** "Run the factory for `<Industry>`IQX" → context intake → scaffold.
- **Run work:** "Run Stage 1 for `<Industry>`IQX" (uses `iqx-stage-runner`).
- **Approve a gate:** "Review gate 1 for `<Industry>`IQX" (uses `iqx-gate-review`).

## Repository layout

```
factory/            Toolset core (Blueprint, addendum, phases.yaml, paths.yaml, templates, bootstrap)
shared-templates/   10-file Sigma/Snowflake knowledge pack (copied into each offering)
.cursor/agents/     iqx-factory (scaffold generator)
.cursor/skills/     iqx-factory, iqx-stage-runner, iqx-gate-review, sigma-workbook-as-code, sigma-snowflake-prototype
.cursor/rules/      sigma-first-doctrine (always-on)
offerings/          Factory output (one folder per industry; empty until Step 2)
Sigma_Skills/       Imported Sigma tooling (sigma-api, sigma-data-models, example workbook)
IQX_Factory_Claude/ Reference only (Claude artifacts; StudentIQX is planning-only)
```

## Canonical technologies

Sigma (application layer) and Snowflake (data / intelligence / activation) are the
designated platforms for every IQX offering. React is a non-canonical sketchpad
only. Sigma **workbook-as-code** (beta) lets agents author workbook specs directly;
the factory enforces technical honesty against the capability matrix. See
`.cursor/rules/sigma-first-doctrine.mdc` and `shared-templates/`.

## Model selection

Agents are model-agnostic and declare a `model_tier` (tier1/tier2/tier3). Map
tiers to your provider's strongest / balanced / fast models — see `AGENTS.md`.

## Key documents

- `AGENTS.md` — orientation + rules for any agent working in this repo
- `factory/IQX_AGENT_BLUEPRINT.md` + `factory/BLUEPRINT-ADDENDUM.md` — canonical spec
- `factory/phases.yaml` — the agent/stage/gate graph
- `factory/SIGMA-INTEGRATION.md` — Sigma tooling wiring
