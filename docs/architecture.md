# Architecture

## System overview

SwiftRide is a Laravel 12 web application using Inertia.js and Vue 3. Laravel handles HTTP routes, authentication, validation, database operations, mail, and scheduled commands. Inertia returns Vue pages through a Blade root view; the frontend is not a separate SPA server or REST API.

Request and render flow:

Browser → Laravel web route → middleware → controller → Eloquent model/database → Inertia page props → Vue page under resources/js/Pages.

Vite builds resources/js/app.js and resources/css/app.css. resources/js/app.js registers Vue, Inertia, Bootstrap, and toast notifications, then resolves page components with an eager glob.

## Application areas

| Layer | Location | Responsibility |
| --- | --- | --- |
| Web routes | routes/web.php | Public, authenticated, and role-protected page and action routes |
| Controllers | app/Http/Controllers | Page rendering, account, car, and rental operations |
| Authorization | app/Http/Middleware/RoleMiddleware.php | Checks the authenticated user's role against route middleware arguments |
| Inertia sharing | app/Http/Middleware/HandleInertiaRequests.php | Shares flash fields and the authenticated user with Vue |
| Models | app/Models | User, Car, Rental relations, casts, and mass-assignable fields |
| Vue pages | resources/js/Pages | Login/signup, home, dashboard, cars, rentals, and contact screens |
| Shared Vue components | resources/js/Pages/Components | Layout, navigation, sidebar, and car details |
| Database | database/migrations and database/seeders | Relational schema, framework tables, and local seed data |
| Mail | app/Mail and resources/views/emails | Booking confirmation and cancellation message templates |
| Scheduling | routes/console.php and app/Console/Commands | Rental-status automation |

## Route groups

- Public routes render home, about, contact, login, and signup pages.
- Admin routes protect user administration and car CRUD using auth plus RoleMiddleware:admin.
- The dashboard, rental list, booking, cancellation, and status routes use auth plus RoleMiddleware:user,admin.
- The dashboard controller sends all user and car records to the page. The role group includes regular users, so the interface exposes user records outside the admin role.
- The contact page submits POST /contact, while routes/web.php only defines GET /contact.

The exact routes and observed access rules are in api.md.

## Data model

- User has many Rental records and stores name, unique email, password hash, and a free-form role string.
- Car has many Rental records and stores descriptive fields, image path, price, and availability.
- Rental belongs to a User and a Car, with start/end dates, total cost, and status.
- Rental foreign keys cascade when a user or car is deleted.

See database.md for columns, snapshot files, and migration caveats.

## Background work and email

routes/console.php schedules rental:check-status daily. The command class currently declares the signature rental:update-status, so the scheduled name does not match the registered command. The rental list Vue page also calls an updateRentalStatus function that is commented out.

Booking sends CarBookingConfirmation synchronously using the configured Laravel mailer. The environment template defaults to the log mailer, so local email is written to logs rather than delivered. Cancellation mail scaffolding exists but is not called by the cancellation action.

## Security boundary

RoleMiddleware is useful only when route data and controller actions enforce the same authorization. Several current actions need further ownership, role, CSRF, and input-validation review. The app currently disables CSRF validation globally in bootstrap/app.php. Review SECURITY.md before deployment.
