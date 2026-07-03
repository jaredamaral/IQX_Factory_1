# React Sketchpad Constraints

## Purpose

This file constrains React's role in IQX prototyping.

React may be useful for exploring visual ideas, but it is not the canonical front end. Sigma is the canonical IQX application layer.

## Core Rule

React is a sketchpad, not the blueprint.

No React output may define canonical product scope unless the idea is also:

- Sigma-native
- Sigma-approximate
- Or documented as requiring manual Sigma build

If a React idea cannot be mapped to Sigma, it is aspirational only.

## When React Is Allowed

React may be used when:

- The product designer wants visual inspiration.
- The Sigma pattern is known but a more polished sketch helps communicate intent.
- A non-canonical future-state concept needs exploration.
- The design team needs to compare layout options before returning to Sigma.

React should be avoided when:

- It will become the only prototype.
- It defines interactions before Sigma feasibility is checked.
- It hides data/model gaps behind UI polish.
- It encourages custom SaaS behavior that Sigma cannot reproduce.

## Required React Disclaimer

Every React prototype spec must state:

```text
This React prototype is non-canonical. The canonical IQX prototype is the Sigma workbook/application experience backed by Snowflake. Any React behavior not mapped to Sigma is aspirational and excluded from canonical scope.
```

## React Divergence Register

Every React sketch must include:

```yaml
interaction:
react_behavior:
sigma_classification:
sigma_approximation:
manual_sigma_work_required:
canonical_allowed:
aspirational_only:
reason:
```

## Classification Rules

Use the same classifications as the Sigma capability matrix:

```text
Sigma-native
Sigma-approximate
Requires manual Sigma build
Currently unsupported / aspirational
React-only, not allowed in canonical prototype
```

## React Patterns To Avoid As Canonical

Do not make these canonical unless a Sigma implementation is documented:

- Drag-and-drop journey builders
- Multi-step wizards
- Modal-heavy workflows
- Complex forms
- Command palettes
- Chat-first interfaces
- Custom card grids
- Kanban boards
- Animated state transitions
- Arbitrary custom navigation
- Inline editing flows
- Custom approval buttons
- Custom notification centers

## Sigma Approximation Required

Before writing a React spec, agents must define the Sigma approximation.

Examples:

| React Pattern | Required Sigma Approximation |
|---|---|
| Wizard | Sequential Sigma pages or sections |
| Modal detail | Detail page or filtered drilldown |
| Drag-and-drop priority list | Prioritized table with status/order fields |
| Editable form | Snowflake activation request table; manual Sigma build if editing required |
| Chat assistant | Snowflake AI output/recommendation table reviewed in Sigma |
| Custom cards | Table, grouped table, KPI strip, or chart section |

If no Sigma approximation exists, the React pattern is aspirational only.

## Data Rules

React must not invent data.

React sketches should use the same:

- Synthetic dataset
- Metrics
- Scores
- Recommendations
- Activation state
- Persona names
- Demo storyline

as the Sigma/Snowflake prototype.

## Activation Rules

React may sketch activation UX, but Snowflake owns:

- Activation request state
- Audience membership
- Destination payloads
- Approval/rejection/defer events
- Export/sync logs
- Outcome events
- Feedback events

React-only activation behavior is not canonical.

## AI Rules

React may sketch AI interactions only when the underlying AI output is defined in Snowflake.

React must not invent:

- Recommendations
- Explanations
- Scores
- Generated text
- Search results
- Next-best-action outputs

unless they are backed by synthetic Snowflake data or explicitly labeled placeholder content.

## Agent 21 Requirements

If Agent 21 includes React, it must produce:

- Sigma-first spec first
- React spec second
- React divergence register
- Sigma approximation for every React interaction
- Explicit aspirational labels for unsupported ideas

## Agent 23 Requirements

Agent 23 must fail readiness if:

- React-only behavior appears in canonical scope.
- The divergence register is missing.
- React data does not match Snowflake/Sigma data.
- React creates activation behavior not represented in Snowflake.
- React makes AI claims without Snowflake-backed outputs.

## Rule Of Thumb

React can help imagine. Sigma must be able to deliver.
