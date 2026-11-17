# 🧩 Feature Inventory

## ✅ Source-confirmed features

| Capability | Implementation | Notes |
|---|---|---|
| Home/about/contact pages | HomeController + Vue pages | Contact form's POST target currently has no route |
| Login | AuthController + Laravel Auth | Email/password form |
| Signup | UserController + User model | Public role field is accepted, which must be fixed |
| Role middleware | RoleMiddleware | Checks role string from authenticated user |
| Car catalogue | CarController + Cars pages | Admin route group has CRUD paths |
| Car image upload | CarController + public disk | Image validation and storage path |
| Availability check | RentalController::checkAvailability | JSON result with total cost |
| Booking | RentalController::bookCar | Creates rental and sends confirmation mail synchronously |
| Rental listing | RentalController::rentalList | User sees own rentals; admin sees all |
| Cancellation | RentalController::cancelRental | Marks rental Cancelled; ownership not checked |
| Admin status update | RentalController::updateStatus | Controller contains admin role check |
| Status command | UpdateRentalStatus | Command exists; schedule name mismatch |
| Mail templates | app/Mail and resources/views/emails | Booking confirmation and cancellation classes/templates exist |

## ⚠️ Implemented with important limitations

- Signup accepts `role` from public request, including possible admin role.
- CSRF validation is disabled for all URIs in bootstrap configuration.
- Dashboard controller retrieves all User and Car records and sends them to the dashboard route group, which allows both user and admin roles.
- Car deletion and logout are represented by GET routes despite changing state.
- Booking stores client-supplied `total_cost`; do not trust that value.
- Availability check is not atomic with booking creation, so concurrent requests can overlap.
- Date overlap logic includes rentals regardless of cancelled status.
- Cancellation does not verify rental ownership.
- Rental show/edit controller methods are currently stubs.
- Contact view posts to `/contact`, but no POST route exists.
- Scheduler invokes `rental:check-status`, while command signature is `rental:update-status`.
- RentalList calls an update helper whose definition is commented out.
- Image URLs in Vue include a local development host in places.
- Current tests are basic Laravel example tests rather than workflow coverage.

## ❌ Not found in the inspected implementation

- Online payments, refunds, invoices, or payment receipts.
- GPS, map provider, route distance, and live vehicle tracking.
- Driver dispatch or fleet driver management.
- SMS/push notifications.
- Customer reviews/ratings.
- Coupon, tax, insurance, or pricing-rule engine.
- Production admin analytics beyond current dashboard data.
- Deployed hosting configuration or release automation.

## Verification rule

A component existing in the frontend is not proof that its backend route works. Verify route registration, authorization, persistence, validation, mail, and tests before marking a feature complete.
