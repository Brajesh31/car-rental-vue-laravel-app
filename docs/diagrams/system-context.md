# 🏛️ System Context

~~~mermaid
flowchart LR
  Browser[Browser] <--> Laravel[Laravel 12 Web Application]
  Laravel <--> Inertia[Inertia Response Layer]
  Inertia <--> Vue[Vue 3 Pages]
  Laravel <--> DB[(SQLite / MySQL-compatible configured DB)]
  Laravel --> Disk[Laravel Filesystem / Public Disk]
  Laravel --> Mail[Configured Mail Transport]
  Laravel --> Scheduler[Laravel Scheduler]
~~~

## Runtime notes
- The Vue application is delivered through Inertia and the Blade root view.
- Vite builds frontend assets.
- The default local environment template selects SQLite.
- Booking confirmation mail currently uses the configured mailer synchronously.
- Scheduled status updates are intended, but schedule and command names currently do not match.

## Boundary notes
No payment provider, geolocation provider, map service, or production hosting platform was found in the inspected source.
