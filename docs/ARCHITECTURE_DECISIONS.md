# 🧠 Architecture Decision Records

Use the template in docs/decisions/adr-template.md for decisions with long-term technical impact.

## Current architecture observations
- Laravel handles routing, authentication, validation and persistence.
- Inertia connects Laravel responses to Vue pages.
- Eloquent models represent users, cars and rentals.
- Vite builds frontend assets.
- Relational storage is used, with SQLite configured for local development and MySQL/MariaDB configuration present.

## Decisions that should be recorded
1. Booking concurrency and reservation locking strategy.
2. Session authentication and role/ownership policy model.
3. Queue driver and notification delivery semantics.
4. Database engine for each deployment environment.
5. Public versus private file storage policy.
6. Migration and rollback strategy.
7. Whether API endpoints are a supported public contract.

Do not record a proposal as an accepted decision until maintainers approve it.
