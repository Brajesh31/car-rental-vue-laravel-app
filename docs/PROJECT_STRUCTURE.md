# 🗂️ Repository Structure

~~~text
car-rental-vue-laravel-app/
├── .github/                         # CI, issue forms, PR template
├── app/
│   ├── Console/Commands/            # Rental status command
│   ├── Http/Controllers/            # Auth, cars, rentals, users, pages
│   ├── Http/Middleware/             # Inertia sharing and role checks
│   ├── Mail/                        # Booking mail classes
│   ├── Models/                      # User, Car, Rental
│   └── Notifications/               # Rental status notification
├── bootstrap/                       # Laravel app and middleware setup
├── config/                          # Laravel service configuration
├── database/
│   ├── factories/
│   ├── migrations/
│   └── seeders/
├── docs/
│   ├── api/                         # OpenAPI and API examples
│   ├── assets/                      # Documentation media
│   ├── database/                    # Data dictionary
│   ├── decisions/                   # ADRs
│   ├── diagrams/                    # Mermaid diagrams
│   ├── runbooks/                    # Operational procedures
│   └── templates/                   # Reusable review templates
├── public/                          # Web root and public images
├── resources/
│   ├── css/
│   ├── js/Pages/                    # Inertia Vue pages
│   └── views/                       # Blade root and email templates
├── routes/                          # Web and console routes
├── storage/                         # Logs, sessions, cache, files
├── tests/                           # PHPUnit feature/unit tests
├── composer.json
├── package.json
├── phpunit.xml
├── vite.config.js
└── ...
~~~

## Directory responsibilities

| Location | Responsibility |
|---|---|
| `app/Http/Controllers` | Request validation, route handling, Inertia responses |
| `app/Http/Middleware` | Role checks and shared page props |
| `app/Models` | Eloquent fields, casts, relationships |
| `app/Mail` | Email message classes |
| `app/Console/Commands` | Console task implementations |
| `database/migrations` | Versioned schema changes |
| `database/seeders` | Development seed data |
| `resources/js/Pages` | Vue pages resolved by Inertia |
| `resources/js/Pages/Components` | Shared layout and navigation components |
| `resources/views` | Blade root page and email templates |
| `routes/web.php` | Public/authenticated/role-protected web routes |
| `routes/console.php` | Scheduled Artisan commands |
| `public` | Public web document root and static assets |
| `storage` | Logs, cache, sessions, runtime files |
| `tests` | PHPUnit feature and unit tests |
| `docs` | Project and operational documentation |

## Request and page flow

~~~mermaid
flowchart TD
 A[Browser] --> B[Laravel web route]
 B --> C[Web middleware: session, CSRF, Inertia]
 C --> D[Controller]
 D --> E[Eloquent model]
 E --> F[(Database)]
 F --> E
 D --> G[Inertia response + page props]
 G --> H[Vue page component]
 H --> A
~~~

## Maintenance rules

- Keep business rules in controllers/services or dedicated actions, not in Vue alone.
- Validate all request values server-side.
- Enforce authorization at the server boundary for every record.
- Use migrations for schema changes and keep down methods meaningful.
- Store uploaded files on configured Laravel disks, not hard-coded local URLs.
- Keep secrets and populated `.env` files out of Git.
- Add focused feature tests for each route and permission boundary.
- Update API, architecture, database, security, and runbook docs when behavior changes.
