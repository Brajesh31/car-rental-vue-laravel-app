# 🔍 Code Review Checklist

## Correctness
- [ ] Change matches the linked requirement and acceptance criteria.
- [ ] Edge cases and failure paths are handled.
- [ ] No unrelated behavior is changed.
- [ ] Naming and structure fit the existing Laravel/Vue conventions.

## Security
- [ ] Authorization is enforced on the server for every record.
- [ ] Input is validated and mass assignment is controlled.
- [ ] No secrets, personal data or unsafe logs are added.
- [ ] CSRF, session and upload behavior remain secure.
- [ ] Browser-supplied roles, IDs, prices and statuses are not trusted.

## Data and performance
- [ ] Queries are bounded and paginated.
- [ ] Relationships are eager-loaded where appropriate.
- [ ] Migrations and rollback implications are reviewed.
- [ ] Booking concurrency and transaction behavior are considered.

## UX and accessibility
- [ ] Loading, empty, success and error states exist.
- [ ] Keyboard navigation and focus are correct.
- [ ] Labels, errors and alternative text are present.
- [ ] Responsive behavior is checked.

## Verification
- [ ] Relevant automated tests pass.
- [ ] Frontend production build passes.
- [ ] Documentation and changelog are updated.
- [ ] Reviewer has checked the diff, not only the summary.
