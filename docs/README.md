# 📚 Documentation Hub

This documentation describes the Laravel 12, Vue 3, Inertia and Vite car-rental application. It separates inspected behavior from recommendations and proposed future behavior.

> ⚠️ Documentation expansion does not make the application production-ready. Review the security and booking-integrity blockers in [Project status](PROJECT_STATUS.md) before handling real customer data.

## 🚀 Start here
| Goal | Resource |
|---|---|
| Understand scope | [Requirements](REQUIREMENTS.md), [user stories](USER_STORIES.md), [use cases](USE_CASES.md) |
| Understand architecture | [Project overview](PROJECT_OVERVIEW.md), [architecture](architecture.md), [project structure](PROJECT_STRUCTURE.md) |
| Understand the domain | [Glossary](DOMAIN_GLOSSARY.md), [database guide](database.md), [ER diagram](diagrams/entity-relationship.md) |
| Install and develop | [Installation](installation.md), [development](development.md), [frontend guide](FRONTEND_GUIDE.md), [backend guide](BACKEND_GUIDE.md) |
| Configure | [Configuration reference](CONFIGURATION_REFERENCE.md), [compatibility](COMPATIBILITY.md) |
| Test and review | [Testing](TESTING.md), [testing strategy](TESTING_STRATEGY.md), [quality gates](QUALITY_GATES.md) |
| Secure and protect data | [Security review](SECURITY_REVIEW.md), [threat model](SECURITY_THREAT_MODEL.md), [security checklist](SECURITY_CHECKLIST.md), [privacy](PRIVACY_AND_DATA_PROTECTION.md) |
| Deploy and operate | [Deployment](deployment.md), [environments](DEPLOYMENT_ENVIRONMENTS.md), [operations](OPERATIONS.md), [runbooks](runbooks/README.md) |
| Maintain and release | [Change management](CHANGE_MANAGEMENT.md), [release process](RELEASE_PROCESS.md), [changelog](../CHANGELOG.md) |

## 📖 Product and engineering documentation
- [Requirements and scope](REQUIREMENTS.md)
- [User stories](USER_STORIES.md)
- [Use cases](USE_CASES.md)
- [Domain glossary](DOMAIN_GLOSSARY.md)
- [Project status](PROJECT_STATUS.md)
- [Feature inventory](FEATURES.md)
- [Frontend guide](FRONTEND_GUIDE.md)
- [Backend guide](BACKEND_GUIDE.md)
- [Configuration reference](CONFIGURATION_REFERENCE.md)
- [Error handling](ERROR_HANDLING.md)
- [Email and notifications](EMAIL_AND_NOTIFICATIONS.md)
- [Image uploads](IMAGE_UPLOADS.md)
- [Performance](PERFORMANCE.md)
- [Localization](LOCALIZATION.md)
- [SEO and metadata](SEO_AND_METADATA.md)
- [Accessibility guidance](ACCESSIBILITY.md)
- [Accessibility statement](ACCESSIBILITY_STATEMENT.md)
- [Compatibility matrix](COMPATIBILITY.md)
- [Observability](OBSERVABILITY.md)

## 🛡️ Security, privacy and reliability
- [Security review](SECURITY_REVIEW.md)
- [Threat model](SECURITY_THREAT_MODEL.md)
- [Security checklist](SECURITY_CHECKLIST.md)
- [Privacy and data protection](PRIVACY_AND_DATA_PROTECTION.md)
- [Database retention and privacy](database/retention-and-privacy.md)
- [Disaster recovery](DISASTER_RECOVERY.md)
- [Testing strategy](TESTING_STRATEGY.md)
- [Quality gates](QUALITY_GATES.md)

## 🗺️ Diagrams and assets
- [Diagram index](diagrams/README.md)
- [System context](diagrams/system-context.md)
- [Authentication and roles](diagrams/authentication-role-flow.md)
- [Booking sequence](diagrams/rental-booking-sequence.md)
- [Rental lifecycle](diagrams/rental-lifecycle.md)
- [Booking state machine](diagrams/booking-state-machine.md)
- [Entity relationship](diagrams/entity-relationship.md)
- [Deployment topology](diagrams/deployment-topology.md)
- [Architecture SVG](assets/architecture-overview.svg)
- [Booking flow SVG](assets/booking-flow.svg)
- [Rental lifecycle SVG](assets/rental-lifecycle.svg)
- [Asset policy](assets/README.md)

## 🧰 Templates
- [All project templates](templates/README.md)
- [Feature specification](templates/feature-spec.md)
- [User story](templates/user-story.md)
- [Bug report](templates/bug-report.md)
- [Bug triage](templates/bug-triage.md)
- [API change proposal](templates/api-change.md)
- [Code review checklist](templates/code-review-checklist.md)
- [Feature test matrix](templates/feature-test-matrix.md)
- [Accessibility audit](templates/accessibility-audit.md)
- [Security review](templates/security-review.md)
- [Security incident](templates/security-incident.md)
- [Privacy request intake](templates/privacy-request.md)
- [Database dictionary](templates/data-dictionary.md)
- [Database migration checklist](templates/database-migration-checklist.md)
- [Deployment plan](templates/deployment-plan.md)
- [Rollback plan](templates/rollback-plan.md)
- [Release checklist](templates/release-checklist.md)
- [Release notes](templates/release-notes.md)
- [Incident report](templates/incident-report.md)
- [Postmortem](templates/postmortem.md)
- [Support response](templates/support-response.md)
- [ADR template](templates/architecture-decision-record.md)

## 🔧 Runbooks and API resources
- [Runbook index](runbooks/README.md)
- [Local development](runbooks/local-development.md)
- [Production deployment](runbooks/production-deployment.md)
- [Database backup and restore](runbooks/database-backup-restore.md)
- [Secret rotation](runbooks/secret-rotation.md)
- [Scheduler and queue](runbooks/scheduler-queue.md)
- [Incident response](runbooks/incident-response.md)
- [API reference](api/README.md)
- [OpenAPI draft](api/openapi.yaml)
- [Postman collection](api/examples/car-rental.postman_collection.json)

## 🤝 Repository policies
- [Contributing](../CONTRIBUTING.md)
- [Code of Conduct](../CODE_OF_CONDUCT.md)
- [Security policy](../SECURITY.md)
- [Support](../SUPPORT.md)
- [License](../LICENSE)
- [Changelog](../CHANGELOG.md)
- [Roadmap](../ROADMAP.md)

## Documentation accuracy rules
Distinguish current behavior from proposed behavior. Do not call a booking paid unless payment settlement is integrated. Do not claim an email was delivered merely because it was logged. Do not claim scheduler automation works until its command and schedule are aligned. A framework example test is not proof of booking, authorization or concurrency correctness.
