# IQX Factory — Educational Guide

> **How to read this guide.** Each section is written for any reader. Where you see a block like this:
>
> > **⚙ Technical detail:** This is extra depth for engineers, architects, or developers.
>
> ...that's optional context for technical readers. Non-technical readers can skip it without losing the thread.

---

## Presentation alternatives

Before diving in, a note: this `.md` file is the raw content. Here are three ways to turn it into something more engaging:

| Format | Why it works | How |
|--------|--------------|-----|
| **Notion page** | Toggleable sections, callout blocks, embedded tables — great for internal teams exploring at their own pace | Paste this file into Notion; its Markdown importer handles headings, tables, and blockquotes natively |
| **Slides (one slide per folder)** | Forces a "what's the point of this folder in one sentence" discipline; good for walkthroughs | Use the existing `comms/build_iqx_factory_deck.py` Python script as a starting point, or drop sections into Google Slides / PowerPoint |
| **Interactive README in VS Code or Cursor** | Live preview, collapsible sections via `<details>` tags, direct file links — the content lives right next to the code | Open this file in the IDE and use Markdown Preview |
| **Printed / PDF cheat sheet** | Good for people who need a reference card next to their screen during a walkthrough | Export from Notion or VS Code's Markdown PDF extension |

---

## Part 1 — What is the IQX Factory?

The IQX Factory is a software toolset that lives inside this Cursor project. Its purpose is to automate the process of researching, designing, and prototyping **IQX Offerings** — industry-specific intelligence and customer-data products that Verndale builds for clients.

Before the Factory existed, building something like BankIQX (a banking-industry version of the product) required doing all the research, strategic thinking, data modeling, and prototype design manually, from scratch, every time. That work took significant time and varied in quality depending on who did it.

The Factory changes that. Instead of doing that work by hand, you give the Factory an industry name and a few pieces of context about the client, and it produces a structured, consistent, working draft of the entire IQX Offering — research, strategy, data models, use cases, sales materials, and a working prototype design — through a sequence of AI agents working in order.

**What it is not.** The Factory does not replace human judgment. It produces drafts. At five defined checkpoints, a human must review what the agents produced, decide whether it is good enough to continue, and approve the next stage. The system is designed to assist people, not replace them.

---

## Part 2 — The three-step model

Everything in this repository is organized around three steps:

```
Step 1 — Build the Factory      (already done — this is what this repo IS)
Step 2 — Invoke the Factory     (run it for a specific industry)
Step 3 — Run the Offering       (execute all 27 agents in sequence)
```

**Step 1** is complete. This repository *is* the Factory. It contains all the instructions, templates, rules, and orchestration logic the system needs.

**Step 2** is when a user asks the Factory to scaffold a new offering. You tell it: "Build out RetailIQX" (or BankIQX, HealthIQX, etc.). The Factory asks you some clarifying questions about the industry, pauses to make sure it has what it needs, and then generates a complete project folder for that offering — pre-populated with all 27 agent files, governance documents, and a state-tracking file.

**Step 3** is when you run the agents inside that generated offering, one at a time, in order. Each agent does a piece of research, strategic analysis, or design work and writes its output to a file. A human gate sits between each stage to review and approve progress.

> **⚙ Technical detail:** The Factory is a Cursor-native system. "Running an agent" means invoking a `.md` file as a Cursor agent instruction set, which executes against the AI model configured for that agent. The orchestration skill (`iqx-stage-runner`) reads a YAML state file (`manifest.yaml`) to know which agent to run next, what dependencies it needs, and what outputs it should produce. Agents never communicate with each other directly — they read input files and write output files.

---

## Part 3 — Folder-by-folder walkthrough

---

### `factory/` — The engine room

This is the core of the Factory. Everything needed to understand what the Factory does, in what order, and how is in this folder.

#### `factory/IQX_AGENT_BLUEPRINT.md` — The master specification

This is the longest and most important single file in the repository (~1,200 lines). Think of it as the architecture document for the entire system.

