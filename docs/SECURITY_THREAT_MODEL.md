# 🛡️ Security Threat Model

## Assets
Customer identity/contact details, password hashes, sessions, rental history, booking dates, vehicle inventory, pricing, secrets, database credentials, mail configuration and uploaded images.

## Trust boundaries
1. Browser to Laravel application.
2. Laravel application to relational database.
3. Application to mail provider and queue worker.
4. CI/repository to deployment environment.
5. Uploaded files to public storage.

## Threat register
| Threat | Example | Required mitigation |
|---|---|---|
| Privilege escalation | Registration submits role=admin | Server-assigned role and allowlisted input |
| Broken object authorization | Customer cancels another rental by ID | Policies and user-scoped queries |
| CSRF | Forged state-changing request | Restore Laravel CSRF middleware |
| Price tampering | Browser submits lower total | Recalculate using trusted server data |
| Race condition | Two overlapping bookings succeed | Transaction, locking strategy and concurrency tests |
| Data exposure | Dashboard serializes all users | Minimal projections and pagination |
| Secret disclosure | Public database export or credentials | Secret scanning, sanitized fixtures and rotation |
| XSS | Untrusted content rendered as HTML | Escaping and controlled sanitization |
| Unsafe upload | Executable or oversized image | MIME/size validation and generated filenames |
| Denial of service | Unbounded queries or login attempts | Rate limits, pagination and monitoring |

## Confirmed source-review concerns
- CSRF validation was configured to be bypassed for all routes.
- Public registration accepted a role value from the request.
- Dashboard data included all users for non-admin dashboard access.
- Rental cancellation loaded records by ID without ownership scope.
- Booking accepted client-provided total cost.
- Repository includes database export artifacts requiring privacy review.

These are source-review observations, not proof of exploitation. Fix and test before production.

## Review cadence
Revisit this model for authentication, authorization, payments, booking, uploads, database or integration changes. Track severity, owner, remediation and verification evidence.
