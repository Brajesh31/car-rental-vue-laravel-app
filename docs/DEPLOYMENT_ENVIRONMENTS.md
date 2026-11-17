# 🚀 Deployment Environments

| Environment | Purpose | Data |
|---|---|---|
| Local | Developer workflow | Synthetic |
| CI | Automated verification | Ephemeral test database |
| Staging | Production-like validation | Synthetic/anonymized |
| Production | Live service | Authorized operational data |

~~~mermaid
flowchart TD
  A[Feature branch] --> B[Pull request]
  B --> C[CI tests and frontend build]
  C --> D{Checks pass?}
  D -- No --> E[Fix and rerun]
  D -- Yes --> F[Review and merge]
  F --> G[Deploy staging]
  G --> H[Smoke and migration checks]
  H --> I{Approved?}
  I -- No --> J[Hold and investigate]
  I -- Yes --> K[Production deployment]
  K --> L[Monitor and record release]
~~~

## Deployment requirements
Use supported PHP and extensions, install production Composer dependencies, build frontend assets from lockfile, point web root to Laravel public/, provide writable storage/cache, enforce HTTPS and configure queue/scheduler where used.

## Rollback
Application rollback must remain compatible with the database schema. Irreversible migrations need a separate recovery plan. Follow production deployment and database restore runbooks.