It defines:
- What an IQX Offering actually *is* (three layers: Customer 360, Intelligence, Activation)
- The full list of 27 agents, what each one does, what it reads, and what it writes
- The sequencing logic — which agents depend on which other agents
- The structure of a finished offering folder
- The governance rules the system must follow

**Analogy:** If the IQX Factory were a car factory, this file would be the engineering manual that describes every part, how they fit together, and what the finished car should look like.

> **⚙ Technical detail:** The Blueprint was originally written for Anthropic's Claude agent framework (with a seven-file agent structure). The Cursor version adapts this to single `.md` files with YAML frontmatter, flat `agent-outputs/` directories, and provider-agnostic model tiers. The BLUEPRINT-ADDENDUM.md (described next) captures all the Cursor-specific deltas.

---

#### `factory/BLUEPRINT-ADDENDUM.md` — The Cursor adaptation

When the Blueprint was brought into Cursor, some things needed to change. This file documents every difference between the original Blueprint and how the system actually works in Cursor. When the two documents conflict, this one wins.

Key changes it documents:
- Agent files are single `.md` files, not seven separate files
- Output folders use a flat structure (`agent-outputs/`) instead of nested folders
- AI model references are "tier 1/2/3" instead of vendor-specific names (so the system works with any AI provider)
- All file paths must be relative to the repository, not hard-coded to a specific machine

> **⚙ Technical detail:** The Addendum is at schema version `v1.3-cursor`. The `model_tier` field in each agent's YAML frontmatter (tier1/tier2/tier3) maps to whatever your current Cursor flagship/default/fast model is — the system never names a specific vendor model.

---

#### `factory/phases.yaml` — The execution graph

This file is the machine-readable version of the agent sequencing logic. It tells the orchestration system exactly which agents exist, what stage they belong to, what model tier they should run on, what files they depend on, and what they produce.

Every time the stage-runner skill needs to know "what should I run next?", it reads this file.

**Analogy:** If the Blueprint is the engineering manual, `phases.yaml` is the assembly-line schedule — the step-by-step production order.

> **⚙ Technical detail:** Each agent entry in `phases.yaml` includes: `id`, `n` (sequence number), `stage` (1–5), `model_tier`, `tool_profile` (producer/analyst/builder), `depends_on` (list of agent IDs), `outputs` (list of expected file paths), `shared_files` (which knowledge-pack files to copy into context), and optional `skills` (Sigma/Snowflake skill invocations). A `web_research_agents` list flags the six agents that require live internet research and should have their outputs flagged for human verification.

---

#### `factory/paths.yaml` — The address book

This file is a single source of truth for where everything lives in the repository. Rather than hard-coding paths throughout the system, every skill and agent that needs to reference a file looks it up here.

Why this matters: it means if a folder gets renamed or moved, you change one file instead of hunting through dozens of agent files to update paths.

> **⚙ Technical detail:** `paths.yaml` enumerates: `blueprint`, `addendum`, `phases`, `shared_templates` (all 10 filenames), `factory/templates` (all 13 template names), `sigma_tooling` (upstream GitHub repo, install script path, token helper path, gitignored credentials location), and `offerings_root`. Consumed by the `iqx-factory` agent and both runner skills.

---

#### `factory/SIGMA-INTEGRATION.md` — The Sigma wiring guide

Sigma is the data visualization and analytics platform that IQX Offerings are designed around. This file explains how to connect the Factory to Sigma's API so that the prototype workbooks built in Stage 4 can actually be deployed to a real Sigma environment.

It covers: installing the external Sigma skills, setting up API credentials, how the Factory's own Sigma skills relate to the official Sigma tools, and in what order to invoke them during Stage 4.

> **⚙ Technical detail:** Two external Sigma skills (`sigma-api`, `sigma-data-models`) are an optional external dependency, installed via the PowerShell script in `factory/scripts/`. They are gitignored and not vendored in this repo. The Factory's own skills (`sigma-workbook-as-code`, `sigma-snowflake-prototype`) wrap those external skills with IQX-specific doctrine and call them during Agents 21–23.

---

### `factory/templates/` — The blank forms

