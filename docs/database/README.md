# 🗄️ Database Data Dictionary

## Application entities

| Table | Fields / purpose | Relations |
|---|---|---|
| users | name, email, email_verified_at, password, role, remember_token, timestamps | One user has many rentals |
| cars | name, brand, model, car_type, image, year, daily_rent_price, availability, timestamps | One car has many rentals |
| rentals | user_id, car_id, start_date, end_date, total_cost, status, timestamps | Belongs to user and car |
| password_reset_tokens | Email and password-reset token metadata | Framework auth table |
| sessions | Session identifier, user_id, IP, user agent, payload, last activity | Framework session table |
| cache / cache_locks | Cache data and lock metadata | Framework cache tables |
| jobs / job_batches / failed_jobs | Queue job payload and failure metadata | Framework queue tables |

## Relationship diagram

~~~mermaid
erDiagram
 USER ||--o{ RENTAL : creates
 CAR ||--o{ RENTAL : reserved_by
~~~

## Database configuration
The checked-in `.env.example` defaults to SQLite at `database/database.sqlite`. The repository also contains a root-level SQLite database snapshot named `my_car_rental` and a separate MariaDB SQL export named `my_car_rental.sql`. These are not used automatically by the default environment configuration.

## Sensitive artifacts warning
Database snapshots may contain account, session, and rental records. Review and sanitize before public sharing. If real session data or credentials have been exposed, revoke sessions and rotate affected credentials. Removing a file from the latest commit does not remove prior Git history.

## Migration notes
- Initial car and rental schema is defined in `database/migrations/`.
- Image nullable migration is currently a no-op.
- Rental status migration adds a default `Pending` column, but its `down()` method does not remove it.
- Rental foreign keys cascade when associated users or cars are deleted.

Check actual schema with `php artisan migrate:status` and inspect migration state before rollback.
