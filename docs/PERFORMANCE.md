# ⚡ Performance Guidelines

## Backend
Paginate vehicle and rental listings. Select only fields needed by each page. Eager-load relationships to avoid N+1 queries. Index foreign keys and frequently filtered date/status fields after examining query plans.

## Booking
Keep transactions short. Avoid external mail/API calls while holding database locks. Use a concurrency-safe availability strategy and load test realistic contention.

## Frontend
Use production Vite builds, optimized images, lazy-load non-critical media and avoid shipping duplicate libraries. Measure bundle size before adding dependencies.

## Database
Review slow query logs, connection pool saturation and index usage. Avoid caching authorization-sensitive data without clear invalidation.

## Measurement
Record baseline p50/p95 latency, throughput and error rates before optimization. Do not claim performance improvements without comparable measurements.