This folder contains 13 template files. When the Factory scaffolds a new offering, it fills in these templates to create the starting files for that offering's project folder.

Think of them as pre-formatted forms — the structure is there, the fields are labeled, but the content gets filled in when the offering is created.

| Template | What it becomes in an offering |
|----------|-------------------------------|
| `agent.template.md` | One of the 27 agent instruction files |
| `manifest.template.yaml` | The state-tracking file for the entire offering run |
| `offering-AGENTS.template.md` | The offering's own orientation document |
| `OFFERING-BRIEF.template.md` | The Gate 2 strategic brief document |
| `OFFERING-DECISIONS.template.md` | An append-only log of every human gate decision |
| `EVIDENCE-LEDGER.template.md` | A tracking table for every external claim the agents make |
| `SALES-LEARNINGS.template.md` | A field-input file where sales teams log what they hear in conversations |
| `UPDATES-INBOX.template.md` | A triage queue for proposed changes to a live offering |
| `UPDATES-LOG.template.md` | An approved-changes log (Stage 5 updates) |
| `PROPOSED-README.template.md` | Explains how staged changes work in Stage 5 |
| `prototype-snowflake-README.template.md` | Documents the Snowflake data layer structure |
| `prototype-sigma-workbooks-README.template.md` | Documents the Sigma workbook outputs |

> **⚙ Technical detail:** The `manifest.template.yaml` is the runtime state machine for the offering. It tracks all 27 agents at `pending` initially, gate statuses, current stage, a `history` array of completed runs, and the model-tier mapping for the session. The `iqx-stage-runner` and `iqx-gate-review` skills read and write this file exclusively to track progress.

---

### `factory/scripts/` — The setup scripts

Two PowerShell scripts that handle one-time setup tasks:

- **`install-sigma-skills.ps1`** — Downloads the official Sigma agent skills from GitHub and links them into the project so Cursor can use them during Stage 4.
- **`get-sigma-token.ps1`** — Exchanges Sigma API credentials for a temporary access token. Used during Stage 4 when the system actually needs to talk to the Sigma API.

These scripts only need to be run once per machine setup and once per API session (the token expires after about an hour).

---

### `shared-templates/` — The knowledge pack

This folder holds 10 files (plus a README) that contain the core institutional knowledge the system uses every time it builds an offering. When the Factory scaffolds a new offering, it copies these 10 files into the offering's own `shared/` folder so the agents can reference them.

The key principle behind this folder: *the rules about how to use Sigma and Snowflake should be consistent across every IQX Offering, forever.* When Sigma releases a new feature or Snowflake changes something, you update the file here once, and every new offering gets the updated knowledge.

Here's what each file covers:

| File | What it contains |
|------|-----------------|
| `product-doctrine.md` | The fundamental rules: Sigma is the canonical user experience, Snowflake holds all data, React is only a sketchpad, technical honesty is non-negotiable |
| `sigma-capability-matrix.yaml` | A detailed, feature-by-feature classification of what Sigma can and cannot do: "Sigma-native," "Sigma-approximate," "Requires manual build," or "Unsupported" |
| `sigma-first-design-rules.md` | How to translate user personas, jobs-to-be-done, and use cases into experiences that can actually be built in Sigma |
| `sigma-workbook-as-code-rules.md` | The rules for generating Sigma workbooks as code (currently a beta feature): what's supported, what's not, and how to represent workbooks accurately |
| `snowflake-platform-rules.md` | Snowflake's role in the IQX system: which data layer does what, how AI features (Cortex) work, governance requirements |
| `snowflake-data-modeling-patterns.md` | Reusable data model patterns for Customer 360, synthetic data generation, analytics views, metrics, and activation tables |
| `activation-data-patterns.md` | How to model the "action layer" — who receives a recommendation, what they can do with it (approve/edit/reject/defer), how to track it |
| `react-sketchpad-constraints.md` | Rules for when React visualizations are allowed, what they cannot claim to be, and how to map them back to Sigma equivalents |
| `quality-gates.md` | Shared pass/fail criteria for each stage and each gate — what "good enough to proceed" looks like |
| `docs-ledger.md` | A source register tracking which Sigma and Snowflake documentation was used to build this knowledge pack and when it was last reviewed |

