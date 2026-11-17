# 🚨 Security Review and Remediation Register

## Scope and warning

This is a source review of the repository, not a penetration test. The current branch should not be exposed for real customers until the critical items are fixed and tested.

## 🔴 SEC-01: Public signup accepts a role field

**Evidence:** `routes/web.php` exposes POST `/user/create`; `UserController::userStore` validates and persists the submitted `role` value.

A public visitor may submit an elevated role such as `admin` unless the server restricts it. Do not trust the client to assign privilege.

**Remediation:** remove role from public request input and set the role server-side to the least-privileged customer role. Add a test that attempts privilege escalation.

## 🔴 SEC-02: CSRF validation disabled globally

**Evidence:** `bootstrap/app.php` calls `$middleware->validateCsrfTokens(except: ['*'])`.

This excludes all URIs from CSRF validation, including state-changing web routes.

**Remediation:** remove the global exemption, use Laravel's web CSRF middleware, and ensure the custom availability fetch/other requests send valid tokens where required. Add feature tests for missing/valid tokens.

## 🔴 SEC-03: Dashboard shares all users with regular users

**Evidence:** `DashbaordController::dashboard` loads `User::all()` and `Car::all()`. `/dashboard` is in the `RoleMiddleware:user,admin` route group.

Regular users can reach a controller that sends the full user collection as Inertia props.

**Remediation:** restrict user-management data to admin-only routes and load only the current user's allowed data for a customer dashboard. Test the serialized Inertia props for both roles.

## 🔴 SEC-04: Rental cancellation lacks ownership validation

**Evidence:** `RentalController::cancelRental` loads a rental by arbitrary ID and marks it Cancelled. It does not check `user_id` against the authenticated user.

**Remediation:** authorize with a RentalPolicy or explicit owner/admin rule before mutating. Add a cross-user cancellation test.

## 🔴 SEC-05: Booking trusts client-supplied total_cost

**Evidence:** `RentalController::bookCar` saves `$request->total_cost` after calling the availability check. The availability response's calculated total is not used for persistence.

A client can tamper with the price shown in the browser.

**Remediation:** calculate the total from a server-loaded car, validated dates, pricing policy, and currency rules at booking time. Ignore client-supplied totals. Persist under a transaction with conflict protection.

## 🟠 SEC-06: Booking availability and insertion are not atomic

The availability query and insert are separate. Concurrent requests can both see an available date range and create conflicting rentals.

**Remediation:** implement a transaction and appropriate row/resource locking or a database-enforced booking strategy, and add a concurrency test.

## 🟠 SEC-07: GET routes mutate state

Logout and car deletion are mapped to GET routes. Mutations should use POST/PUT/PATCH/DELETE with CSRF protection.

## 🟠 SEC-08: Sensitive database snapshots tracked

Repository root contains a SQLite database file and a MariaDB SQL export with inserted records. Review for personal/session data, sanitize or remove if inappropriate, and remember Git history may retain older copies. Rotate sessions/credentials if exposed.

## 🟠 SEC-09: Scheduler name mismatch

`routes/console.php` schedules `rental:check-status`, but `UpdateRentalStatus` declares `rental:update-status`. The scheduled operation will not invoke the command under its current name.

## Additional correctness concerns

- Car deletion cascades to rentals through database foreign keys.
- The overlap query does not exclude cancelled rentals.
- `showRental` and `edit` controller methods are stubs.
- Contact view submits POST `/contact`, but only GET `/contact` is registered.
- Booking email is sent synchronously; failure semantics should be reviewed.
- Vue pages include hard-coded local storage URLs.
- Seeder contains a hard-coded admin account; keep it local only and rotate before any shared use.

## Remediation order

1. Fix role escalation and CSRF protection.
2. Restrict dashboard data and enforce record ownership.
3. Recalculate price server-side and make availability/booking atomic.
4. Replace GET mutations with safe methods.
5. Sanitize tracked database snapshots and handle Git history exposure.
6. Fix scheduler signature and add workflow tests.
7. Complete stubs, contact handler, mail and asset URL behavior.

Close findings only after implementation and tests. A documentation change does not fix the application vulnerability.
