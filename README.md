# SwiftRide Car Rental

A Laravel 12 car-rental web application with a Vue 3 and Inertia.js interface. The project includes account registration and login, car administration, rental date availability checks, booking records, role-based route groups, and email confirmation scaffolding.

This repository needs security and data cleanup before any public or production deployment. The current code disables CSRF validation for every route, accepts a role supplied by public signup, exposes user records to every authenticated dashboard user, and allows a signed-in user to cancel a rental without checking ownership. It also tracks a SQLite database and a SQL dump containing user/session records. Review SECURITY.md before running or deploying the application.

## Stack

- PHP 8.2 or later and Laravel 12
- MySQL or SQLite through Laravel's database layer
- Vue 3, Inertia.js 2, and Vite
- Bootstrap 5, Tailwind CSS 4 Vite integration, and Vue Toastification
- PHPUnit through Laravel's test runner
- Laravel mail, queue, session, and scheduled-command infrastructure

Exact dependency constraints are in composer.json and package.json; resolved dependencies are recorded in composer.lock and package-lock.json.

## Current application areas

- Public home, about, contact, login, and signup pages.
- Admin car listing, creation, editing, viewing, and deletion.
- User/admin dashboard and rental listing.
- Car rental date availability checks and booking creation.
- Rental status updates and cancellation.
- Booking confirmation email template and status automation scaffolding.

The feature set is incomplete. Contact submission has no POST route; rental detail and edit controller methods are stubs; the scheduled command name does not match the registered command; the car deletion action uses GET; and email delivery depends on the configured mailer. Read the technical docs for route-level details.

## Requirements

- PHP 8.2+, Composer, Node.js and npm
- A database supported by the configured Laravel connection
- PHP extensions required by Laravel and the selected database driver
- A mail transport for real email delivery

## Local setup

The checked-in environment template defaults to SQLite. In PowerShell, from the project root:

    Copy-Item .env.example .env
    php artisan key:generate
    New-Item -ItemType File -Force database/database.sqlite
    composer install
    npm ci
    php artisan migrate --seed
    composer run dev

The Composer development script starts the Laravel server, queue listener, log viewer, and Vite process. Open the local URL shown in the terminal.

The project seeder contains a hard-coded admin demo account. Use an isolated local database only; replace the seed credentials and role assignment before sharing the application or using a non-disposable environment. The tracked root-level database file and SQL export are separate artifacts; they are not the default SQLite path in .env.example.

See [Installation](docs/installation.md) for more detail and database alternatives.

## Useful commands

- composer run dev starts the configured local development processes.
- php artisan migrate applies schema migrations.
- php artisan test runs the PHPUnit suites.
- ./vendor/bin/pint formats PHP source.
- npm run dev starts Vite only.
- npm run build creates the frontend production assets.
- npm run preview is not defined in package.json.

The current tests are Laravel scaffold examples and do not cover the car, rental, role, or security flows.

## Main routes

| Method and path | Purpose | Access in current route file |
| --- | --- | --- |
| GET / | Home page | Public |
| GET /about | About page | Public |
| GET /contact | Contact form page | Public |
| GET and POST /login | Login page and authentication | Public |
| GET and POST /user/create | Signup page and account creation | Public; role is submitted by the client |
| GET /dashboard | Dashboard and user/car data | Authenticated user or admin |
| GET /listCars and car admin paths | Car administration | Admin |
| GET /rentals/create and /cars/{car}/book | Rental selection and booking form | Authenticated user or admin |
| POST /check-availability | Date availability and cost response | Authenticated user or admin |
| POST /cars/{car}/book | Create rental and send confirmation email | Authenticated user or admin |
| GET /listRentals | Current user's rentals or all rentals for admin | Authenticated user or admin |
| PUT /rentals/{id}/cancel | Cancel a rental | Authenticated user or admin; ownership is not checked |
| PUT /rentals/{id}/update-status | Update rental status | User/admin route group; controller also checks admin |
| GET /user/logout | Sign out | Authenticated user or admin; currently uses GET |

The complete route definitions are in routes/web.php. The application uses Laravel web sessions and Inertia page responses rather than a separate JSON API.

## Repository layout

    app/Http/Controllers/       Laravel page and action controllers
    app/Http/Middleware/        Inertia props and role middleware
    app/Models/                  User, Car, and Rental models
    app/Console/Commands/        Rental status command
    database/migrations/         Relational schema changes
    database/seeders/            Local seed data, including a demo admin
    resources/js/Pages/          Inertia Vue screens
    resources/views/             Blade root and mail templates
    routes/web.php               Web routes and access middleware
    routes/console.php           Scheduled command registration
    docs/                        Project guides and policies

## Security and data

Do not use real account or customer information until the documented CSRF, signup-role, rental-ownership, pricing, database-dump, and seed-account issues are addressed. Do not publish credentials or database rows in issues. Follow [SECURITY.md](SECURITY.md) for private reports.

## Contributing and license

Read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting changes. This project is distributed under the MIT License; see [LICENSE](LICENSE). Third-party packages and assets remain subject to their own terms.

Last updated: 2026-10-13 16:00 UTC
