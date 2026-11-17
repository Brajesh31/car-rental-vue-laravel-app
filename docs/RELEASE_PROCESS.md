# 🚀 Release Process

## Release workflow

~~~mermaid
flowchart TD
 A[Create focused change] --> B[Review roles, CSRF and data impact]
 B --> C[Run PHP feature tests]
 C --> D[Build Vue assets]
 D --> E[Review migrations and uploads]
 E --> F{All checks pass?}
 F -->|No| G[Fix and repeat]
 G --> C
 F -->|Yes| H[Build release artifact]
 H --> I[Deploy to staging]
 I --> J[Smoke test auth, booking and mail]
 J --> K[Approve release]
 K --> L[Deploy and monitor]
~~~

## Pre-release checklist

- [ ] Public signup cannot grant admin role.
- [ ] CSRF protection enabled for web writes.
- [ ] Dashboard exposes only data allowed for actor.
- [ ] Rental ownership checks cover view/edit/cancel/status.
- [ ] Server recomputes booking total.
- [ ] Booking conflict protection tested under concurrency.
- [ ] GET mutation routes replaced with safe HTTP methods.
- [ ] Scheduler command name verified.
- [ ] Contact route and booking emails tested.
- [ ] Localhost asset URLs removed.
- [ ] `composer test` passes.
- [ ] `npm run build` passes.
- [ ] Migration forward/rollback behavior reviewed.
- [ ] Database snapshots and seeder credentials reviewed.
- [ ] Backups and storage recovery verified.
- [ ] APP_DEBUG=false and secrets configured outside source.

## Deployment verification

Check login, roles, CSRF, car image uploads, booking availability, booking amount, cancellation ownership, status automation, mail delivery, logs, and public asset paths.

## Rollback

Keep a known-good release and database backup. Assess migration compatibility before reverting application code. If user/session data or credentials were exposed, code rollback alone is insufficient; rotate credentials and revoke sessions as appropriate.
