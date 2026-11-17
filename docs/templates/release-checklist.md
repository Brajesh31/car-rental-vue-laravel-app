# 🚀 Release Checklist

## Build
- [ ] `composer install --no-dev --optimize-autoloader` succeeds.
- [ ] `npm ci` and `npm run build` succeed.
- [ ] PHPUnit feature tests pass.
- [ ] Pint style check passes.

## Security
- [ ] Public signup cannot set role.
- [ ] CSRF enabled.
- [ ] Dashboard props scoped by role.
- [ ] Rental ownership enforced.
- [ ] Booking total calculated server-side.
- [ ] Booking conflict protected under concurrency.
- [ ] GET mutations removed.
- [ ] No secrets or sensitive database snapshots exposed.

## Data
- [ ] Migrations reviewed and tested.
- [ ] Backup/restore verified.
- [ ] Seeders safe for target environment.
- [ ] Car image storage policy verified.

## Runtime
- [ ] APP_DEBUG=false.
- [ ] APP_KEY and DB secrets provisioned externally.
- [ ] Mail transport tested.
- [ ] Scheduler command signature matches schedule.
- [ ] Queue workers supervised if required.
- [ ] HTTPS and public document root configured.

## Approval
- Release owner:
- Commit:
- Date:
