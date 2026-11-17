# 🧭 Use Cases

## UC-01 Register customer
**Actor:** Guest. **Precondition:** Registration page is available.
1. Guest submits registration details.
2. Server validates fields and uniqueness.
3. Server hashes password and assigns customer role.
4. Account is created and safe confirmation shown.
**Alternates:** Duplicate email, invalid input or database failure.
**Invariant:** Request-supplied role is ignored or rejected.

## UC-02 Authenticate
**Actor:** Registered user.
1. Submit credentials.
2. Validate and authenticate server-side.
3. Regenerate session identifier.
4. Redirect to authorized page.
**Failure:** Generic error; no privileged state retained.

## UC-03 Book vehicle
**Actor:** Customer. **Preconditions:** Authenticated customer and bookable vehicle.
1. Select vehicle and dates.
2. Validate date range.
3. Begin database transaction.
4. Lock/recheck inventory or reservation rows.
5. Calculate cost from trusted server-side rate.
6. Create pending rental and commit.
7. Dispatch notification after commit.
**Alternates:** Unavailable vehicle, invalid dates, stale price or transaction conflict.
**Invariant:** Overlapping active rentals for one vehicle cannot both be accepted.

## UC-04 Cancel rental
Load through authorized scope, verify ownership and transition, persist cancellation, record actor/time and dispatch notification. Do not disclose another user's record.

## UC-05 Maintain vehicle
Admin opens inventory, edits validated fields, uploads allowed image to controlled storage and verifies asset URL. Failed upload must not leave inconsistent data.

## Scope boundary
Payment settlement, identity verification, GPS tracking and dispatch are not implemented use cases until services and tests exist.
