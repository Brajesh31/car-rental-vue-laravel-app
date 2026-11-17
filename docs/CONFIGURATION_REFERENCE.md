# 🧩 Configuration Reference

Configuration is supplied through environment variables and Laravel config files. Never commit a real .env file.

| Group | Common variables | Guidance |
|---|---|---|
| Application | APP_NAME, APP_ENV, APP_KEY, APP_DEBUG, APP_URL | Debug false in production; protect key |
| Database | DB_CONNECTION, DB_HOST, DB_PORT, DB_DATABASE, DB_USERNAME, DB_PASSWORD | Least-privilege credentials |
| Session | SESSION_DRIVER, SESSION_SECURE_COOKIE, SESSION_SAME_SITE | Secure cookies over HTTPS |
| Cache/queue | CACHE_STORE, QUEUE_CONNECTION | Monitor workers and failed jobs |
| Mail | MAIL_MAILER, MAIL_HOST, MAIL_USERNAME, MAIL_PASSWORD | Store credentials in secret manager |
| Frontend | VITE_* | Only expose values safe for browser delivery |

## Local setup
Copy .env.example to .env, install dependencies, generate an application key and migrate a disposable local database.

## Production rules
Set APP_ENV=production and APP_DEBUG=false. Require HTTPS, secure cookies, unique least-privilege database credentials, runtime-injected secrets and monitored queues/scheduler. Rebuild cached configuration after environment changes.

## Rotation
Follow the secret rotation runbook. Rotating APP_KEY can invalidate encrypted data and sessions; plan the impact before changing it.
