# 🚗 Project Overview: SwiftRide Car Rental

## 1. What this repository contains

A Laravel 12 web application with an Inertia 2 and Vue 3 interface. Laravel handles routing, sessions, authentication, validation, Eloquent persistence, file storage, mail, and console scheduling. Vue pages render through Inertia. Vite builds the frontend assets.

This is a server-rendered Laravel application with an Inertia-driven Vue frontend, not a separate Vue API client and independently hosted REST backend.

## 2. Current functional areas

| Area | Source evidence | Current scope |
|---|---|---|
| Public pages | HomeController, HomePage.vue, AboutPage.vue, Contact.vue | Home, about, and contact page rendering |
| Accounts | AuthController, UserController, User model | Login, public signup, admin user update/delete |
| Roles | RoleMiddleware, routes/web.php | `admin` and `user` route groups |
| Car catalogue | CarController, Car model, Cars Vue pages | List, create, view, edit, update, delete |
| Rental workflow | RentalController, Rental model, Rental Vue pages | Availability check, booking, listing, cancellation, status update |
| Mail | CarBookingConfirmation, CarBookingCancellation | Confirmation mail implementation; cancellation mail class exists |
| Status automation | UpdateRentalStatus command, routes/console.php | Intended daily status updates, but command name does not currently match schedule |
| Frontend | Vue 3, Inertia, Bootstrap, Vite | Page components and shared layout/navigation |

## 3. Current roles

**Admin:** middleware-protected user management and car catalogue maintenance. The dashboard currently sends all users and all cars to both admins and regular users because its route group permits both roles.

**User:** authenticated rental pages, booking, rental listing, and cancellation route. The cancellation handler currently does not verify that the selected rental belongs to the signed-in user.

## 4. What is not established by the code

- No payment gateway, payment authorization, settlement, or refund integration was found.
- No live GPS, location tracking, map routing, or geocoding integration was found.
- No separate REST API versioning layer was found. Routes are Laravel web routes with Inertia responses plus one JSON availability endpoint.
- No production mail provider or queue worker deployment is configured in source.
- No production cloud host, CI release deployment, uptime monitoring, or backup system is defined.
- No comprehensive booking, role, CSRF, concurrency, or scheduler test coverage exists.

## 5. Business workflow in the current version

1. A visitor registers or logs in.
2. An authenticated user browses cars.
3. The user selects a car and date range.
4. The page requests availability and a displayed total.
5. The booking controller checks availability again and creates a rental.
6. A confirmation email is sent synchronously using configured mail.
7. The rental list displays the user's rentals, or all rentals for an admin.
8. A user can request cancellation; an admin can update a status.
9. A scheduled command is intended to cancel overdue pending bookings and complete expired confirmed rentals, but its currently configured schedule name differs from its declared command signature.

## 6. Production-readiness blockers

- Signup must assign roles server-side rather than accept `role` from the public request.
- Restore Laravel CSRF protection. `bootstrap/app.php` currently exempts all URIs.
- Restrict dashboard data to authorized administrators.
- Enforce rental ownership for view, edit, cancellation, and all state-changing actions.
- Compute the booking amount on the server and protect against simultaneous overlapping bookings.
- Use safe HTTP methods for mutations. Current logout and car deletion routes use GET.
- Align scheduler command registration and invocation.
- Add meaningful feature tests and review the tracked database snapshots for sensitive records.

See [Security review](SECURITY_REVIEW.md), [Database](database.md), and [Roadmap](../ROADMAP.md).
