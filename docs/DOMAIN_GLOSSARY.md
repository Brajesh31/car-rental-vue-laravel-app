# 📚 Domain Glossary

| Term | Definition |
|---|---|
| Vehicle / Car | Rentable inventory item represented by the current Car model |
| Customer | Authenticated user requesting a rental |
| Administrator | Privileged user allowed to manage inventory and approved records |
| Rental | Reservation record for a vehicle and date range |
| Rental period | Start date through end date; inclusivity must be consistent |
| Daily rate | Trusted per-day price stored for a vehicle |
| Total cost | Amount calculated server-side for the rental period |
| Availability | Whether a vehicle can be booked for an interval |
| Overlap | Intersection between two rental date intervals |
| Pending | Rental awaiting next business decision or lifecycle transition |
| Cancelled | Rental no longer active and therefore not blocking availability |
| Inertia | Adapter connecting Laravel responses to Vue page components |
| CSRF | Cross-site request forgery, mitigated by Laravel middleware and tokens |
| Authorization | Server-side decision about whether an actor may perform an action |
| Queue | Background processing system for notifications and deferred work |
| Scheduler | Laravel mechanism for recurring commands |

Use current code names when documenting implementation. Record lasting renames through an ADR and migration plan.
