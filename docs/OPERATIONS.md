# 🧭 Operations Guide

## Runtime components

The application requires PHP/Laravel, a supported SQL database, Node/Vite for frontend assets, filesystem storage, mail transport, and (depending on configuration) a queue worker and scheduler. The local Composer `dev` script starts Laravel server, queue listener, Pail log viewer, and Vite concurrently.

## Routine operation

| Frequency | Activity | Evidence |
|---|---|---|
| Every code change | Run PHP tests and frontend build | CI output/commit |
| Every release | Test login, role access, booking and cancellation | Release checklist |
| Daily in production | Check scheduler and queue health | Worker/scheduler logs |
| Regularly | Review dependencies and security advisories | Dependency report |
| Regularly | Back up database and uploaded car images | Restore evidence |
| On config change | Verify APP_KEY, DB, mail and storage settings | Change record |

## Background processes

- Laravel scheduler must be invoked by the host at least once per minute using `php artisan schedule:run`.
- Queue workers must be supervised if queued mail/jobs are introduced or configured.
- Current booking confirmation is sent synchronously.
- Current schedule command name does not match the declared Artisan command. Correct before relying on automatic status changes.

## Incident response

1. Identify impact and affected accounts/bookings.
2. Restrict or disable affected write paths.
3. Preserve logs in restricted storage and redact personal data.
4. Revoke exposed sessions or rotate credentials where needed.
5. Restore a known-good release and database state.
6. Confirm booking integrity, mail and scheduled status behavior.
7. Record timeline, impact, root cause and follow-up actions.

## Data protection

Treat user details, session rows, rental dates, uploaded images, and contact information as private. Keep database snapshots out of public source control unless deliberately sanitized and approved. Do not claim active monitoring, backups, or recovery capability until those systems are configured and tested.
