# 🔁 Booking State Machine

The current application has a status field. The exact supported transition set must be enforced in backend code and tests before this diagram is treated as a final workflow contract.

~~~mermaid
stateDiagram-v2
  [*] --> Pending
  Pending --> Confirmed: authorized confirmation
  Pending --> Cancelled: owner/admin cancellation
  Confirmed --> Active: rental begins
  Confirmed --> Cancelled: policy permits
  Active --> Completed: return recorded
  Cancelled --> [*]
  Completed --> [*]
~~~

## Rules to implement
- Validate transitions on the server.
- Record actor and timestamp for administrative transitions.
- A cancelled booking must not block vehicle availability.
- Reject invalid or repeated transitions safely.
- Do not infer payment settlement from a status update.
