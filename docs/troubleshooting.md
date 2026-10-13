# Troubleshooting

## The app cannot connect to the local database

The environment template defaults to SQLite at database/database.sqlite. Create that file, confirm the PDO SQLite extension is enabled, and run php artisan migrate. The root-level my_car_rental SQLite snapshot is a separate tracked file and is not the default path.

The SQL file is a MariaDB export and includes record inserts. Do not import it into a shared or production database without reviewing and sanitizing the data.

## Login or registration fails

Check the validation errors shown by Inertia and inspect Laravel logs after removing personal data. Registration requires name, email, role, password, and confirmation. The current public form accepts a caller-provided role, including admin; do not expose this flow publicly until the role assignment is corrected.

The seeder contains a hard-coded admin account. Keep seeded accounts in a disposable local database and replace those credentials before any shared environment.

## Contact submission returns an error

The page displays a contact form and submits POST /contact, but the route file only defines GET /contact. There is no controller action that validates or sends the message.

## Images fail outside a developer machine

Some Vue pages build image URLs with http://127.0.0.1:8000/storage. That host points to the local machine and will fail in another environment. Use Laravel-generated public storage URLs and confirm php artisan storage:link has been run.

## Uploaded images are not visible

Confirm the public disk is configured, the upload passed validation, storage is writable, and the public/storage link exists. Avoid sharing uploaded files with public or sensitive content.

## A POST request reports a CSRF problem after protection is enabled

The current application disables CSRF checks for every URI. Restore protection and update the custom fetch in BookForm.vue to send a real token. The Blade root view currently has no csrf-token meta element. Inertia requests should continue using Laravel's normal web middleware.

## Rental status automation does not run

routes/console.php schedules rental:check-status, but UpdateRentalStatus declares rental:update-status. Align the names and verify the host scheduler runs php artisan schedule:run every minute.

The RentalList Vue component also calls updateRentalStatus from onMounted even though its function definition is commented out. Check the browser console when a rental reaches the relevant start or end date.

## Cancelling or booking has unexpected results

The cancel route does not check that the signed-in user owns the rental ID. Do not use the current cancellation action with real reservations. Booking saves a client-supplied total and availability checking is not atomic; verify server-calculated price and date conflicts before treating a booking as confirmed.

The overlap query also considers cancelled rentals, so an old cancelled date range may continue to appear unavailable.

## Email is not delivered

The local environment template uses MAIL_MAILER=log. Booking confirmation messages are recorded in Laravel logs. Configure and verify a mail transport before expecting delivery. Cancellation email code exists but is not invoked by the current cancellation controller.

## Artisan scheduler or queue work does not execute

The Composer development command starts a queue listener, but scheduled commands in routes/console.php require a system scheduler in deployment. Confirm the command name matches its registered signature and inspect Laravel logs for failures.
