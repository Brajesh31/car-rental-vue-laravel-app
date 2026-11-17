# 🧯 Disaster Recovery Plan

## Objectives
The service owner must approve Recovery Time Objective (RTO) and Recovery Point Objective (RPO). Do not assume values before backup frequency, data criticality and hosting capability are known.

## Dependencies
Source repository and release commit, environment secrets, database backups, migration history, uploaded images, queue/scheduler configuration, mail provider and DNS/HTTPS configuration.

## Recovery sequence
1. Declare incident and assign incident lead.
2. Identify affected components and preserve evidence.
3. Restore infrastructure and secrets from approved sources.
4. Restore database into an isolated environment.
5. Validate schema, record counts and application invariants.
6. Restore required uploaded assets.
7. Deploy a known-good compatible application release.
8. Smoke test login, catalogue, booking and cancellation.
9. Re-enable traffic gradually and monitor.
10. Record timeline, data-loss window and follow-up actions.

## Backup requirements
Backups must be encrypted, access-controlled, retained under approved policy and stored separately from primary infrastructure. Perform restore drills, not just backup creation.

## Drill record
Record date, participants, backup identifier, restore duration, data verification, issues and remediation owner.
