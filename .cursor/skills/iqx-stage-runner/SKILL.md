---
name: iqx-stage-runner
description: "Run the next IQX offering agent in sequence. Use when the user says 'run Stage 1', 'run the next agent', 'continue StudentIQX', or 'what's next for <Industry>IQX'. Reads manifest.yaml + factory/phases.yaml, verifies dependencies and gates, reminds the user of the agent's model tier, then invokes it and updates state."
---

# IQX Stage Runner (Step 3)

Orchestrates execution of an offering's 27 agents. Replaces the Claude "human
remembers what to run next" model with a dependency- and gate-aware runner backed
by `manifest.yaml`.

## Inputs
- `offerings/<Industry>IQX/manifest.yaml` — current state (source of truth)
- `factory/phases.yaml` — deps, gates, web_research, model_tier, shared_files, output
- The target offering (ask the user if ambiguous / multiple offerings exist)

## Algorithm

1. **Load state.** Read the offering `manifest.yaml`. Identify `current.stage`,
   gate statuses, and per-agent statuses.
2. **Gate check.** If `current.active_gate` is pending, STOP and tell the user a
   gate is awaiting approval → hand to `iqx-gate-review`. Do not run agents past
   an unpassed required gate.
3. **Pick next agent.** From `phases.yaml`, find the lowest-`n` agent in the
   current stage whose `status: pending` and whose `depends_on` are all `done`
   and whose `gate_required` (if any) is `passed`. Honor `can_parallel_with` to
   suggest parallelizable agents.
4. **Verify dependency outputs exist.** Confirm each dependency's `output` file
   is actually present on disk (not just marked done). If missing, flag the
   inconsistency and stop.
5. **Model tier reminder.** Tell the user the agent's `model_tier` (and any
   `model_tier_notes`, e.g. Stage 4 tier1 bias) and the provider-agnostic mapping
   from root `AGENTS.md`. Suggest they confirm/select the matching model.
6. **Web research handling.** If the agent is in `web_research_agents`, instruct
   it to emit `VERIFY:` flags and an `EVIDENCE-LEDGER.md` row per external claim,
   then set status `needs_research`. The user does external research →
   `research-inputs/` → Agent 27 finalizes. Do not fabricate sources.
7. **Invoke** the offering agent (`.cursor/agents/<agent>.md`) with its required
   inputs (offering AGENTS.md, dependency outputs, listed `shared_files`).
8. **Stage 4 skills.** For agents 21–23, ensure the `sigma-snowflake-prototype`
   and/or `sigma-workbook-as-code` skills are used (see phases.yaml `skills`).
9. **Update state.** On completion set the agent `status: done` and `output:
   <path>`, append a `history` entry (ts, agent, action, model_tier). When the
   last agent in a stage completes, set `current.active_gate` to that stage's
   gate and tell the user to run `iqx-gate-review`.
10. **Commit reminder.** Tell the user to commit the agent output, any
    `manifest.yaml` / `EVIDENCE-LEDGER.md` changes, and gate decisions before
    starting the next agent (see `factory/BLUEPRINT-ADDENDUM.md` §13). Offer to
    commit if the user asks.

## Guardrails
- Never skip a required gate or unmet dependency.
- Never run Stage 5 learning-loop agents as part of normal forward sequencing —
  they are on-demand (`trigger` in phases.yaml).
- Repo-relative paths only.
- Keep `manifest.yaml` and `OFFERING-DECISIONS.md` authoritative; chat memory is not.

## Related
- `iqx-gate-review` (human gates), `iqx-factory` (scaffold), `factory/phases.yaml`
