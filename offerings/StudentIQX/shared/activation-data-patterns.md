# Activation Data Patterns

## Purpose

This file defines destination-neutral activation data patterns for IQX.

Activation is the layer where customer intelligence becomes action. It must be modeled with enough structure to support approval, handoff, auditability, outcome measurement, and learning.

## Core Rule

Do not treat activation as a button.

Every activation use case must define:

- Who acts
- What trigger causes action
- What recommendation appears
- What the user can approve, edit, reject, or defer
- What destination class receives the action
- What Snowflake table records the request
- What Snowflake table records the output
- What Snowflake table records audit events
- How compliance and consent are enforced
- How success is measured
- What feedback improves the intelligence layer

## Destination-Neutral Classes

Do not assume a specific platform unless the user provides one.

Use these destination classes:

```text
crm
marketing_automation
customer_service
ad_platform
internal_workflow
snowflake_table
manual_export
other
```

Agents may add a more specific destination later, but the shared model should remain portable.

## Recommended Activation Schema

Use these logical objects:

```text
ACTIVATION.ACTIVATION_REQUESTS
ACTIVATION.AUDIENCE_DEFINITIONS
ACTIVATION.AUDIENCE_MEMBERS
ACTIVATION.RECOMMENDATION_OUTPUTS
ACTIVATION.DESTINATION_PAYLOADS
ACTIVATION.APPROVAL_EVENTS
ACTIVATION.EXPORT_OR_SYNC_LOGS
ACTIVATION.OUTCOME_EVENTS
ACTIVATION.FEEDBACK_EVENTS
```

## ACTIVATION.ACTIVATION_REQUESTS

Grain:

```text
One row per activation request.
```

Recommended fields:

```text
activation_request_id
use_case_id
persona
requested_by
requested_at
destination_class
activation_type
audience_id
recommendation_run_id
business_goal
approval_status
request_status
compliance_status
expected_member_count
expected_value
notes
```

Status examples:

```text
draft
ready_for_review
approved
rejected
deferred
sent
failed
completed
```

## ACTIVATION.AUDIENCE_DEFINITIONS

Grain:

```text
One row per audience or cohort definition.
```

Recommended fields:

```text
audience_id
audience_name
use_case_id
created_by
created_at
definition_type
definition_summary
filter_summary
score_thresholds
eligibility_rules
suppression_rules
estimated_size
estimated_value
```

For generated prototypes, store human-readable summaries even if the exact filter logic is implemented elsewhere.

## ACTIVATION.AUDIENCE_MEMBERS

Grain:

```text
One row per activation request per audience member.
```

Recommended fields:

```text
activation_request_id
audience_id
member_id
customer_id
account_id
eligibility_status
suppression_status
consent_status
recommended_action
recommended_channel
score_value
score_band
expected_value
reason_code_1
reason_code_2
reason_code_3
payload_status
```

## ACTIVATION.RECOMMENDATION_OUTPUTS

Grain:

```text
One row per recommendation per customer/account per recommendation run.
```

Recommended fields:

```text
recommendation_id
recommendation_run_id
customer_id
account_id
recommendation_type
recommended_action
recommended_channel
recommendation_text
explanation
confidence_score
expected_value
model_version
generated_at
expires_at
review_status
```

Rules:

- Recommendations must be reviewable.
- Include explanation fields for trust.
- Include model/run fields for auditability.

## ACTIVATION.DESTINATION_PAYLOADS

Grain:

```text
One row per destination payload per activation request and member or aggregate.
```

Recommended fields:

```text
payload_id
activation_request_id
destination_class
destination_name
payload_type
payload_key
payload_json
payload_status
created_at
sent_at
error_message
retry_count
```

Destination-specific fields should be added only when the destination is known.

## ACTIVATION.APPROVAL_EVENTS

Grain:

```text
One row per approval, rejection, edit, or defer event.
```

Recommended fields:

```text
approval_event_id
activation_request_id
event_type
event_by
event_at
previous_status
new_status
reason
notes
changed_fields_json
```

Event types:

```text
submitted
approved
rejected
deferred
edited
cancelled
```

## ACTIVATION.EXPORT_OR_SYNC_LOGS

Grain:

```text
One row per export, sync, send, or delivery attempt.
```

Recommended fields:

```text
sync_log_id
activation_request_id
destination_class
destination_name
started_at
completed_at
status
records_attempted
records_sent
records_failed
error_message
run_metadata_json
```

## ACTIVATION.OUTCOME_EVENTS

Grain:

```text
One row per measurable outcome event attributable to an activation.
```

Recommended fields:

```text
outcome_event_id
activation_request_id
customer_id
account_id
outcome_type
outcome_value
outcome_at
attribution_method
measurement_window
control_or_treatment
```

Outcome examples:

```text
conversion
retention
renewal
purchase
appointment
case_resolution
engagement
unsubscribe
suppression
```

## ACTIVATION.FEEDBACK_EVENTS

Grain:

```text
One row per user or system feedback event.
```

Recommended fields:

```text
feedback_event_id
activation_request_id
recommendation_id
customer_id
feedback_by
feedback_at
feedback_type
feedback_value
notes
```

Feedback types:

```text
accepted
rejected
edited
not_relevant
wrong_channel
bad_timing
compliance_issue
successful
unsuccessful
```

## Governance Requirements

Every activation model must account for:

- Consent
- Suppression
- PII handling
- Audit logging
- User approval or review
- Destination payload status
- Error handling
- Outcome measurement

If a use case is regulated or sensitive, require explicit compliance guardrails.

## Sigma Surface Patterns

Activation in Sigma should usually appear as:

- Activation readiness table
- Audience member review table
- Recommendation review table
- Approval/status summary
- Suppression and exception table
- Destination payload preview
- Outcome measurement page

If Sigma cannot execute the full activation interaction, preserve canonical state in Snowflake and mark the Sigma interaction as approximate or manual-build.

## React Constraint

React may sketch a richer activation flow, but the canonical activation state must live in Snowflake.

React-only activation behavior is not canonical unless a Sigma implementation or approximation is documented.

## Agent Requirements

Agent 12 must define activation use case requirements.

Agent 13 must define activation data objects.

Agent 21 must map activation workflows to Sigma pages and Snowflake objects.

Agent 22 must generate sample activation records.

Agent 23 must fail launch readiness if activation lacks auditability, status, consent/suppression handling, or measurable outcomes.
