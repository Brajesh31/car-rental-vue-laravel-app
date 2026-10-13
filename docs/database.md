# Database

## Connections and local default

The committed .env.example selects SQLite and config/database.php defaults to database/database.sqlite. That file is not checked in; create a clean local file before running migrations.

The repository also tracks two separate database artifacts:

- my_car_rental is a SQLite database file at the repository root.
- my_car_rental.sql is a MariaDB/phpMyAdmin export.

The SQL export includes insert data for users, sessions, cars, and rentals. Treat both snapshots as potentially sensitive. They are not migration files, do not import them into production, and do not redistribute them without reviewing and sanitizing their records. If records belong to real people, revoke exposed sessions and rotate credentials as appropriate. Git history may retain prior versions.

## Application tables

| Table | Main fields and purpose |
| --- | --- |
| users | Name, unique email, verified timestamp, password hash, free-form role, remember token, timestamps |
| cars | Name, brand, model, type, image path, year, daily rental price, availability flag, timestamps |
| rentals | User and car foreign keys, start/end dates, total cost, status, timestamps |
| password_reset_tokens | Email and reset token metadata |
| sessions | Session ID, optional user ID, IP address, user agent, payload, last activity |
| cache, cache_locks | Laravel database cache support |
| jobs, job_batches, failed_jobs | Laravel queue support |

User and Car each have many Rentals. Rental belongs to one User and one Car. Rental foreign keys cascade when a related user or car is deleted.

## Migration behavior

The initial car migration defines the car fields. A later migration named to make the image nullable contains no operations. The migration adding rental status defaults it to Pending, but its down method does not remove that column. Review migration status and the actual schema before rollback or reapplication.

Use migrations as the source for intentional schema changes. Do not edit database snapshot files to represent a schema update.

## Data and integrity concerns

- User role is a string rather than a constrained role type.
- Rental status is a string; validate allowed transitions in the application.
- The booking controller currently persists a total supplied by the browser instead of calculating it from the selected car and dates.
- Availability checks and booking insertion are separate operations without a database lock, so concurrent requests can conflict.
- The date conflict query does not exclude cancelled rentals.
- Car or user deletion cascades to rentals, which should be considered before removing records.
- Database/session snapshots and uploaded images need explicit backup, retention, access, and deletion rules before production.
