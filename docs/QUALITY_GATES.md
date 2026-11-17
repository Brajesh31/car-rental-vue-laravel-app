# ✅ Repository Quality Gates

A project is not complete merely because documentation files exist. These gates assess actual readiness.

## Pull request
- [ ] Scope and acceptance criteria are clear.
- [ ] Tests cover success, validation failure and authorization failure.
- [ ] PHP formatting and frontend build pass.
- [ ] No secrets, customer data or database exports are introduced.
- [ ] Migrations are reversible or recovery is documented.
- [ ] Accessibility and responsive behavior are reviewed.
- [ ] Docs, changelog and diagrams are updated.
- [ ] Review comments are resolved.

## Release
- [ ] CI is green on the exact release commit.
- [ ] Security findings are triaged.
- [ ] Staging smoke tests pass.
- [ ] Backup and rollback are verified.
- [ ] Production settings are safe.
- [ ] Queue and scheduler are healthy.
- [ ] Monitoring and incident ownership are defined.

## Known source-review blockers
Restore CSRF protection; prevent role escalation; scope rental access to owner; calculate price server-side; restrict dashboard data; make availability checks concurrency-safe; align scheduler command signature; implement/remove contact POST behavior; review public database artifacts for real data.
