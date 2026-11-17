# 🔐 Security and Authorization Guide

## Trust boundaries

Browser input is untrusted. Vue UI visibility, route names, hidden form fields, and client-side calculations are not access controls. Every write and private read must be validated and authorized by Laravel.

## Authentication and role checks

The application uses Laravel session authentication. Route groups apply `auth` and a custom `RoleMiddleware` that checks the authenticated user's `role` string.

Current roles referenced by the routes are `admin` and `user`. Public registration accepts a role field from the request; this must be removed and assigned server-side before public use.

## CSRF

The application currently disables CSRF validation for all URIs in `bootstrap/app.php`. Restore Laravel's standard protection. All state-changing web requests must carry a valid CSRF token; use POST/PUT/PATCH/DELETE semantics, not GET.

## Object-level authorization

Every route accepting a user/car/rental ID must verify that the authenticated actor is allowed to act on that exact record. A route group that permits `user,admin` does not automatically restrict an individual rental to its owner.

Current cancellation handler does not check rental ownership. The dashboard sends all user records to the shared dashboard page although the route group allows ordinary users.

## Booking integrity

Do not trust a client-supplied total cost. Recalculate from the stored car price and validated date interval on the server. Protect availability lookup and booking creation against concurrent conflicting writes. Define whether Cancelled bookings are excluded from availability checks.

## Secrets and data
- Never commit populated `.env` files, APP_KEY values, mail credentials, sessions, or tokens.
- Review tracked `my_car_rental` and `my_car_rental.sql` files for sensitive records.
- Restrict access to uploaded images and account/rental details.
- Avoid logging full request payloads, passwords, session IDs, or private contact data.
- Use APP_DEBUG=false in production and protect logs.

## File uploads

Validate file content/type/size, generate safe storage names, store on configured disks, and serve through controlled URLs. Never accept a client-controlled filesystem path.

## Production security gate

Do not deploy before SEC-01 through SEC-05 in [Security Review](SECURITY_REVIEW.md) are fixed and covered by automated tests. This guide is not a certification or penetration-test report.