> **⚙ Technical detail:** `sigma-capability-matrix.yaml` is the system's ground truth for feasibility classification at the feature level. Each entry carries a `classification` enum, a `notes` field, and one or more `sources` (usually Sigma documentation URLs). Agent 12 (use-case-architect) and Agent 21 (prototype-experience-spec-builder) both read this file to classify every proposed use case before writing it into any deliverable. This is the primary mechanism that prevents the system from generating technically dishonest output.

---

### `.cursor/` — The Cursor integration layer

This folder is where the Factory is wired into the Cursor IDE. It contains three sub-folders: `agents/`, `skills/`, and `rules/`.

---

#### `.cursor/agents/iqx-factory.md` — The scaffold generator

This is the one agent that lives at the factory level (not inside an offering). Its job is Step 2: take an industry name and context, and generate the complete offering folder structure.

It enforces two rules strictly:
1. **Never seed from another offering.** Every new offering is built fresh from the Blueprint and `shared-templates/`, not copied or adapted from an existing one.
2. **Mandatory context intake.** Before generating any files, it pauses to collect specific information about the industry, the Verndale angle, and any known constraints. It labels everything it knows as either USER-PROVIDED, HYPOTHESIS, or VERIFY.

> **⚙ Technical detail:** The scaffold agent performs nine discrete steps in order: creates `AGENTS.md`, copies the 10 shared-template files into `shared/`, generates all 27 agent `.md` files from the template, creates `manifest.yaml` from the template, creates all five governance files, creates the `prototype/` directory structure, runs a gap-check against `phases.yaml` to confirm all expected files exist, and creates the initial git commit. It does not run any offering agents — that is Step 3.

---

#### `.cursor/skills/` — The orchestration skills

Skills are instruction sets that the AI follows when a user invokes them by name or description. There are five skills in this folder:

**`iqx-factory/SKILL.md` — The Step 2 invoker**
When a user says "run the factory for HealthIQX," this skill kicks in. It parses the request, triggers the mandatory context intake pause, shows a labeled summary of what it knows, waits for human confirmation, then hands off to the factory agent. It does not scaffold anything itself — it sets up the factory agent to do so safely.

**`iqx-stage-runner/SKILL.md` — The Step 3 orchestrator**
When a user says "run the next agent" or "continue StudentIQX," this skill loads the offering's `manifest.yaml` and `phases.yaml`, figures out which agent should run next, checks that all its dependencies are met, reminds the user which AI model tier to use, and then invokes the agent. For Stage 4 agents, it automatically invokes the Sigma and Snowflake skills at the right moments.

**`iqx-gate-review/SKILL.md` — The human gate**
Between stages, a human must review what was produced. This skill assembles the relevant evidence (output files, agent summaries), presents a decision interface, captures the decision (proceed/revise/kill), and records it permanently in the offering's decision log. It never auto-approves — a human must always confirm.

**`sigma-workbook-as-code/SKILL.md` — The Sigma builder**
During Stage 4, this skill takes the prototype experience specification and turns it into a version-controlled Sigma workbook YAML file. It classifies every page against the capability matrix, only generates code for things Sigma can actually do, and can optionally deploy the workbook directly to a Sigma environment via the API.

**`sigma-snowflake-prototype/SKILL.md` — The Snowflake builder**
Also during Stage 4, this skill generates the Snowflake data backend for the prototype: the full layer model from raw synthetic data through to governance, the SQL DDL (table definitions), synthetic data load scripts, governed metric definitions, and activation tracking tables.

> **⚙ Technical detail:** Skills are consumed by the parent agent (the Cursor session) rather than being subagents themselves. The `iqx-stage-runner` skill has the most complex logic: it handles dependency resolution, gate blocking, the `web_research_agents` list (flagging outputs that need human verification), and the Stage 4 multi-skill invocation sequence (Agent 21 → workbook-as-code, Agent 22 → snowflake-prototype, Agent 23 → launch readiness). All state writes go through `manifest.yaml` updates.

