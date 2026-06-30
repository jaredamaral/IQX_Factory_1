---
name: iqx-gate-review
description: "Run a human approval gate for an IQX offering. Use when a stage completes or the user says 'review gate 2', 'approve the offering brief', 'is StudentIQX ready to proceed'. Presents the gate's evidence, captures the decision, and records it in OFFERING-DECISIONS.md + manifest.yaml."
---

# IQX Gate Review (human approval workflow)

Implements the five human gates from the Blueprint. A gate is a deliberate
human decision point — the runner will not advance past a pending required gate
until this skill records a decision.

## The five gates (see factory/phases.yaml)
| Gate | After agent | Decision options |
|------|-------------|------------------|
| gate-1 | commercial-wedge-validator (Stage 1) | proceed / revise / kill |
| gate-2 | delivery-architecture-and-implementation-planner (Stage 2) | approve / revise → writes OFFERING-BRIEF.md |
| gate-3 | gtm-collateral-generator (Stage 3) | approve / revise / hold |
| gate-4 | launch-readiness-assessor (Stage 4) | approve / revise / hold |
| gate-5 | learning loop | 5A inbox triage; 5B PROPOSED/ diff review |

## Flow
1. **Identify the gate.** From `manifest.yaml` `current.active_gate`, or the
   user's request.
2. **Assemble the evidence pack.** Summarize the relevant agent outputs for the
   gate (e.g. gate-1: industry brief, wedge assessment, strategic fitness;
   gate-2: the synthesized OFFERING-BRIEF inputs). Surface red flags, open
   `VERIFY:` items in `EVIDENCE-LEDGER.md`, and any quality-gate failures.
3. **Present the decision** using the `AskQuestion` tool with the gate's options.
4. **Record the decision (both places):**
   - Append a numbered entry to `OFFERING-DECISIONS.md` (date, gate, decision,
     rationale, decided-by, affected artifacts).
   - Update `manifest.yaml`: set `gates.<gate-id>.status` and `decided`, clear
     `current.active_gate`, and on approval advance `current.stage`.
5. **On `approve`:** for gate-2 ensure `OFFERING-BRIEF.md` is written/finalized;
   then tell the user the next stage is unlocked (run `iqx-stage-runner`).
   **On `revise`:** note what must change and which agents to re-run.
   **On `kill`:** mark the offering halted in the manifest; stop.
6. **Gate 5 specifics:**
   - **5A (inbox triage):** review `UPDATES-INBOX.md`; for accepted items trigger
     Agent 26 (offering-updater) → writes to `PROPOSED/`.
   - **5B (PROPOSED diff review):** review the `PROPOSED/` diff; on approve, move
     files to live, commit, append `UPDATES-LOG.md`; on reject, delete from
     `PROPOSED/` and mark the inbox item rejected.

## Guardrails
- Never approve a gate on the user's behalf — always use `AskQuestion`.
- Never let canonical artifacts change outside the PROPOSED/ → approve flow.
- Keep `OFFERING-DECISIONS.md` and `manifest.yaml` in sync.
- Gate review may run at tier2 since a human is in the loop (root AGENTS.md).
