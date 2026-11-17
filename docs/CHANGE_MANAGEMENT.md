# 🔄 Change Management

## Categories
- Standard: low-risk repeatable change with documented procedure.
- Normal: reviewed change requiring testing and approval.
- Emergency: urgent security/availability remediation with retrospective review.

## Change record
Document problem, expected outcome, scope, affected components, risk, user impact, test evidence, migration/data impact, deployment plan, rollback plan and monitoring.

## Database changes
Use forward migrations and avoid manual production schema edits. Prefer expand-and-contract changes when old and new application versions may overlap.

## Approval
Authentication, authorization, personal data, payments, booking concurrency, infrastructure and secrets require explicit maintainer review.

## Traceability
Link change to issue, pull request, commit and release. Update ADRs when architectural decisions change.
