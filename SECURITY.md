# Security Policy

## Supported version

Security reports are considered for the current main branch. This repository contains a Laravel web application with account, role, car, rental, upload, email, and database functionality. The current code has security issues that must be addressed before public deployment or use with real customer data.

## Report privately

Do not post exploit steps, user records, tokens, or credentials in a public issue. Use GitHub private vulnerability reporting for this repository if enabled:

https://github.com/Brajesh31/car-rental-vue-laravel-app/security/advisories/new

If private reporting is unavailable, contact Brajesh Kumar (@brajesh31) through https://github.com/brajesh31. Include affected routes or commits, impact, and a safe reproduction. Remove personal information from logs and examples.

## High-priority issues identified in the current code

- bootstrap/app.php excludes every URI from CSRF validation. This removes request-forgery protection from web forms and actions.
- Public signup accepts the role value supplied by the request, and the form explicitly allows an admin role. An unauthenticated visitor can request an administrative account.
- The dashboard route allows both user and admin roles, while its controller loads all users and the dashboard renders their names, email addresses, and roles.
- Rental cancellation is available to user and admin roles, but cancelRental changes a rental by ID without checking that the signed-in user owns it.
- Car deletion is routed as GET, making a state-changing action reachable through a navigation request.
- Booking creation stores total_cost supplied by the browser instead of recomputing the total on the server. Availability checks are separate from booking creation and do not use a transaction or lock.
- The repository tracks a SQLite database file and a SQL dump with user, session, car, and rental records. Treat those records as potentially sensitive. Do not distribute or deploy them without review and sanitization. If they contain real data, revoke sessions, rotate affected credentials, remove the data from active releases, and assess Git history exposure.
- DatabaseSeeder contains a hard-coded administrative demo account. Do not run this seed in any shared or production environment without replacing the credential and role behavior.
- Some controllers return caught exception messages to the requester, which can expose internal details.

## Other security considerations

- Login has no visible rate limiting or email verification flow in the project routes.
- User/session data and uploaded images require suitable access, retention, and backup controls.
- The .env.example file is a local development template. Set APP_DEBUG=false and provide unique secrets and protected database/mail credentials in production.
- Rental and car authorization must be enforced in controllers or policies, not only through UI state.
- Check uploaded image validation, storage visibility, and generated URLs before exposing uploads.

## Response and remediation

The maintainer will acknowledge and assess reports as reasonably soon as possible, coordinate a fix and disclosure where practical, and credit reporters if requested. No fixed response or patch deadline is promised. Rotate credentials and revoke active sessions whenever exposed data may be real.
