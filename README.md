# 🚗 SwiftRide | Car Rental Management Application

<p align="center">
  <img src="https://img.shields.io/badge/Laravel-12-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel 12">
  <img src="https://img.shields.io/badge/PHP-8.2%2B-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP 8.2+">
  <img src="https://img.shields.io/badge/Vue.js-3-4FC08D?style=for-the-badge&logo=vuedotjs&logoColor=white" alt="Vue 3">
  <img src="https://img.shields.io/badge/Inertia.js-2-9553E9?style=for-the-badge" alt="Inertia 2">
  <img src="https://img.shields.io/badge/Vite-6-646CFF?style=for-the-badge&logo=vite&logoColor=white" alt="Vite 6">
  <img src="https://img.shields.io/badge/License-MIT-2E8B57?style=for-the-badge" alt="MIT License">
</p>

<p align="center"><strong>A Laravel 12 + Inertia + Vue 3 web application prototype for car listings, role-based administration, and rental booking workflows.</strong></p>

---

## 📌 Project overview

SwiftRide is a full-stack Laravel application with an Inertia.js and Vue 3 interface. Laravel owns web routing, authentication, authorization middleware, validation, Eloquent models, file storage, mail, and scheduled commands. Inertia delivers Vue pages through a Laravel Blade root view; Vite builds the browser assets.

This is not a separately deployed Vue SPA backed by a versioned JSON API. Most routes are Laravel web routes and return redirects or Inertia pages. The availability checker is a JSON response.

> 🚨 **Production warning:** The inspected code contains serious security and booking-integrity issues. Public signup accepts a role from the request, CSRF checks are globally disabled, the dashboard sends all user records to both users and admins, rental cancellation does not check ownership, booking stores a browser-supplied total, availability and booking are not atomic, and the scheduler name does not match the registered command signature. Do not use real customer records or deploy publicly until these findings are fixed and tested.

Read [Security Policy](SECURITY.md) and [Security Review](docs/SECURITY_REVIEW.md) before using this project outside an isolated development environment.

## 🎯 Current feature inventory

| Area | Current source behavior | Important limitation |
|---|---|---|
| 🏠 Public pages | Home, about, contact page rendering | Contact form POST route is missing |
| 👤 Accounts | Signup, login, admin user management | Signup role is client-controlled |
| 🛡️ Roles | `admin` and `user` middleware groups | Dashboard data is not scoped by role |
| 🚘 Car catalogue | Admin list/create/show/edit/update/delete routes | Delete currently uses GET |
| 📅 Rental workflow | Availability check, booking, listing, cancel, status update | Price tampering and concurrency risks |
| ✉️ Email | Booking confirmation mail class and template | Sent synchronously with configured mailer |
| ⏱️ Automation | Command intended to update rental states | Scheduler/command signature mismatch |
| 🧩 Frontend | Vue 3 + Inertia pages and shared components | Some frontend/backend helpers are incomplete |

### ⚠️ Confirmed implementation gaps
- Public signup persists a caller-provided role field. Role assignment must be server-controlled.
- `bootstrap/app.php` excludes all URI paths from CSRF validation.
- Dashboard controller retrieves all users and passes them to a route group accessible to regular users.
- Rental cancellation changes a rental by ID without checking that the authenticated user owns it.
- Booking writes `total_cost` from the browser rather than the server-calculated availability result.
- Availability lookup and booking insert are separate operations, which permits race conditions.
- Cancelled rentals are not filtered from the current date-overlap query.
- Logout and car deletion are GET routes despite changing state.
- The contact page submits POST `/contact`, while `routes/web.php` only defines GET `/contact`.
- Rental show/edit controller actions are stubs.
- `routes/console.php` schedules `rental:check-status`, but the command declares `rental:update-status`.
- RentalList references an `updateRentalStatus` function whose implementation is commented out.
- Some Vue asset URLs contain `127.0.0.1:8000`, which is not portable to deployment.
- Existing tests are framework examples, not a booking or authorization test suite.

These findings describe the current inspected source. This documentation update does not fix them.

## 🧰 Technology stack

