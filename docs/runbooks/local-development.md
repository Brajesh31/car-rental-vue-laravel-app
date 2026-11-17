# ▶️ Local Development Runbook

1. Install supported PHP, Composer, Node/npm, and SQLite PDO support.
2. Copy `.env.example` to `.env` and generate `APP_KEY`.
3. Confirm `database/database.sqlite` exists for the default SQLite configuration.
4. Run `composer install` and `npm ci`.
5. Run `php artisan migrate` on a clean local database.
6. Run `composer run dev` to start Laravel, queue listener, log viewer, and Vite processes.
7. Open the Laravel URL printed in the terminal.
8. Use synthetic accounts and fake car/rental data only.
9. Inspect `storage/logs/laravel.log` after redacting sensitive values.
10. Stop all processes with Ctrl+C.

Do not import tracked root database snapshots or use seeder credentials outside an isolated local setup.
