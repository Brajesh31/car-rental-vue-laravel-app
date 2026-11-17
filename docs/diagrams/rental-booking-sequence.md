# 🚗 Rental Booking Sequence

~~~mermaid
sequenceDiagram
  actor User
  participant Vue as BookForm.vue
  participant Route as Laravel web route
  participant Controller as RentalController
  participant DB as Eloquent / Database
  participant Mail as Mail transport
  User->>Vue: Select car and date range
  Vue->>Controller: POST availability request
  Controller->>DB: Check overlapping rentals
  DB-->>Controller: Conflict / available
  Controller-->>Vue: available + calculated total
  User->>Vue: Submit booking
  Vue->>Controller: POST car booking with total_cost
  Controller->>DB: Re-check availability
  Controller->>DB: Create rental with client total_cost
  Controller->>Mail: Send confirmation synchronously
  Controller-->>User: Redirect to rental list
~~~

## Important current defects
- Booking persists client-supplied `total_cost` rather than the server-calculated amount.
- Availability check and insert are not an atomic reservation operation.
- Cancelled rentals are not excluded from the overlap query.
- Confirmation mail is synchronous and its failure handling needs review.

This diagram describes the current code path and does not represent a safe production booking design.
