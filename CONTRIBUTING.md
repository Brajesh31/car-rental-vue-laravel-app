# Contributing

Thank you for contributing to SwiftRide. Changes should improve correctness, security, accessibility, reliability, or documentation. The application handles user accounts, rental records, uploaded car images, and booking emails, so changes to these areas need careful review.

## Before starting

1. Read README.md and the relevant guides in docs.
2. Review existing issues and pull requests for related work.
3. Open an issue before a broad or architectural change to agree on scope.
4. Do not use the committed database snapshots as a source of real user data. Do not include account records, session tokens, credentials, or private customer information in a patch.

The project maintainer is Brajesh Kumar, GitHub account @brajesh31.

## Report a bug

Open a GitHub issue with:

- A clear title and the affected route, controller, model, or Vue page.
- Steps to reproduce and expected versus observed behavior.
- PHP, Composer, Node, browser, and database versions where relevant.
- Sanitized logs or screenshots. Remove emails, names, tokens, addresses, and session data.

Report vulnerabilities through SECURITY.md rather than a public issue.

## Propose a change

Describe the problem, desired outcome, affected role and routes, database impact, migration behavior, and validation plan. For account, role, booking, price, cancellation, upload, or email changes, explain authorization and failure handling.

## Prepare a change

1. Fork the repository and branch from main. Suggested names include fix/booking-ownership, security/restore-csrf, or docs/installation.
2. Keep the change focused and use Laravel, Inertia, Vue, and existing conventions where appropriate.
3. Validate authorization on the server. Hiding a control in Vue does not protect a route.
4. Validate request data and compute prices and state transitions on the server.
5. Make schema changes through migrations. Include a safe rollback and avoid committing local database files or dumps.
6. Preserve CSRF protection for web routes. Do not add broad CSRF exclusions.
7. Update API, database, security, deployment, and troubleshooting documentation when behavior changes.
8. Explain dependencies and update composer.lock or package-lock.json with their respective manifests.

## Review before submitting

Install dependencies and run the checks relevant to your change:

    composer install
    npm ci
    php artisan test
    npm run build

The checked-in test suite contains only framework scaffold tests, so add focused tests for new business behavior where appropriate. For PHP formatting, run:

    ./vendor/bin/pint

For UI changes, inspect relevant routes at desktop and mobile widths and check browser console, network, validation feedback, and keyboard behavior. Do not test against a database containing personal or production data.

## Commit and pull request

Use concise commit subjects that explain the change, for example:

- fix: enforce rental ownership on cancellation
- security: restore CSRF validation
- docs: explain local SQLite setup

Open a pull request against main. Include purpose, affected paths and roles, migrations, validation performed, screenshots for visual changes, and known risks. Link related issues and respond to review comments with focused commits.

## License and conduct

By submitting a contribution, you agree that it may be distributed under the repository's MIT License. You confirm that you have the right to submit the change and any required third-party attribution. Follow CODE_OF_CONDUCT.md.
