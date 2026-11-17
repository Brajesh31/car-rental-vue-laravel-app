# ↩️ Rollback Plan

## Change to reverse
Commit, release, migration and affected services.

## Rollback trigger
Define measurable failure conditions and who can authorize rollback.

## Application rollback
Identify known-good release and exact deployment procedure.

## Database strategy
State whether schema is backward compatible. Document restore or forward-fix strategy. Never assume a destructive migration can be rolled back automatically.

## Data and asset recovery
Identify backup IDs, upload storage and potential data loss window.

## Validation
Verify health, authentication, catalogue, booking invariants, queues and logs.

## Communication
Record incident channel, stakeholder owner and customer communication decision.

## Closure
Record outcome, timeline and corrective actions.
