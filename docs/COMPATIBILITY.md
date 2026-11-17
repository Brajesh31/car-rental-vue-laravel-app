# 🧩 Compatibility Matrix

## Runtime baseline
The project manifest indicates Laravel 12 and PHP 8.2+ with Vue 3, Inertia Vue and Vite. Exact supported versions must be confirmed from composer.json, package.json and lockfiles at release time.

| Layer | Baseline | Verification |
|---|---|---|
| PHP | 8.2+ | CI runtime and composer platform |
| Laravel | 12.x | composer.lock |
| Node.js | Use supported LTS compatible with Vite | CI and local build |
| npm | Lockfile-compatible npm | npm ci |
| Database | SQLite local default; MySQL/MariaDB configuration exists | Migration and feature tests |
| Browsers | Current evergreen browsers | Manual/browser automation |

## Policy
Update this matrix when dependency versions change. Test database-specific migrations against every database engine officially supported. Do not infer support from configuration files alone.
