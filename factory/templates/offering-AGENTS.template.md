# <Industry>IQX — Offering Project Context

> Cursor port of the Claude `CLAUDE.md`. This is the shared context every agent
> in this offering reads first. Keep claims labeled. (A `CLAUDE.md` alias may be
> written alongside this file for Claude parity.)

## 1. What this offering is

`<Industry>IQX` is Verndale's industry-specific customer intelligence and
activation offering for **<industry name>**. It follows the IQX product model
(Customer 360 → Intelligence → Activation), is Sigma-first and Snowflake-backed,
and is produced by the 27-agent IQX army across 5 stages.

- Canonical spec: `factory/IQX_AGENT_BLUEPRINT.md` + `factory/BLUEPRINT-ADDENDUM.md`
- Phase graph: `factory/phases.yaml`
- State: `manifest.yaml`

## 2. Industry context (labeled)

> Filled from context intake. Tags: `USER-PROVIDED`, `HYPOTHESIS`,
> `DO NOT ASSUME`, `VERIFY`.

- **Industry:** <USER-PROVIDED>
- **Structural oddities / constituent types / LOB equivalents:** <...>
- **Known incumbents:** <...>
- **Budget dynamics / buyer vs user:** <...>
- **Regulatory regime:** <...>
- **Commercial wedge hypothesis:** <HYPOTHESIS ...>
- **DO NOT ASSUME:** <constraints>

## 3. Verndale context

- Known relationships / clients in this industry: <USER-PROVIDED or VERIFY>
- Snowflake / Sigma relevance: <...>
- Strategy source (if provided): see `shared/<file>` (docs-ledger.md)

## 4. Operating rules (all agents)

1. **Sigma-first, Snowflake-backed.** React is a non-canonical sketchpad only.
   See `shared/product-doctrine.md`.
2. **Evidence discipline.** No external claim without an `EVIDENCE-LEDGER.md`
   row. Draft research with inline `VERIFY:` flags; Agent 27 finalizes.
3. **Context labels** on every industry fact.
4. **Write only inside your own** `agent-outputs/<agent-name>/` folder (Stage 4
   builders also write to `prototype/`).
5. **Never silently mutate canonical artifacts** — propose changes in `PROPOSED/`.
6. **Respect dependencies and gates** in `factory/phases.yaml` + `manifest.yaml`.

## 5. Shared knowledge pack

The 10 files in `shared/` are the canonical Sigma/Snowflake doctrine. Agents
read the specific files listed for them in `factory/phases.yaml` (`shared_files`).

## 6. Model tiers

Each agent declares a `model_tier` (tier1/tier2/tier3). Map tiers to your
provider's models per root `AGENTS.md`. Stage 4 (Agents 21–23) biases to tier1.
