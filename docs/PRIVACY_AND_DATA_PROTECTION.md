# 🔐 Privacy and Data Protection

## Data categories
The application may process account identifiers, names, email addresses, authentication metadata, vehicle information, rental dates, rental status and operational logs. Verify exact fields against migrations and runtime behavior before publishing a privacy notice.

## Minimization
- Do not serialize complete User models into pages or API responses.
- Return only fields required by the screen.
- Never log passwords, hashes, session tokens, reset tokens or secrets.
- Do not copy production data into development, issue reports or public fixtures.
- Remove personal data from screenshots and bug reports.

## Retention
Define approved retention periods for accounts, rental records, mail logs, application logs and backups. Deletion must account for legal/accounting requirements and relationships. Do not invent retention periods without product/legal approval.

## Database artifacts
The repository contains files named my_car_rental and my_car_rental.sql. Treat them as potentially sensitive until inspected and sanitized. Public exports must contain synthetic fixtures only, never credentials, personal records, tokens or production data. Prefer migrations and seeders over committed live database files.

## Requests and incidents
Establish a documented process for access, correction and deletion requests appropriate to operating jurisdictions. Suspected exposure must be escalated through the incident runbook, evidence preserved, access restricted and compromised credentials rotated.

## Release gate
Do not release real customer data, secrets, debug dumps or unreviewed database exports.
