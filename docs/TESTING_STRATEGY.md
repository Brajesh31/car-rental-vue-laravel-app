# 🧪 Testing Strategy

## Test pyramid
1. Unit tests for pricing, date intervals and state transitions.
2. Feature tests for HTTP validation, authentication, authorization and database behavior.
3. Integration tests for mail, queue, storage and database adapters.
4. Browser tests for customer journeys and accessibility.
5. Operational smoke tests after deployment.

## Critical regression cases
- Guest cannot access customer/admin routes.
- Customer cannot access another customer's rental by changing an ID.
- Registration cannot create an administrator through request parameters.
- CSRF protection is active for state-changing requests.
- Client-supplied total cost is ignored.
- Cancelled rentals do not block availability.
- Concurrent overlapping bookings cannot both commit.
- Dashboard props do not expose other users' private data.
- Contact form has a valid server endpoint and validation.
- Scheduler invokes the command's actual signature.

## Data isolation
Use factories and synthetic data. Never run destructive tests against production. Use a fresh test database and explicit environment configuration.

## CI evidence
CI should run PHP tests, formatting/static checks where configured, frontend installation and production asset compilation. A test not run must be marked not run, never passed.
