# Frequently asked questions

## What is SwiftRide?

A Laravel 12 application with a Vue 3 and Inertia interface for car listings, administrative car management, and rental booking screens.

## How do I run the project locally?

Install PHP and Node dependencies, copy .env.example to .env, generate APP_KEY, create database/database.sqlite, migrate, and start composer run dev. See installation.md.

## Which database does the app use?

The local template defaults to SQLite. The repository also contains a root SQLite database snapshot and a MariaDB SQL export with stored rows. Those are separate from the default local database and should be reviewed and sanitized before use.

## Does signup restrict users to a customer role?

No. The public signup request accepts a role field supplied by the client. This is a critical security issue; the server must assign allowed roles itself before public deployment.

## Are web forms protected against CSRF?

The current bootstrap configuration excludes every route from CSRF validation. Restore Laravel's normal web protection before deploying.

## Can a regular user see or cancel another user's information?

The dashboard currently receives all user records for both allowed roles. The cancellation action changes a rental by ID without checking ownership. Fix access controls before using real user or booking data.

## Is booking price verified by the server?

The availability endpoint calculates a total, but booking creation stores the total sent by the browser. The booking action should recalculate the amount on the server and protect against simultaneous overlapping requests.

## Does the contact form send email?

No. Its Vue component submits POST /contact, but the route table only defines GET /contact. No contact submission handler exists.

## Do booking emails send locally?

The environment template uses the log mailer, so local messages are written to application logs. A real mail transport must be configured and tested for delivery.

## Why do rental status updates fail?

The scheduled command name and command signature differ, and the rental list calls a missing Vue helper. See troubleshooting.md.

## Is the test suite comprehensive?

No. The two checked-in tests are framework examples and do not exercise the rental, authorization, or security behavior.

## How should I report a security issue?

Use the private reporting process in ../SECURITY.md. Do not include database rows, passwords, session IDs, or tokens in public issues.
