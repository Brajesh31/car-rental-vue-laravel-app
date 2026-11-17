# 🧰 Error Handling Standards

## HTTP behavior
Use validation responses for invalid input, 401 for unauthenticated access, 403 for authenticated but unauthorized actions, 404 where record existence should not be disclosed, 409 for booking conflicts and 5xx for unexpected server failures.

## User experience
Show clear actionable messages without stack traces, SQL, internal hostnames or secrets. Preserve safe form values and provide retry guidance only when retry is safe.

## Logging
Attach request/correlation IDs and sanitized context. Never log passwords, tokens, cookies, payment credentials or full request bodies containing personal information.

## External services
Use bounded timeouts, retry only transient failures, and avoid retrying non-idempotent actions without idempotency protection.

## Tests
Cover validation errors, missing records, forbidden access, booking conflicts, mail failure and unexpected exceptions.
