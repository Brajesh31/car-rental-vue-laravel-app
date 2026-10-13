# Development

## Code map

- routes/web.php maps web paths and middleware.
- app/Http/Controllers contains route actions and Inertia responses.
- app/Models contains User, Car, and Rental.
- app/Http/Middleware/RoleMiddleware.php applies route role checks.
- app/Http/Middleware/HandleInertiaRequests.php shares authenticated-user and flash props.
- resources/js/Pages contains Vue pages resolved by the Inertia app in resources/js/app.js.
- resources/js/Pages/Components contains shared layout and navigation elements.
- database/migrations defines the relational schema; database/seeders contains local seed data.
- app/Mail and resources/views/emails contain booking email code and templates.
- routes/console.php schedules commands from app/Console/Commands.

## Start the development environment

    composer install
    npm ci
    composer run dev

Use a disposable local database and do not import the committed database snapshots into a shared environment. See installation.md.

## Available checks

The repository provides:

    php artisan test
    npm run build
    ./vendor/bin/pint

Composer also defines a test script that runs php artisan test. The checked-in PHPUnit files are framework examples and do not cover role enforcement, user data access, car management, date conflicts, price calculation, cancellation ownership, mail, or the scheduler.

## Routes and authorization

Inspect routes with:

    php artisan route:list

A route's middleware and controller authorization both matter. The Vue UI can hide buttons, but the server must enforce the actor's role and ownership for every request. The current app has a public signup role input, globally disabled CSRF validation, and a cancellation path without an ownership check. Address these before relying on the route structure for real data.

The dashboard page currently receives all users and cars. Keep private account data out of page props unless the requesting role is explicitly authorized to see it.

## Database workflow

Create schema changes through Laravel migrations and keep up/down behavior reversible where practical. Inspect current state with:

    php artisan migrate:status

Do not edit or commit the local SQLite file to record a schema change. Review database.md before changing the users, cars, or rentals schema. The existing root database artifacts contain records and require careful handling.

## Vue and Inertia workflow

Use Inertia forms and requests consistently with server validation. Return field-level validation errors and user-safe flash messages. Do not return raw exception text to the browser. Any new write endpoint needs authorization, CSRF protection, input validation, and tests for allowed and denied actors.

When changing routes, mail, scheduled work, database structure, security behavior, or deployment requirements, update the corresponding guide.

## Configuration and secrets

Copy .env.example to an untracked .env for local settings. Never commit populated environment files, mail credentials, APP_KEY values, or user/session records. Frontend assets are public to the browser and must not contain server secrets.
