# 🔒 Data Retention and Privacy Considerations

## Data handled

- User names, email addresses, password hashes, roles.
- Session identifiers, IP addresses and user-agent strings in the sessions table.
- Rental dates, linked customer and car identifiers, total cost, status.
- Car images and descriptive metadata.
- Mail content related to booking confirmations.

## Current repository behavior

No explicit data retention, anonymization, account export, or deletion workflow is documented in application source. User/car deletion cascades rental records according to the database foreign keys. Session handling uses Laravel's configured session driver.

## Required future policy

Before production, define purpose and minimum collection for each field, authorized access, retention and deletion schedule, backup expiry, user rights workflow, image lifecycle, and incident response. Do not invent statutory retention periods or claim compliance without legal review.

## Operational handling

- Keep database dumps private and encrypted.
- Exclude sessions and personal records from public fixtures.
- Redact logs before attaching them to tickets.
- Limit access to uploaded images and rental data.
- Verify deletion behavior across database backups and storage.
