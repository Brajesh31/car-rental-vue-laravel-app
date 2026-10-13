# Roadmap

This roadmap describes candidate work based on the current repository. It is not a promised schedule. Discuss scope and compatibility in an issue before starting a substantial change.

## Priority 1: secure the current application

- Restore Laravel CSRF validation for web routes and remove the wildcard exclusion.
- Restrict public signup to a safe role assigned on the server.
- Remove hard-coded admin credentials from seed data and define a safe local bootstrap process.
- Enforce rental ownership for cancellation and detail access.
- Recompute booking totals on the server and protect availability checks and booking creation with a transaction/locking strategy.
- Change state-changing GET routes, especially car deletion and logout, to appropriate methods and authorization.
- Avoid rendering all user records to regular dashboard users.
- Remove or sanitize tracked database snapshots and assess whether their records need revocation or rotation.
- Validate and limit state-update values and avoid returning raw exception details.

## Priority 2: complete existing workflows

- Add a server-side contact message endpoint or remove the non-functional submission action.
- Implement rental detail and edit behavior or remove their links.
- Align the scheduled task with the registered command signature and add observability for failures.
- Fix the front-end call to the missing status-update helper.
- Resolve hard-coded localhost image URLs and make upload URL generation environment-independent.
- Complete cancellation email behavior if it is part of the supported workflow.
- Add feature tests for guest access, roles, user privacy, booking price calculation, date overlap, ownership, and cancellation.

## Priority 3: maintainability and operations

- Document database selection, local storage setup, email, queues, schedule runner, and uploaded-file lifecycle.
- Add deployment automation, backups, monitoring, rate limiting, and retention controls suited to the target service.
- Review validation, accessibility, responsive behavior, and error messages across all Inertia pages.
- Keep dependencies and framework configuration updated through reviewed changes.

## Propose a roadmap item

Open an issue that explains the user need, affected routes and roles, data involved, acceptance criteria, migration impact, and operational requirements. Priorities may change after maintainer review.
