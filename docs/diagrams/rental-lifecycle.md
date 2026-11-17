# 🔄 Rental Status Lifecycle

Current status strings referenced by source include `Pending`, `Confirmed`, `Cancelled`, and `Completed`. There is no central enum or enforced transition matrix.

~~~mermaid
stateDiagram-v2
  [*] --> Pending
  Pending --> Confirmed: Admin status update
  Pending --> Cancelled: Scheduled command / cancellation
  Confirmed --> Completed: Scheduled command after end date
  Confirmed --> Cancelled: User cancellation route
~~~

## Automation mismatch
`routes/console.php` schedules `rental:check-status` but the command declares `rental:update-status`. Align the names before relying on the schedule. The Vue list references a missing update helper too.

Define a state transition policy and validate actors/ownership before expanding status functionality.
