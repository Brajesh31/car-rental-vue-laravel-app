# 📈 Observability and Monitoring

## Signals
Monitor HTTP availability, latency, 4xx/5xx rates, authentication failures, booking attempts/conflicts, database saturation, slow queries, queue depth, failed jobs, scheduler heartbeat, storage capacity and mail failures.

## Logging
Use structured logs where possible. Include timestamp, severity, environment, request/correlation ID and safe operation context. Exclude passwords, cookies, authorization headers, reset links, credentials and unnecessary personal data.

## Alerts
Every alert needs an owner, severity, threshold, runbook link and escalation path. Do not classify expected validation errors as system outages.

## Health checks
Health endpoints should disclose minimal information. Never expose environment variables, internal hostnames, dependency versions or exception traces publicly.

## Incident evidence
Preserve relevant logs and deployment identifiers before rotation or deletion. Follow the incident response runbook.