---

#### `.cursor/rules/sigma-first-doctrine.mdc` — The always-on rule

This file is always active in every Cursor session in this project. It enforces five doctrine points:

1. Sigma is the canonical user experience — every proposed interaction must be classified against the capability matrix.
2. Snowflake backs everything — data, metrics, intelligence, activation state, and audit logs.
3. React is not canonical — it is only a visualization sketchpad.
4. Workbook-as-code is in beta — only Sigma-supported elements get generated as code.
5. Technical honesty beats demo polish — if something can't be built in Sigma, it is not presented as if it can.

This rule is not advisory. It is applied to every prompt in every session. Any agent or skill running in this project is always aware of these constraints.

> **⚙ Technical detail:** The `.mdc` file format is a Cursor-specific rule format. The `alwaysApply: true` frontmatter setting causes Cursor to inject this rule into every agent context window automatically, without the user having to reference it. This is the primary enforcement mechanism for doctrine consistency across all 27 agents.

---

### `offerings/` — The factory's output

This folder is currently empty (except for a README placeholder). It is where the Factory writes new offerings when Step 2 is run.

When you invoke the Factory for an industry — say, HealthIQX — it creates:

```
offerings/HealthIQX/
├── AGENTS.md              — orientation for agents working on this offering
├── manifest.yaml          — state tracker (which agents have run, which gates passed)
├── OFFERING-BRIEF.md      — the strategic brief (filled in by Gate 2)
├── OFFERING-DECISIONS.md  — permanent log of every human gate decision
├── EVIDENCE-LEDGER.md     — tracking table for every external claim
├── SALES-LEARNINGS.md     — field input from sales conversations
├── .cursor/agents/        — 27 agent instruction files
├── shared/                — copies of the 10 knowledge-pack files
├── agent-outputs/         — one sub-folder per agent, for their output files
├── research-inputs/       — external research documents fed to web-research agents
├── PROPOSED/              — staged changes waiting for Gate 5B approval
└── prototype/
    ├── sigma-workbooks/   — Sigma workbook YAML files
    └── snowflake/         — Snowflake DDL, views, and synthetic data scripts
```

> **⚙ Technical detail:** The `offerings/` root is the only directory whose contents are generated, not authored. Everything under an offering directory is produced by either the factory agent (scaffold), the 27 offering agents (content), or the gate-review skill (decisions). The `manifest.yaml` inside each offering is the only file that the orchestration system writes to during a run — it is the single source of truth for offering state.

---

### `comms/` — Executive communications

This folder contains materials for communicating about the Factory to stakeholders.

