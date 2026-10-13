# Installation

## Requirements

- PHP 8.2 or later with extensions required by Laravel and the selected database driver
- Composer
- Node.js and npm
- SQLite with PDO SQLite for the default local configuration, or a supported MySQL/MariaDB service
- A mail transport for actual outbound email

## Prepare the application

From the repository root, create a local environment file and install PHP dependencies:

    Copy-Item .env.example .env
    composer install
    php artisan key:generate

The project is also compatible with a POSIX shell; replace Copy-Item with cp .env.example .env.

The environment template selects SQLite by default and expects the database at database/database.sqlite. Create that file if it is missing:

    New-Item -ItemType File -Force database/database.sqlite

Install frontend dependencies and build or start Vite:

    npm ci
    npm run dev

## Create a clean local database

Apply migrations:

    php artisan migrate

The repository seeder creates a hard-coded admin account. Do not run php artisan db:seed outside an isolated local database until the default credentials and role behavior are replaced. The checked-in root-level my_car_rental SQLite database and my_car_rental.sql export contain stored records; they are separate from the default database path. Do not use them for a fresh setup or shared environment without reviewing and sanitizing their contents.

The migration set includes a historical no-op migration and a status migration whose down method does not remove the column. Review migration status and schema before applying rollbacks.

## Run all local services

    composer run dev

The Composer script runs the Laravel development server, queue listener, log viewer, and Vite process concurrently. Open the URL printed by the Laravel server. Stop the processes with Ctrl+C.

If you prefer to start services separately, use php artisan serve, npm run dev, and the required queue/log processes in separate terminals.

## Local storage and email

Car image uploads use Laravel's public storage disk. Create the local public storage link when testing uploads:

    php artisan storage:link

The environment template uses MAIL_MAILER=log. Booking emails are recorded in Laravel logs rather than delivered. Configure a safe local mail catcher or a provider account only after verifying credentials and sender settings.

## Common setup checks

- Confirm .env has a generated APP_KEY and APP_DEBUG is enabled only for local development.
- Confirm database/database.sqlite exists when DB_CONNECTION=sqlite.
- Run php artisan migrate:status to inspect applied migrations.
- If Vite assets fail, confirm npm run dev is active or build assets with npm run build.
- Check storage/logs/laravel.log for server errors, but redact personal data before sharing logs.
- Read SECURITY.md before seeding or connecting any non-disposable data.
