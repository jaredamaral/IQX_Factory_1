# AGENTS.md — IQX Factory (repo orientation)

This repo is the **IQX Factory**: a Cursor-native toolset that scaffolds and runs
Verndale's industry-specific customer intelligence and activation offerings
("IQX Offerings", e.g. BankIQX, StudentIQX). Read this first.

## Three-step model

| Step | What | Entry point |
|------|------|-------------|
| **1. Build the toolset** | Create the factory (Blueprint, templates, factory agent, skills, phase graph) | **Done — this repo** |
| **2. Invoke the toolset** | Scaffold a fresh `offerings/<Industry>IQX/` for one industry | `iqx-factory` skill ("Run the factory for StudentIQX") |
| **3. Run the scaffold** | Execute the 27 agents through Stages 1–5 to produce deliverables | `iqx-stage-runner` + `iqx-gate-review` skills |

## Folder map

| Path | Role |
|------|------|
| `factory/` | Toolset core: `IQX_AGENT_BLUEPRINT.md` (canonical), `BLUEPRINT-ADDENDUM.md` (Cursor v1.3, wins on conflict), `phases.yaml` (agent/stage graph), `paths.yaml` (repo-relative config), `templates/`, `SIGMA-INTEGRATION.md` |
| `shared-templates/` | The 10-file industry-agnostic knowledge pack (copied into each offering's `shared/`) |
| `.cursor/agents/` | `iqx-factory.md` — the scaffold generator |
| `.cursor/skills/` | `iqx-factory`, `iqx-stage-runner`, `iqx-gate-review`, `sigma-workbook-as-code`, `sigma-snowflake-prototype` |
| `.cursor/rules/` | `sigma-first-doctrine.mdc` (always-on platform doctrine) |
| `offerings/` | Factory output — fresh per-industry scaffolds (empty until Step 2) |

The official Sigma skills (`sigma-api`, `sigma-data-models`) are an **external
dependency** installed into `.cursor/skills/` when needed for Stage 4 — see
`factory/SIGMA-INTEGRATION.md`. They are not vendored in this repo.

## Hard rules

1. **Build every offering fresh (Rule 1).** Generate agents from the Blueprint +
   `shared-templates/` only. Never seed/copy/diff a new offering against a
   previously generated offering.
2. **Sigma-first, Snowflake-backed (Rule 2).** See `.cursor/rules/sigma-first-doctrine.mdc`.
3. **Workbook-as-code is beta (Rule 3).** Only Sigma-supported elements become
   generated workbook content.
4. **Mandatory context intake (Rule 4).** The factory pauses for industry context
   before scaffolding — never skip it.
5. **Repo-relative paths only.** Resolve via `factory/paths.yaml`; no absolute machine paths.

## Model tiers (provider-agnostic)

Agents declare a `model_tier`, not a vendor model. Map tiers to your Cursor models
once per session:

| Tier | Meaning | Map to | Blueprint equiv. |
|------|---------|--------|------------------|
| **tier1** | Strongest reasoning | your flagship model | Opus-class |
| **tier2** | Balanced | your default coding model | Sonnet-class |
| **tier3** | Fast / economical | your fast model | Haiku-class |

Guidance:
- **Step 1 (build) and Step 2 (scaffold):** tier1 for the whole session.
- **Step 3 (run agents):** per-agent `model_tier` from `factory/phases.yaml`.
- **Stage 4 bias:** run Agents 21–23 at tier1 if available (Sigma/Snowflake punish shortcuts).
- **Factory meta-agents** (`iqx-factory`, complex `iqx-stage-runner` routing): tier1.
  Gate review may be tier2 (human in the loop).

## First-time setup

The toolset (Blueprint, `shared-templates/`, factory, skills) is in-repo and
ready. Only when you reach **Stage 4** do you need the official Sigma skills —
install them per `factory/SIGMA-INTEGRATION.md` and add Sigma API credentials to
a gitignored `.env`.