| Technology | Purpose |
|---|---|
| PHP 8.2+ | Backend runtime |
| Laravel 12 | Routing, authentication, validation, persistence and application framework |
| Inertia Laravel 2 | Laravel-to-Vue page bridge |
| Vue 3 | Frontend pages and components |
| Vite 6 | Frontend development/build tooling |
| Eloquent ORM | Database models and relations |
| SQLite (default local template) | Local database configuration |
| MySQL/MariaDB compatibility | Alternative relational database configuration |
| Bootstrap 5 | UI framework dependency |
| Tailwind CSS Vite plugin | Styling/build dependency |
| Axios | HTTP client dependency |
| Day.js | Date utilities dependency |
| PHPUnit 11 | Automated test framework |
| Composer | PHP dependency management and scripts |
| npm | JavaScript dependency management |

Exact dependency requirements are declared in [composer.json](composer.json) and [package.json](package.json).

## 🏛️ Architecture

~~~mermaid
flowchart TD
 A[Browser] --> B[Laravel Web Route]
 B --> C[Web Middleware: Session / CSRF / Inertia]
 C --> D[Controller]
 D --> E[Eloquent Model]
 E --> F[(Configured SQL Database)]
 F --> E
 D --> G[Inertia Response + Page Props]
 G --> H[Vue 3 Page Component]
 H --> A
 D --> I[Mail / Filesystem / Console Services]
~~~

### Application data flow

~~~mermaid
flowchart LR
 Visitor[Visitor] --> Auth[Signup / Login]
 Auth --> Session[Laravel Session]
 Session --> Browse[Browse Cars]
 Browse --> Availability[Check Dates]
 Availability --> Booking[Create Rental]
 Booking --> RentalDB[(Rentals Table)]
 Booking --> Mail[Booking Confirmation]
 Admin[Administrator] --> Manage[Manage Cars / Users / Rental Status]
 Manage --> DB[(Application Database)]
~~~

See [Architecture](docs/architecture.md) and [Diagrams](docs/diagrams/README.md) for detailed boundaries and known mismatches.

## 🗂️ Repository structure

~~~text
car-rental-vue-laravel-app/
├── .github/                         # CI, issue forms and PR template
├── app/
│   ├── Console/Commands/            # Rental status command
│   ├── Http/Controllers/            # Auth, car, rental, user and page actions
│   ├── Http/Middleware/             # Role checks and Inertia shared props
│   ├── Mail/                        # Booking email classes
│   ├── Models/                      # User, Car, Rental
│   └── Notifications/               # Rental status notification
├── bootstrap/                       # Laravel app/middleware configuration
├── config/                          # Framework configuration
├── database/
│   ├── factories/
│   ├── migrations/
│   └── seeders/
├── docs/                            # Project, API, architecture, security and operations
├── public/                          # Web root and public assets
├── resources/
│   ├── css/
│   ├── js/Pages/                    # Inertia Vue pages
│   └── views/                       # Blade root and email templates
├── routes/                          # Web and console routes
├── storage/                         # Logs, sessions, cache and runtime files
├── tests/                           # PHPUnit feature and unit tests
├── composer.json
├── package.json
├── phpunit.xml
├── vite.config.js
└── ...
~~~

See [Project Structure](docs/PROJECT_STRUCTURE.md) for file responsibilities.

## ⚙️ Prerequisites
- PHP 8.2 or later with required Laravel/PDO extensions.
- Composer.
- Node.js and npm.
- SQLite with PDO SQLite for the default local configuration, or a supported MySQL/MariaDB server.
- Git and a terminal.

## 🚀 Local installation

### 1. Clone the repository

~~~bash
git clone https://github.com/Brajesh31/car-rental-vue-laravel-app.git
cd car-rental-vue-laravel-app
~~~

### 2. Configure Laravel

~~~bash
cp .env.example .env
composer install
php artisan key:generate
~~~

Windows PowerShell alternative: `Copy-Item .env.example .env`.

### 3. Prepare the default SQLite database

The local template selects SQLite at `database/database.sqlite`. Create the file if it does not exist:

~~~bash
touch database/database.sqlite
~~~

Do not confuse this file with the tracked root-level `my_car_rental` SQLite snapshot or the `my_car_rental.sql` MariaDB export. Those contain stored records and should not be imported into a fresh or shared environment without reviewing and sanitizing them.

