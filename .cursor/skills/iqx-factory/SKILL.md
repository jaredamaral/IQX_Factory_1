---
name: iqx-factory
description: "Invoke the IQX Factory to scaffold a new industry-specific IQX offering. Use when the user says things like 'run the factory for StudentIQX', 'create the BankIQX offering', 'scaffold a new IQX offering', or 'build out <Industry>IQX'. Enforces a mandatory industry-context intake pause before generating any files."
---

# IQX Factory — Invocation Skill (Step 2)

This skill turns a request like *"Run the factory for StudentIQX"* into a fresh
offering scaffold. Its single most important job is to enforce the **mandatory
context-intake gate** before any files are created, then hand off to the
`iqx-factory` agent (`.cursor/agents/iqx-factory.md`) to generate the scaffold.

## Hard rules

1. **Never create files before intake is confirmed.** Context intake is a gate,
   not a suggestion (Rule 4).
2. **Build every offering fresh (Rule 1).** Generate agent bodies from
   `factory/IQX_AGENT_BLUEPRINT.md` (+ `factory/BLUEPRINT-ADDENDUM.md`) and
   `shared-templates/` only. Never seed/copy/diff a new offering against a
   previously generated offering.
3. **Repo-relative paths only**, resolved via `factory/paths.yaml`.
4. **Step 2 only.** Scaffold structure + agent prompts. Do NOT run agents or
   produce deliverables (that is Step 3, via `iqx-stage-runner`).

## Flow

### Step 1 — Parse the request
Extract:
- Industry name (e.g. "higher education / student success")
- Proposed offering directory name (e.g. `StudentIQX`) → confirm `offerings/<name>/`

### Step 2 — PAUSE for context intake (MANDATORY — no files yet)
Present this checklist and ask the user to provide whatever they have. State
clearly: *"Optional items can be skipped, but confirm before I scaffold."*

```
□ Industry name (confirm)
□ Offering directory name (confirm or override)
□ Industry context (3–5 sentences): structural oddities, constituent types,
  LOB equivalents, known incumbents, budget dynamics
□ Known Verndale relationships / clients in this industry
□ Snowflake / Sigma relevance (existing clients, partner motion)
□ Initial commercial wedge hypothesis (optional)
□ Explicit constraints ("DO NOT ASSUME" items)
□ Any strategy source file to place in shared/ (optional; see addendum §10)
□ Anything else to bake into the offering AGENTS.md
```

Use the `AskQuestion` tool for the confirm/proceed decision and for any
structured fields that help.

### Step 3 — Summarize back with context labels
Read back industry name, directory name, and all captured context, tagging each
item: `USER-PROVIDED`, `HYPOTHESIS`, `DO NOT ASSUME`, or `VERIFY`. This is what
will be written into the offering's `AGENTS.md` Section 2.

### Step 4 — Explicit confirmation
Wait for the user to say **"Proceed with scaffold"** (or equivalent). Do not
proceed on ambiguity.

### Step 5 — Hand off to the factory agent
Invoke the `iqx-factory` agent to execute the scaffold steps (offering AGENTS.md,
copy knowledge pack to shared/, generate 27 agents from phases.yaml, manifest,
governance files, prototype dirs, gap-check, git baseline). Pass the labeled
context from Step 3.

### Step 6 — Report and point to Step 3
Report what was created (directory, 27 agents, pending gates) and tell the user
the next action: *"Run Stage 1"* via the `iqx-stage-runner` skill. Remind them
that Step 2 produced structure only — no deliverables yet.

## Model tier
Run this invocation with a **tier1** (strongest) model — see root `AGENTS.md` for
the provider-agnostic tier mapping. Generating 27 compliant agent prompts and
cross-file-consistent governance is a tier1 task.

## Related
- Agent: `.cursor/agents/iqx-factory.md`
- Phase graph: `factory/phases.yaml`
- Templates: `factory/templates/`
- After scaffold: `iqx-stage-runner`, `iqx-gate-review` skills
