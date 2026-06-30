# IQX Agent Blueprint — Cursor Addendum (v1.3)

This addendum reconciles `IQX_AGENT_BLUEPRINT.md` (v1.2, authored for Claude
Code) with how the IQX Factory actually operates in Cursor. **Where this
addendum conflicts with the base Blueprint, this addendum wins for Cursor
execution.** The base Blueprint remains canonical for agent definitions,
sequencing, gates, governance, and the product doctrine.

---

## 1. Agent file layout — single file, not seven

**Base Blueprint Section 7** describes seven files per agent
(`AGENT.md`, `INSTRUCTIONS.md`, `SKILL.md`, `OUTPUT-SPEC.md`, `INPUTS.md`,
`DEPENDENCIES.md`, `MCP.md`) under `agents/<name>/`.

**Cursor reality:** Each agent is a **single Markdown file** with YAML
frontmatter, stored at:

```
offerings/<Industry>IQX/.cursor/agents/<agent-name>.md
```

The single file encodes all seven concerns as body sections:

| Base Blueprint file | Becomes a section in the single agent .md |
|---------------------|-------------------------------------------|
| AGENT.md            | `# Identity and Purpose` (+ frontmatter) |
| INSTRUCTIONS.md     | `# Instructions` |
| SKILL.md            | `# Domain Knowledge` |
| OUTPUT-SPEC.md      | `# Output Specification` |
| INPUTS.md           | `# Required Inputs` |
| DEPENDENCIES.md     | `# Dependencies` |
| MCP.md              | `# MCP` (only when an MCP connection is needed) |

This matches the proven pattern in the Claude project's
`.claude/agents/<name>.md` files. The Cursor equivalent directory is
`.cursor/agents/`.

## 2. Outputs directory

**Base Blueprint Section 8** shows an `output/` directory nested under each
agent. **Cursor uses a flat top-level** `agent-outputs/<agent-name>/`
directory per offering, matching the `output` paths in `factory/phases.yaml`.
Project rule: each agent writes only inside its own `agent-outputs/<agent-name>/`
folder.

## 3. Agent frontmatter (provider-agnostic models)

Generated agents use this frontmatter shape:

```yaml
---
name: <agent-name>
description: "<one-line: stage, role, when to use, dependency note>"
model_tier: tier1 | tier2 | tier3        # NOT a provider model id
model_tier_notes: "<optional rationale or stage-4 tier1 bias note>"
tools: [Read, Write, Edit, Glob, Grep]    # per tool_profile in phases.yaml
---
```

`model_tier` replaces the base Blueprint's `model: opus|sonnet|haiku`. Cursor
users map tiers to whatever models their plan offers (see root `AGENTS.md`).
Tier ↔ Blueprint mapping: tier1=Opus-class, tier2=Sonnet-class, tier3=Haiku-class.

## 4. Repo-relative paths (no absolute OneDrive paths)

**Base Blueprint Section 3.5** and the Claude `iqx-factory.md` hard-code
absolute paths such as `C:\Users\jared.amaral\Projects\IQX\...` and
`C:\Users\jared.amaral\OneDrive - Verndale\IQX\shared-templates\`.

**Cursor uses repo-relative paths only**, resolved through
`factory/paths.yaml`. No agent, skill, or factory step may hard-code an
absolute machine path. This makes the toolset portable and team-shareable.

## 5. Shared knowledge pack location

- Canonical source in the toolset: `shared-templates/` (repo root, version-controlled).
- The factory copies the 10 files into each offering's `shared/` folder at scaffold time.

## 6. Stage 4 prototype directories (new in Cursor)

Because Sigma supports **workbook-as-code** and Cursor agents can author/modify
workbook YAML directly, every offering scaffold includes a `prototype/` tree:

```
offerings/<Industry>IQX/prototype/
  sigma-workbooks/           # Workbook-as-code YAML/JSON (version-controlled)
    README.md                # full-representation rule, schemaVersion, beta caveats
    feasibility-matrix.yaml  # copied from Agent 21 output
  snowflake/                 # DDL, MART_SIGMA views, load scripts, data dictionary
    README.md
```

- **Agent 21** (prototype-experience-spec-builder) writes the spec to
  `agent-outputs/` AND emits Sigma-native pages as workbook-as-code YAML into
  `prototype/sigma-workbooks/`. Unsupported/aspirational interactions stay in
  the spec/feasibility matrix only — never as generated workbook content.
- **Agent 22** (synthetic-data-generator) writes Snowflake DDL, views, and load
  scripts into `prototype/snowflake/`.
- **Agent 23** (launch-readiness-assessor) adds two pass/fail checks:
  1. A workbook-as-code file exists for every Sigma-native page in the page inventory.
  2. No unsupported Sigma element is presented as generated workbook content.

Workbook-as-code is **beta**. The factory must not present unsupported elements
(buttons, input tables, action sequences, modals, tabs, forms) as canonical
generated behavior. See `shared-templates/sigma-workbook-as-code-rules.md` and
the `sigma-workbook-as-code` skill.

## 7. Orchestration layer (new in Cursor)

The base Blueprint assumes a human invokes agents in sequence. Cursor adds:

- `offerings/<Industry>IQX/manifest.yaml` — stage, gate status, per-agent state,
  approvals. Source of truth for resuming work across chat sessions.
- `iqx-stage-runner` skill — reads the manifest + `factory/phases.yaml`, finds
  the next runnable agent, verifies dependency outputs exist, reminds the user
  of the agent's `model_tier`, then invokes it.
- `iqx-gate-review` skill — enforces the five human gates, records decisions in
  `OFFERING-DECISIONS.md`, and updates the manifest.

## 8. Web research

Six agents require external web research (see `phases.yaml: web_research_agents`).
Workflow is unchanged from the base Blueprint (draft with `VERIFY:` flags →
external research → `research-inputs/` → Agent 27 finalizes). Cursor users may
optionally use the browser MCP for some research, but the VERIFY/ledger
discipline still applies.

## 9. Fresh-build rule (Rule 1)

Every offering is generated FRESH from this Blueprint (+ addendum) and
`shared-templates/`. The factory must NOT seed, copy, paraphrase, or diff a new
offering against any previously generated offering. (The original Claude
reference material that demonstrated the desired scaffold shape has been removed
from the repo; the principle remains: Blueprint + knowledge pack + intake context
are the only inputs.)

## 10. Optional eleventh shared file (Verndale strategy)

Verndale strategy is captured at scaffold time in the offering's `AGENTS.md`
(Verndale Context section) and/or via context intake. If a strategy source file
is supplied, the factory places it in the offering's `shared/` folder and notes
it in `docs-ledger.md`. It is not one of the 10 industry-agnostic templates.
