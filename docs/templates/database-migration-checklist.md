# 🗄️ Database Migration Checklist

- Migration file/name:
- Issue/PR:
- Author:

## Impact
- Tables/columns:
- Foreign keys/indexes:
- Backfill required:
- Cascade/delete effects:
- PII/session data impact:

## Safety
- [ ] Up migration is deterministic.
- [ ] Down migration reverses change where practical.
- [ ] Existing production data remains valid.
- [ ] SQLite and target DB behavior reviewed.
- [ ] Foreign key integrity tested.
- [ ] Concurrent booking behavior reviewed.
- [ ] Backup and recovery plan confirmed.
- [ ] No real data included in fixtures.

## Verification
- [ ] `php artisan migrate` tested.
- [ ] `php artisan migrate:rollback` tested where safe.
- [ ] `php artisan migrate:status` reviewed.
- [ ] Feature tests updated.