- **`iqx-factory-exec-deck-brief.md`** — A written brief that describes the narrative arc and content of a four-slide executive presentation: what the problem was (building each IQX from scratch doesn't scale), what changed (the Factory), what makes it credible (governed outputs, technically honest), and what the payoff is.
- **`build_iqx_factory_deck.py`** — A Python script that reads the brief and generates a PowerPoint file using the `python-pptx` library. It handles layout, colors, and text formatting.
- **`IQX-Factory-Exec-Deck.pptx`** — The output of that script: the actual executive deck file.

> **⚙ Technical detail:** The Python script uses `python-pptx` for slide generation. It defines a custom palette (navy/teal), sets 16:9 aspect ratio, and uses helper functions for consistent shape and text styling. The brief and script are separate so the narrative can be edited without touching the code, and the code can be re-run to regenerate the deck from an updated brief.

---

## Part 4 — The 27-Agent Army

The 27 agents are organized into five stages, each ending with a human approval gate. Here is what each stage does at a high level:

### Stage 1 — Discovery (Agents 1–8)
The first eight agents build foundational knowledge about the industry. They research the market landscape, business structure, constituent journeys, personas, systems and data environments, and external proof points. Agent 8 concludes Stage 1 by assessing whether Verndale has a credible commercial angle.

**Gate 1:** Does enough evidence exist to justify building a full offering? Proceed, revise, or stop.

### Stage 2 — Strategy (Agents 9–15)
These agents take the discovery output and build the strategic foundation of the offering. They research regulatory constraints, define differentiation and positioning, analyze the target market, architect the use case library, design the Customer 360 data model, model the business value case, and draft the delivery architecture.

**Gate 2:** Is the strategic brief complete and credible enough to move into go-to-market preparation?

### Stage 3 — Go-to-Market (Agents 16–20)
These agents prepare the offering for sales. They analyze the competitive landscape, model packaging and pricing, build the objection library, apply a red-team critique, and generate the complete GTM collateral package.

**Gate 3:** Is the offering commercially ready for sales conversations?

### Stage 4 — Prototype (Agents 21–23)
These three agents build the technical prototype. Agent 21 writes the prototype experience specification and generates Sigma workbook code. Agent 22 generates the Snowflake data backend — table definitions, synthetic data, and metrics. Agent 23 runs a launch-readiness assessment: can everything that was promised actually be built in Sigma and Snowflake?

**Gate 4:** Is the prototype technically honest and launch-ready?

### Stage 5 — Living Offering (Agents 24–27)
These agents run on-demand, not in sequence. They monitor for updates: Agent 24 watches Slack for new inputs, Agent 25 synthesizes sales field learnings, Agent 26 writes proposed changes into a staging area (`PROPOSED/`) for human review, and Agent 27 verifies evidence claims after human-conducted research.

**Gate 5:** Two-part: (5A) Is the inbox triaged and ready for action? (5B) Are the proposed changes approved for merge into the live offering?

> **⚙ Technical detail:** The six web-research agents (1, 7, 9, 11, 14, 16) are flagged in `phases.yaml` under `web_research_agents`. The stage-runner skill treats their outputs with a `needs_research: true` tag and reminds the user to verify claims through the `EVIDENCE-LEDGER.md` before proceeding. Stage 5 agents have no `depends_on` dependencies — they are triggered by user request or external signals (Slack MCP), not by the sequential runner.

---

## Part 5 — The five human gates

The gates are not formalities. They are the points where a human reviews what the AI produced and makes a real decision. The system enforces them: the stage-runner will not proceed past a gate until a human has recorded an approval in `manifest.yaml`.

Each gate decision is recorded permanently in `OFFERING-DECISIONS.md` with the date, the decision, and the rationale. This creates a full audit trail of every choice made during an offering build.

| Gate | After Stage | Decision type |
|------|-------------|---------------|
| Gate 1 | Discovery | Proceed / Revise / Kill |
| Gate 2 | Strategy | Approve Brief / Revise |
| Gate 3 | Go-to-Market | Sales-Ready / Revise |
| Gate 4 | Prototype | Launch-Ready / Revise |
| Gate 5A | Stage 5 Intake | Inbox Triaged / Hold |
| Gate 5B | Stage 5 Update | Approve Changes / Reject |

---

## Part 6 — Root-level files

### `README.md`
The project's entry point. Describes the three-step model, lists the quick-start chat commands for invoking the Factory, maps out the folder structure, explains the model tier system, and points to the key documents. This is the first file a new user of the Factory should read.

### `AGENTS.md`
An orientation file specifically for AI agents. When any agent is working in this project, Cursor automatically provides it with this file for context. It contains the same folder map as the README but adds the five hard rules the system enforces, the model-tier mapping table, and the note about Stage 4 Sigma setup requirements.

> **⚙ Technical detail:** Cursor reads `AGENTS.md` automatically and injects its contents into the system prompt of agents running in this project (analogous to how `.claude/project.md` works in Claude projects). The five hard rules in `AGENTS.md` are therefore always in scope for any agent, without a user having to reference them.

### `.gitignore`
Tells Git which files to exclude from version control. Excludes: a reference folder from an earlier iteration of this project, the external Sigma skills (installed locally but not owned by this repo), API credentials (`.env`), operating system noise files, and Python/Node package cache folders.

---

*End of guide.*
