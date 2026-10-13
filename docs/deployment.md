# Deployment

## Readiness

Do not deploy the current branch for real customers or accounts until the high-priority findings in SECURITY.md are resolved. In particular, CSRF validation is disabled globally, public registration accepts an admin role, user records are sent to regular-user dashboards, rental cancellation lacks ownership validation, and booking totals are supplied by the client. The tracked database snapshots also require review and sanitization.

## Build and configure

Prepare a production environment with supported PHP extensions, Composer, Node/npm for asset compilation, and a managed database. Store environment values in the hosting platform's secret manager, not in the repository. Use a unique APP_KEY, APP_ENV=production, APP_DEBUG=false, a protected database, secure session/cookie settings, and an explicitly configured mail transport.

Typical deployment steps after the application has been secured:

    composer install --no-dev --optimize-autoloader
    npm ci
    npm run build
    php artisan migrate --force
    php artisan storage:link
    php artisan config:cache
    php artisan route:cache
    php artisan view:cache

Use reviewed migrations against a clean production database. Do not import my_car_rental or my_car_rental.sql as production data. Do not run the current demo seeder in production.

## Web server and writable paths

Point the web server document root at public, not the repository root. Configure HTTPS, request size limits, and access logging. Ensure storage and bootstrap/cache are writable by the application process while keeping source, environment files, and database exports outside the public document root.

Car images use Laravel's public disk. Configure the public storage link and backup/retention policy for uploaded files. Replace hard-coded 127.0.0.1:8000/storage URLs in Vue pages with environment-independent generated paths before deployment.

## Queues, mail, and scheduler

Booking confirmation mail is sent synchronously and depends on mail configuration. Verify delivery and failure handling before accepting bookings. If queues are introduced or required, run a supervised queue worker and document retries and monitoring.

Laravel's scheduler requires a system cron that invokes php artisan schedule:run every minute. The route schedule currently names rental:check-status, while the command class declares rental:update-status. Correct and verify that mismatch before expecting automatic rental state transitions. The Vue rental list also references a missing updateRentalStatus helper.

## Data protection and release review

- Enforce role and record ownership on the server.
- Restore CSRF validation and use state-changing HTTP methods for mutations.
- Recalculate booking prices on the server and guard overlapping reservations transactionally.
- Remove real data from public artifacts and assess Git history exposure.
- Use backups, retention rules, and restore drills for database and uploaded images.
- Review error pages and logs so they do not reveal stack traces, credentials, or personal data.
- Verify the contact form route, email behavior, booking confirmation, cancellation, and status transitions end to end.

## Rollback

Keep a known-good release artifact and database backup. Plan schema changes so application and database rollback are compatible. If account or session material was exposed, revoke sessions and rotate affected credentials; restoring an old code release does not remove data already present in Git history.
