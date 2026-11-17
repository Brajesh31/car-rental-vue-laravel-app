# 🧪 Testing Strategy

## Current baseline

The checked-in tests are Laravel/PHPUnit example tests. They do not comprehensively cover authentication, roles, dashboard data exposure, car CRUD, overlapping rentals, server-side booking price, rental ownership, email delivery, or scheduled status updates.

## Run current test suite

~~~bash
composer test
~~~

Equivalent command:

~~~bash
php artisan test
~~~

Frontend production build:

~~~bash
npm ci
npm run build
~~~

Formatting check (Laravel Pint):

~~~bash
./vendor/bin/pint --test
~~~

These commands are instructions. Do not report success until they have been run.

## Critical feature test matrix

| ID | Scenario | Expected result |
|---|---|---|
| AUTH-01 | Guest opens protected dashboard | Redirect to login / unauthenticated response |
| AUTH-02 | Public signup submits role=admin | Server assigns only allowed customer role or rejects input |
| AUTH-03 | User requests admin car management | 403 Forbidden |
| AUTH-04 | User attempts admin dashboard data access | No user directory or private admin data returned |
| CSRF-01 | State-changing request has no valid CSRF token | Rejected by Laravel web middleware |
| CAR-01 | Admin creates a car with valid image | Car persisted and image stored on configured disk |
| CAR-02 | Invalid image or negative price | Validation error, no record created |
| RENT-01 | Valid date range with no conflict | Availability response includes server-calculated cost |
| RENT-02 | Overlapping active rental exists | Availability false and booking rejected |
| RENT-03 | Only cancelled rental overlaps | Availability follows explicit cancellation policy |
| RENT-04 | Client tampers with total_cost | Server ignores client amount and recalculates |
| RENT-05 | Two requests book same car/dates simultaneously | At most one conflicting booking is committed |
| RENT-06 | User views another user's rental | 403/404, no data disclosure |
| RENT-07 | User cancels another user's rental | 403/404, no state change |
| RENT-08 | Admin updates rental status | Only allowed status values/transitions accepted |
| MAIL-01 | Booking confirmation generated | Correct recipient/template, safe failure behavior |
| CONTACT-01 | Contact form submits | Implemented endpoint validates and processes or UI does not claim submission |
| SCHED-01 | Scheduled rental status command runs | Actual registered command name is invoked |

## Suggested test layers

- **Unit:** date overlap rules, pricing, rental status transitions.
- **Feature:** authenticated route behavior and validation.
- **Authorization:** admin vs user and owner vs non-owner cases.
- **Database:** relationships, cascade behavior, status fields, transaction/locking.
- **Mail:** assert mail sent with Mail::fake().
- **Scheduler:** test the command directly and assert it is registered under the scheduled name.
- **Frontend:** verify Inertia forms, field errors, loading states, and broken helper references.

## Safe test data

Use database factories and a disposable SQLite test database as configured in `phpunit.xml`. Never copy live user/session/rental rows into tests. Keep images, mail bodies, and logs free of real personal information.

## Evidence reporting

Record commit SHA, PHP version, Composer version, Node version, database driver, commands, pass/fail totals, and known gaps. Do not invent coverage percentages, accessibility scores, or CI success claims.