### 4. Apply migrations

~~~bash
php artisan migrate
~~~

Do not run the current seeder outside a disposable local database until its hard-coded administrator account and role behavior are corrected.

### 5. Install frontend dependencies

~~~bash
npm ci
~~~

### 6. Start development services

~~~bash
composer run dev
~~~

The Composer `dev` script starts the Laravel development server, queue listener, Pail log viewer, and Vite. Open the URL printed by Laravel in the terminal.

### 7. Uploaded image storage

~~~bash
php artisan storage:link
~~~

Car images use Laravel's public storage disk. Confirm write permissions and public URLs in local testing.

## 🧪 Available commands

| Command | Purpose |
|---|---|
| `composer install` | Install PHP dependencies |
| `npm ci` | Install locked frontend dependencies |
| `composer run dev` | Start Laravel, queue listener, logs and Vite |
| `php artisan route:list` | Inspect registered web routes |
| `php artisan migrate:status` | Inspect migration state |
| `php artisan migrate` | Apply local migrations |
| `composer test` | Run Laravel test suite |
| `php artisan test` | Run PHPUnit via Artisan |
| `npm run build` | Build frontend assets |
| `npm run dev` | Start Vite dev server |
| `./vendor/bin/pint --test` | Check PHP formatting |

These commands are documented, not claimed as executed. The checked-in tests do not yet validate booking correctness, role escalation, CSRF, ownership, mail, or scheduled automation.

## 🔐 Roles and sessions

The app uses Laravel session authentication rather than JWT bearer tokens. The custom `RoleMiddleware` checks the authenticated user's `role` string. The routes use `admin` for user/car management and `user,admin` for dashboard/rental routes.

Frontend visibility is not authorization. Every backend read/write must enforce role and record ownership, and all state-changing web requests must use CSRF protection.

## 📅 Rental workflow

~~~mermaid
flowchart TD
 A[User selects car] --> B[Choose start/end dates]
 B --> C[POST availability check]
 C --> D{Conflicting rental?}
 D -->|Yes| E[Show unavailable]
 D -->|No| F[Show calculated estimate]
 F --> G[Submit booking]
 G --> H[Re-check availability]
 H --> I[Create rental]
 I --> J[Send confirmation email]
 J --> K[Rental list]
~~~

The current flow has two critical defects: the final booking persists the client-supplied `total_cost`, and the availability query and insert are not atomic. Fix and test those before using this workflow with real reservations.

## 📚 Documentation

The [documentation hub](docs/README.md) contains project overview, feature inventory, architecture diagrams, route/API reference, OpenAPI draft, database data dictionary, security review, testing strategy, deployment, operations, templates, runbooks, and decision records.

## 🛡️ Security and privacy

Before deployment, address the findings in [Security Review](docs/SECURITY_REVIEW.md), especially server-side role assignment, CSRF protection, dashboard data exposure, rental ownership, price tampering, and booking concurrency. Populated local database files and SQL exports have been removed from the repository because they are not suitable public fixtures. Do not reintroduce live data, `.env` files, session cookies, passwords, private customer records, or booking addresses. Review the seeder's hard-coded administrator account before any production use.

See [SECURITY.md](SECURITY.md) for private reporting instructions.

## 🗺️ Roadmap

Priority order: fix role escalation and CSRF; restrict dashboard data; enforce rental ownership; calculate price server-side; make date reservations concurrency-safe; fix GET mutations; repair scheduler naming; complete missing contact/rental actions; add feature tests; remove local-only asset URLs; improve operations and monitoring.

See [ROADMAP.md](ROADMAP.md) for the detailed project roadmap.

## 🤝 Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md), follow [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md), and use the issue and pull request templates. Report vulnerabilities privately.

## 📄 License

This project is licensed under the MIT License. See [LICENSE](LICENSE). Third-party dependencies and media retain their respective licenses/terms.

## 👤 Maintainer

Maintained by **Brajesh Kumar**.

<p align="center">Built with Laravel, Vue, and Inertia. 🚗</p>

Last updated: 2026-11-17 09:50 UTC
