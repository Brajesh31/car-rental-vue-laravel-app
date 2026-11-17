# 🔐 Security Review

## Change under review
- PR:
- Commit:
- Reviewer:
- Date:

## Assets and trust boundaries
User account data, sessions, rental records, car images, mail, database exports, environment secrets.

## Threat scenarios
| Threat | Preconditions | Impact | Mitigation | Test evidence |
|---|---|---|---|---|
| Public role escalation | | | | |
| CSRF write | | | | |
| Cross-user rental access | | | | |
| Price tampering | | | | |
| Concurrent date booking | | | | |
| File upload abuse | | | | |
| Session/DB snapshot exposure | | | | |

## Authorization
- [ ] Role is assigned by trusted server logic.
- [ ] Every record operation enforces ownership.
- [ ] Admin privilege is explicit and audited.
- [ ] State mutations use non-GET methods.
- [ ] CSRF validation is enabled.

## Data protection
- [ ] No secrets committed.
- [ ] Database snapshots reviewed/sanitized.
- [ ] Logs exclude credentials and personal data.
- [ ] File uploads validated and safely served.

## Verification and findings
List tests run and distinguish passed from not run.

## Decision
- [ ] Approve
- [ ] Approve with tracked risk
- [ ] Request changes
