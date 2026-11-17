# 🧪 Test Plan

## Change
- Issue/PR:
- Commit SHA:

## Environment
- PHP:
- Laravel:
- Node:
- Database:
- Browser:

## Test matrix
| ID | Actor | Scenario | Expected result | Result |
|---|---|---|---|---|
| AUTH-01 | Guest | Access protected page | Redirect to login | Not run |
| AUTH-02 | Guest | Submit signup with admin role | Privilege escalation rejected | Not run |
| CSRF-01 | Guest/User | POST without token | Request rejected | Not run |
| RENT-01 | User | Book available car | Rental created with server total | Not run |
| RENT-02 | User | Book conflicting dates | Rejected | Not run |
| RENT-03 | User | Cancel other user's rental | Rejected | Not run |
| RENT-04 | Concurrent users | Same car/date range | Only one booking commits | Not run |
| MAIL-01 | User | Confirm booking mail | Expected message dispatched | Not run |
| SCHED-01 | Scheduler | Invoke configured command | Command resolves and updates expected rentals | Not run |

## Commands run
Record exact commands and exit codes.

## Evidence
Link sanitized logs or screenshots.

## Known gaps

## Approval
