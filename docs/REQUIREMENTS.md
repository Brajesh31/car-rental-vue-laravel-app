# 📋 Product Requirements and Scope

## Purpose
This document separates intended behavior from verified implementation. The product aims to let visitors discover vehicles, customers request and manage rentals, and administrators maintain inventory through Laravel and Vue/Inertia.

## Actors
| Actor | Intended capability | Current note |
|---|---|---|
| Guest | View public pages, register, sign in | Public routes exist |
| Customer | Book and manage own rentals | Ownership enforcement needs work |
| Administrator | Manage users and cars | Role middleware and admin routes exist |
| Operator | Monitor booking operations | Separate operator role not confirmed |

## Functional requirements
- **FR-01 Registration:** validate input, hash passwords and assign customer role on the server. Never accept a privileged role from the browser.
- **FR-02 Authentication:** use Laravel session authentication, regenerate session after login and invalidate it on logout.
- **FR-03 Catalogue:** store vehicle details and expose only safe fields publicly.
- **FR-04 Booking:** validate date range, recheck availability atomically and calculate total from trusted server-side pricing.
- **FR-05 Ownership:** customers can access only their own rentals; administrators use explicit privileged policies.
- **FR-06 Notifications:** queue notifications where appropriate, retry safely and avoid unnecessary personal data.
- **FR-07 Administration:** protect inventory writes and record important actions.

## Non-functional requirements
Security, reliability, accessibility, performance, maintainability, privacy, observability and recoverability are release requirements.

## Unconfirmed capabilities
Live GPS tracking, payment settlement, driver dispatch, identity verification, insurance workflows and fleet telematics must not be advertised as implemented without working integrations and tests.

## Acceptance gate
A release candidate must pass tests, security review, accessibility review, migration checks and production smoke tests. Critical authorization, CSRF, role escalation and pricing issues must be closed before public production use.
