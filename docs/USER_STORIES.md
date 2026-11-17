# 👥 User Stories and Acceptance Criteria

These stories describe intended behavior. They do not certify current implementation.

## Guest
### US-G01 Browse vehicles
As a visitor, I want to browse vehicles so I can compare options.
- Catalogue is public, unavailable vehicles are labelled, empty/error states are clear.
- Tests cover public access, pagination and missing images.

### US-G02 Register
As a visitor, I want to create an account.
- Server validates fields, hashes passwords and assigns customer role.
- Tests cover duplicate email, invalid input and attempted role injection.

## Customer
### US-C01 Sign in
As a customer, I want secure access to my account.
- Session ID is regenerated after authentication.
- Errors do not disclose whether an account exists.

### US-C02 Book a vehicle
As a customer, I want to choose a vehicle and date range.
- Dates are valid, price is calculated on the server and availability is rechecked inside a transaction.
- Conflicting concurrent bookings cannot both be committed.

### US-C03 View my rentals
As a customer, I want to review my rental history.
- Every query is scoped to the authenticated user.
- No other customer's data is serialized into page props.

### US-C04 Cancel a rental
As a customer, I want to cancel an eligible booking.
- Ownership and allowed status transitions are checked.
- Actor and time are auditable.

## Administrator
### US-A01 Maintain inventory
As an administrator, I want to create, update and retire vehicles.
- All write operations require admin authorization and validate fields and uploads.

### US-A02 Review operations
As an administrator, I want a controlled view of rental operations.
- Data is paginated, sensitive fields are excluded and important actions are logged.

## Definition of done
Acceptance criteria met, authorization tests present, UI keyboard accessible, docs updated, CI green and deployment smoke tests passed.
