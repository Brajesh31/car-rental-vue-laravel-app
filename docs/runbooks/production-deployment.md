# 🚀 Production Deployment Runbook

This is a checklist, not a provider-specific deployment script. Resolve the security blockers before proceeding.

1. Provision supported PHP runtime, Composer, Node build environment, managed database, persistent uploads, mail transport, and secret storage.
2. Configure production environment values outside the repository. Set APP_ENV=production and APP_DEBUG=false.
3. Point the web server document root at `public/` only.
4. Configure HTTPS, secure cookies, upload limits, and least-privilege database access.
5. Install production dependencies and build assets.
6. Apply reviewed migrations only after backup and schema review.
7. Configure public storage URL/link and remove hard-coded localhost media URLs.
8. Configure scheduler and supervised workers only after command names and job behavior are tested.
9. Smoke test role restrictions, CSRF, booking totals, concurrency conflicts, mail, and rental ownership.
10. Verify logs and backups, then record exact release commit and rollback plan.
